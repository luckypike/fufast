import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import axios from 'axios'
import classNames from 'classnames'
import update from 'immutability-helper'

import { path } from '../Routes'
import { Errors } from '../Form'
import { currency } from '../Price'
import Account from './Account'

import styles from './Index.module.css'
import page from '../Page.module.css'
import form from '../Form.module.css'
import buttons from '../Buttons.module.css'

Cart.propTypes = {
  token: PropTypes.string.isRequired,
  user: PropTypes.object
}

export default function Cart ({ token, user }) {
  const [items, setItems] = useState([])

  useEffect(() => {
    _fetch()
  }, [])

  const _fetch = async () => {
    const { data } = await axios.get(path('cart_path', { format: 'json' }))
    setItems(data.items)
  }

  const [values, setValues] = useState()
  const [errors, setErrors] = useState({})

  useEffect(() => {
    if (user) {
      setValues({
        ...values,
        user_id: user.id,
        user_attributes: {
          name: user.name,
          lastname: user.lastname,
          phone: user.phone
        }
      })
    }
  }, [user])

  const handleSubmit = async e => {
    e.preventDefault()

    await axios.post('/orders', {
      order: values,
      authenticity_token: token
    }).then(res => {
      if (window) window.location = res.headers.location
    }).catch((error) => {
      setErrors(error.response.data)
    })
  }

  const handleUserChange = (userValues) => {
    setValues({ ...values, user_attributes: userValues })
  }

  const hasProducts = () => (items && items.length > 0)

  const handleChange = (i, quantity) => {
    let v = parseInt(quantity)

    if (Number.isNaN(v)) {
      v = 0
    }

    if (v < 0) v = 0

    const newItems = update(items, {
      [i]: {
        quantity: {
          $set: v
        }
      }
    })

    setItems(newItems)
  }

  const handleDestroy = async item => {
    await axios.delete(
      path('cart_destroy_path', { id: item.product.id }),
      {
        params: {
          authenticity_token: token
        }
      }
    )

    _fetch()
  }

  return (
    <div className={page.root}>
      <div className={page.text}>
        <div className={styles.root}>
          <Account user={user} />

          <h1>
            Корзина
          </h1>

          {hasProducts() &&
            <div>
              <div>
                {items.map((item, i) =>
                  <div key={item.uuid} className={styles.item}>
                    <a href={path('product_catalog_path', { id: item.product.id })} className={styles.image}>
                      {item.product.image &&
                        <img src={item.product.image.product.small} />
                      }
                    </a>

                    <div className={styles.data}>
                      <a href={path('product_catalog_path', { id: item.product.id })} className={styles.title}>
                        {item.product.title}
                      </a>

                      <div className={styles.size}>
                        {item.size}
                      </div>

                      <div className={styles.price}>
                        {currency(item.price * item.quantity)}
                        {/* {item.quantity > 1 && ` (${currency(item.price)} * ${item.quantity})`} */}
                      </div>

                      <div className={styles.buttons}>
                        <div className={styles.input}>
                          <input
                            onChange={({ target: { value } }) => handleChange(i, value)}
                            type="text"
                            value={item.quantity === 0 ? '' : item.quantity}
                            placeholder="0"
                          />
                        </div>
                        <div className={classNames(styles.button, styles.minus)}>
                          <button onClick={() => handleChange(i, item.quantity - 1)}>-</button>
                        </div>
                        <div className={classNames(styles.button, styles.plus)}>
                          <button onClick={() => handleChange(i, item.quantity + 1)}>+</button>
                        </div>

                        {item.quantity > 1 &&
                          <div className={styles.piece}>
                            {currency(item.price)} / шт.
                          </div>
                        }
                      </div>
                    </div>

                    <div className={styles.destroy} onClick={() => handleDestroy(item)}>
                      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                        <path d="M18 5h-4V3a1.9 1.9 0 0 0-1.7-2H7.8A1.9 1.9 0 0 0 6 3v2H2a1 1 0 1 0 0 2h1l1 10c.125 1.1.895 2 2
                          2h8c1.067.001 1.891-.9 2-1.9L17 7h1a1 1 0 0 0 0-2zM8 3h4v2H8V3zm6 14H6L5 7h10l-1 10z">
                        </path>
                      </svg>
                    </div>
                  </div>
                )}
              </div>

              <form onSubmit={handleSubmit} className={form.root}>
                <User init={user || !user} errors={errors} onValuesChange={handleUserChange} />

                {errors.email_exists && errors.email_exists === true &&
                  <div>
                    <p>
                      Такая почта уже ранее использовалась для заказов.
                    </p>

                    <a href="/login">Войти или восстановить доступ</a>
                  </div>
                }
                <button className={buttons.main} type="submit">Оформить заказ</button>
              </form>
            </div>
          }

          {!hasProducts() &&
            <>
              <p>
                Ваша корзина пока пуста. {!user && 'Войдите чтобы посмотреть вашу историю заказов или сохраненные товары.'}
              </p>

              {!user &&
                <div className={styles.login}>
                  <a href={path('login_path')} className={buttons.main}>
                    Войти
                  </a>
                </div>
              }
            </>
          }
        </div>
      </div>
    </div>
  )
}

User.propTypes = {
  onValuesChange: PropTypes.func,
  errors: PropTypes.object,
  init: PropTypes.object
}

function User ({ onValuesChange, errors, init }) {
  const [values, setValues] = useState({
    ...(init.email ? {} : { email: '' }),
    phone: init.phone || '',
    name: init.name || '',
    lastname: init.lastname || ''
  })

  useEffect(() => {
    onValuesChange && onValuesChange(values)
  }, [values])

  const handleChange = ({ target: { name, value } }) => {
    setValues({ ...values, [name]: value })
  }

  return (
    <>
      {values.email &&
        <div className={form.el}>
          <label>
            <div className={form.label}>
              Электронная почта
            </div>

            <div className={form.input}>
              <input
                placeholder="Обязательно заполните..."
                type="email"
                name="email"
                value={values.email}
                onChange={handleChange}
              />
            </div>
          </label>

          <Errors errors={errors['user.email']} />
        </div>
      }

      <div className={form.el}>
        <label>
          <div className={form.label}>
            Имя
          </div>

          <div className={form.input}>
            <input
              type="text"
              name="name"
              value={values.name}
              onChange={handleChange}
            />
          </div>
        </label>

        <Errors errors={errors['user.name']} />
      </div>

      <div className={form.el}>
        <label>
          <div className={form.label}>
            Фамилия
          </div>

          <div className={form.input}>
            <input
              type="text"
              name="lastname"
              value={values.lastname}
              onChange={handleChange}
            />
          </div>
        </label>

        <Errors errors={errors['user.lastname']} />
      </div>

      <div className={form.el}>
        <label>
          <div className={form.label}>
            Телефон
          </div>

          <div className={form.input}>
            <input
              placeholder="Обязательно заполните..."
              type="tel"
              name="phone"
              value={values.phone}
              onChange={handleChange}
            />
          </div>
        </label>

        <Errors errors={errors['user.phone']} />
      </div>
    </>
  )
}
