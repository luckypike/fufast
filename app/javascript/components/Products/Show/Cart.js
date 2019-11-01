import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import axios from 'axios'
import update from 'immutability-helper'
import classNames from 'classnames'
import { currency } from '../../Price'

import styles from './Cart.module.css'
import buttons from '../../Buttons.module.css'

Cart.propTypes = {
  product: PropTypes.object.isRequired,
  token: PropTypes.string.isRequired
}

export default function Cart ({ product, token }) {
  const [variants, setVariants] = useState()
  const [check, setCheck] = useState(false)
  const [send, setSend] = useState(false)
  const [add, setAdd] = useState(false)

  useEffect(() => {
    const newVariants = []

    const height = product.properties.find(prop => prop.id === 107)
    let size = product.properties.find(prop => prop.id === 104)
    if (!size) size = product.properties.find(prop => prop.id === 103)
    if (!size) size = product.properties.find(prop => prop.id === 105)

    if (height && size) {
      size.items.filter(i => size.values.map(v => parseInt(v.value)).includes(i.id)).forEach(sv => {
        height.items.filter(i => height.values.map(v => parseInt(v.value)).includes(i.id)).forEach(hv => {
          newVariants.push({
            title: `${sv.value} / ${hv.value}`,
            size_id: size.id,
            size: sv.id,
            height_id: height.id,
            height: hv.id,
            q: 0
          })
        })
      })
    } else if (size) {
      size.items.filter(i => size.values.map(v => parseInt(v.value)).includes(i.id)).forEach(i => {
        newVariants.push({
          title: i.value,
          size_id: size.id,
          size: i.id,
          q: 0
        })
      })
    } else if (!size && !height) {
      newVariants.push({
        q: 0
      })
    }

    setVariants(newVariants)
  }, [product.properties])

  const handleChange = (i, q) => {
    if (q > 0) { setCheck(false) }

    let v = parseInt(q)

    if (Number.isNaN(v)) {
      v = 0
    }

    if (v < 0) v = 0

    const newVariants = update(variants, {
      [i]: {
        q: {
          $set: v
        }
      }
    })

    setVariants(newVariants)
  }

  const handleAddToCart = async () => {
    if (result < 1) {
      setCheck(true)
      setAdd(false)
    }

    if (result > 0) {
      setSend(true)
    }

    await axios.post('/cart', {
      cart: {
        product_id: product.id,
        variants
      },
      authenticity_token: token
    })

    setTimeout(() => setSend(false), 1000)

    if (result > 0) {
      setTimeout(() => setAdd(true), 1100)
    }
  }

  if (!variants) return null

  const s = variants.map(variant => variant.q)
  const result = s.reduce(function (sum, current) {
    return sum + current
  }, 0)

  return (
    <div className={styles.root}>
      <div className={styles.variants}>
        {variants && variants.map((variant, i) =>
          <div className={styles.variant} key={i}>
            <div className={styles.label}>
              {variant.title || 'Без размера' } ({variant.q})
            </div>

            <div className={styles.buttons}>
              <div className={styles.input}>
                <input
                  onChange={({ target: { value } }) => handleChange(i, value)}
                  type="text"
                  value={variant.q === 0 ? '' : variant.q}
                  placeholder="0"
                />
              </div>
              <div className={classNames(styles.button, styles.minus)}>
                <button onClick={() => handleChange(i, variant.q - 1)}>-</button>
              </div>
              <div className={classNames(styles.button, styles.plus)}>
                <button onClick={() => handleChange(i, variant.q + 1)}>+</button>
              </div>
            </div>
          </div>
        )}
      </div>

      <div className={styles.order}>
        <div className={styles.order_price}>
          {product.price && product.price.length > 0 &&
            <>
              {result <= 1 &&
                <div className={styles.ppi}>
                  <span>Цена за штуку</span>
                  <div className={styles.price}>
                    {currency(product.price)}
                  </div>
                </div>
              }

              {result > 1 &&
                <div className={styles.po}>
                  <span>Общая стоимость</span>
                  <div className={styles.price}>
                    {currency(product.price * result)}
                  </div>
                </div>
              }
            </>
          }

          {!product.price && variants.length === 0 &&
            <div className={styles.not_available}>
              Товар временно недоступен для покупки, позвоните по телефону для уточнения.
            </div>
          }

          {product.price === null && variants.length > 0 &&
            <div className={styles.not_available}>
              Цена будет уточнена после обработки заказа
            </div>
          }
        </div>

        <button onClick={handleAddToCart} className={classNames(buttons.main, styles.cart)} disabled={send}>
          {!send ? 'В корзину' : 'Добавляем...'}
        </button>
      </div>

      {check &&
        <div className={styles.check}>Необходимо выбрать размер, чтобы сделать заказ.</div>
      }

      {add && !send &&
        <div className={styles.success}>Товар успешно добавлен в корзину</div>
      }
    </div>
  )
}
