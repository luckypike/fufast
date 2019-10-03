import React from 'react'
import PropTypes from 'prop-types'

import { path } from '../Routes'

import styles from './List.module.css'

List.propTypes = {
  products: PropTypes.array
}

export default function List ({ products }) {
  if (!products || products.length === 0) return null

  return (
    <div className={styles.products}>
      {products.map(product =>
        <a className={styles.product} key={product.id} href={path('product_catalog_path', { id: product.id })}>
          <div className={styles.image}>
            <img src={product.image} />
          </div>

          <div className={styles.title}>
            {product.title}
          </div>

          <div className={styles.price}>
            {product.price}
          </div>
        </a>
      )}
    </div>
  )
}