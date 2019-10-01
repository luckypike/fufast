import React, { useState, useEffect } from 'react'
// import PropTypes from 'prop-types'
import axios from 'axios'

export default function Index () {
  const [orders, setOrders] = useState()

  useEffect(() => {
    const _fetch = async () => {
      const { data } = await axios.get('/orders.json')
      setOrders(data.orders)
    }

    _fetch()
  }, [])

  return (
    <div>ORDERS</div>
  )
}
