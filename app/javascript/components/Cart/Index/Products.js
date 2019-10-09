import React from 'react'
import PropTypes from 'prop-types'

import styles from './Products.module.css'

Products.propTypes = {
  products: PropTypes.array.isRequired
}

export default function Products ({ products }) {
  return (
    <div className={styles.root}>
      {products.map(product =>
        <div key={product.id} className={styles.product}>
          <div className={styles.image}>
            {product.image && <img src={product.image} /> }
          </div>

          <div className={styles.data}>
            {product.title}
          </div>
        </div>
      )}
    </div>
  )
}
