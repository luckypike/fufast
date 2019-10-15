import React from 'react'
import PropTypes from 'prop-types'

import { currency } from '../Price'

import styles from './List.module.css'

List.propTypes = {
  orders: PropTypes.array.isRequired
}

export default function List ({ orders }) {
  return (
    <div>
      {orders.map(order =>
        <div key={order.id} className={styles.order}>
          <div className={styles.header}>
            <div className={styles.number}>
              Заказ № {order.id}
            </div>

            <div className={styles.date}>
              {order.date}
            </div>
          </div>

          <div>
            <p>
              Товаров: {order.items.length}, сумма заказа: {currency(order.price)}
            </p>
          </div>
        </div>
      )}
    </div>
  )
}
