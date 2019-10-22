import React from 'react'
import PropTypes from 'prop-types'

import { path } from '../Routes'
import { currency } from '../Price'
import Loading from '../Products/Loading'

import styles from './List.module.css'
import buttons from '../Buttons.module.css'

List.propTypes = {
  products: PropTypes.array,
  section: PropTypes.object
}

export default function List ({ products, section }) {
  if (!products) return <Loading />
  if (products.length === 0) return null

  return (
    <div>
      <div className={styles.products}>
        {products.map(product =>
          <a className={styles.product} key={product.id} href={path('product_catalog_path', { id: product.id })}>
            <div className={styles.image}>
              {product.image &&
                <img src={product.image.proxy.section} />
              }
            </div>

            <div className={styles.title}>
              {product.title}
            </div>

            {product.price &&
              <div className={styles.price}>
                {currency(product.price)}
              </div>
            }
          </a>
        )}
      </div>

      {section &&
        <div className={styles.more}>
          <a href={path('section_catalog_path', { slug: section.slug })} className={buttons.main}>{section.link ? section.link : 'Посмотреть ещё'}</a>
        </div>
      }
    </div>
  )
}
