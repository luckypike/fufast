import React from 'react'
// import PropTypes from 'prop-types'

export default function Cart () {
  const handleAddToCart = () => {
    console.log('ADD')
  }

  return (
    <div>
      <button onClick={handleAddToCart}>
        ADD TO CART
      </button>
    </div>
  )
}
