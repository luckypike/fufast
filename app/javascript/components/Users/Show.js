import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import axios from 'axios'

import { path } from '../Routes'
import Orders from '../Orders/List'

import page from '../Page.module.css'

Show.propTypes = {
  user: PropTypes.object.isRequired
}

export default function Show ({ user }) {
  const [orders, setOrders] = useState([])

  useEffect(() => {
    const _fetch = async () => {
      const { data } = await axios.get(path('user_path', { id: user.id, format: 'json' }))
      setOrders(data.orders)
    }

    _fetch()
  }, [])

  return (
    <div className={page.root}>
      <div className={page.text}>
        <h1>
          {user.title}
        </h1>

        <div>
          <Orders orders={orders} />
        </div>
      </div>
    </div>
  )
}
