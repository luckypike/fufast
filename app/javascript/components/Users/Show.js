import React from 'react'
import PropTypes from 'prop-types'

import page from '../Page.module.css'

Show.propTypes = {
  user: PropTypes.object.isRequired,
  orders: PropTypes.array.isRequired
}

export default function Show ({ user, orders }) {
  return (
    <div className={page.root}>
      <div className={page.text}>
        <h1>
          {user.email}
        </h1>

        <div>
          {orders.map(order =>
            <div key={order.id}>
              Заказ № {order.id}
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
