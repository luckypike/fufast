import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import axios from 'axios'

import { Errors } from '../Form'
import Products from './Index/Products'

import page from '../Page.module.css'
import form from '../Form.module.css'
import buttons from '../Buttons.module.css'

Cart.propTypes = {
  token: PropTypes.string.isRequired,
  products: PropTypes.array.isRequired,
  user: PropTypes.object
}

export default function Cart ({ token, user, products }) {
  const [values, setValues] = useState()
  const [errors, setErrors] = useState({})

  useEffect(() => {
    if (user) setValues({ ...values, user_id: user.id })
  }, [user])

  const handleSubmit = async e => {
    e.preventDefault()

    await axios.post('/orders', {
      order: values,
      authenticity_token: token
    }).then(res => {
      window.location = res.headers.location
    }).catch((error) => {
      setErrors(error.response.data)
    })
  }

  const handleUserChange = (userValues) => {
    setValues({ ...values, user_attributes: userValues })
  }

  const hasProducts = () => (products && products.length > 0)

  return (
    <div className={page.root}>
      <div className={page.text}>
        <h1>
          Корзина
        </h1>

        {hasProducts() &&
          <div>
            <Products products={products} />

            <form onSubmit={handleSubmit} className={form.root}>
              {user &&
                <div>{user.name}</div>
              }

              {!user && <User errors={errors} onValuesChange={handleUserChange} /> }

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
          <p>Ваша корзина пока пуста</p>
        }
      </div>
    </div>
  )
}

User.propTypes = {
  onValuesChange: PropTypes.func,
  errors: PropTypes.object
}

function User ({ onValuesChange, errors }) {
  const [values, setValues] = useState({
    email: '',
    phone: '',
    name: '',
    lastname: ''
  })

  useEffect(() => {
    onValuesChange && onValuesChange(values)
  }, [values])

  const handleChange = ({ target: { name, value } }) => {
    setValues({ ...values, [name]: value })
  }

  return (
    <>
      <div className={form.el}>
        <label>
          <div className={form.label}>
            Электронная почта
          </div>

          <div className={form.input}>
            <input
              type="email"
              name="email"
              value={values.email}
              onChange={handleChange}
            />
          </div>
        </label>

        <Errors errors={errors['user.email']} />
      </div>

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