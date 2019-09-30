import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import axios from 'axios'
import update from 'immutability-helper'

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
    const size = product.properties.find(prop => prop.id === 104)

    if (height && size) {
      height.values.forEach(hv => {
        size.values.forEach(sv => {
          newVariants.push({
            title: `${hv.value} / ${sv.value}`,
            [sv.property_id]: sv.value,
            [hv.property_id]: hv.value,
            q: 0
          })
          // console.log(hv, sv)
        })
      })
    }

    // newVariants = [{ 104: 40, q: 3 }, { 104: 41, q: 0 }]
    setVariants(newVariants)
  }, [product.properties])

  const handleChange = (i, q) => {
    if (q < 0) q = 0

    const newVariants = update(variants, {
      [i]: {
        q: {
          $set: q
        }
      }
    })

    setVariants(newVariants)
  }

  const handleAddToCart = async () => {
    await axios.post('/cart', {
      product_id: product.id,
      variants,
      authenticity_token: token
    })
  }

  return (
    <div>
      {variants && variants.map((variant, i) =>
        <div key={i}>
          {variant.title}: {variant.q} |||
          <span onClick={() => handleChange(i, variant.q + 1)}>+</span>
          <span onClick={() => handleChange(i, variant.q - 1)}>-</span>
        </div>
      )}

      <button onClick={handleAddToCart}>
        ADD TO CART
      </button>
    </div>
  )
}
