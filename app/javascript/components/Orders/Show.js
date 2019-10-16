import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import axios from 'axios'

import { path } from '../Routes'
import { currency } from '../Price'

import page from '../Page.module.css'
import styles from './Show.module.css'

Show.propTypes = {
  order: PropTypes.object.isRequired
}

export default function Show ({ order }) {
  const [items, setItems] = useState([])

  useEffect(() => {
    const _fetch = async () => {
      const { data } = await axios.get(path('order_path', { id: order.id, format: 'json' }))
      setItems(data.order.items)
    }

    _fetch()
  }, [])

  return (
    <div className={page.root}>
      <div className={page.text}>
        <h1>
          Заказ № {order.id}
        </h1>

        <div>
          {items.map(item =>
            <div key={item.id} className={styles.item}>
              <div className={styles.image}>
                {item.product.image &&
                  <img src={item.product.image.proxy} />
                }
              </div>

              <div className={styles.data}>
                <div className={styles.title}>
                  {item.product.title}
                </div>

                <div className={styles.price}>
                  {currency(item.price * item.quantity)}
                  {item.quantity > 1 && ` (${currency(item.price)} * ${item.quantity})`}
                </div>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
