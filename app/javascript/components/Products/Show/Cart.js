import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import axios from 'axios'
import update from 'immutability-helper'
import classNames from 'classnames'

import styles from './Cart.module.css'
import buttons from '../../Buttons.module.css'

Cart.propTypes = {
  product: PropTypes.object.isRequired,
  token: PropTypes.string.isRequired
}

export default function Cart ({ product, token }) {
  const [variants, setVariants] = useState()

  // const [variants, dispatch] = useReducer(variantsReducer, [], () => {
  //   return [{ 104: 40, q: 3 }, { 104: 41, q: 0 }]
  // })

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
    }

    // newVariants = [{ 104: 40, q: 3 }, { 104: 41, q: 0 }]
    setVariants(newVariants)
  }, [product.properties])

  const currency = (source) => {
    const float = parseFloat(source)

    const formatter = new Intl.NumberFormat('ru-RU', {
      minimumFractionDigits: Math.round(float) === float ? 0 : 2,
      maximumFractionDigits: Math.round(float) === float ? 0 : 2
    })

    let value = formatter.format(source)
    if (source < 10000) value = value.replace(/\s/, '')
    return `${value} ₽`
  }

  const handleChange = (i, q) => {
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
    await axios.post('/cart', {
      cart: {
        product_id: product.id,
        variants
      },
      authenticity_token: token
    })
  }

  if (!variants) return null

  const s = variants.map(variant => variant.q)
  var result = s.reduce(function (sum, current) {
    return sum + current
  }, 0)

  return (
    <div className={styles.root}>
      <div className={styles.variants}>
        {variants && variants.map((variant, i) =>
          <div className={styles.variant} key={i}>
            <div className={styles.label}>
              {variant.title} ({variant.q})
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

        {!product.price &&
          <div className={styles.not_available}>
            Товар временно недоступен для покупки, позвоните по телефону для уточнения.
          </div>
        }

        {variants.length !== 0 &&
          <button onClick={handleAddToCart} className={classNames(buttons.main, styles.cart)}>
            В корзину
          </button>
        }
      </div>
    </div>
  )
}
