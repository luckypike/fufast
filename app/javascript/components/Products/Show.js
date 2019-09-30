import React from 'react'
import PropTypes from 'prop-types'

Show.propTypes = {
  product: PropTypes.object.isRequired
}

export default function Show ({ product }) {
  return (
    <div>
      {product.title}
    </div>
  )
}
