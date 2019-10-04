import React, { useEffect, useRef } from 'react'
import PropTypes from 'prop-types'
import Siema from 'siema'
import { path } from '../../Routes'

import styles from './Sections.module.css'
import buttons from '../../Buttons.module.css'

Sections.propTypes = {
  section: PropTypes.object,
  products: PropTypes.array
}

export default function Sections ({ section, products }) {
  const slider = useRef()
  const mount = useRef()

  console.log(products)

  useEffect(() => {
    slider.current = new Siema({
      selector: mount.current,
      perPage: {
        320: 2,
        768: 4,
        1440: 2
      }
    })
  }, [])

  return (
    <div className={styles.sections}>
      <div className={styles.section_image}>
        <div className={styles.image} style={{ backgroundImage: `url(${section.image.path})` }}>
        </div>

        <div className={styles.text}>
          <h1>{section.title}</h1>
          <div className={styles.action}>
            <a href={path('section_catalog_path', { slug: section.slug })} className={buttons.main}>
              {section.title}
            </a>
          </div>
        </div>
      </div>

      <div className={styles.slider} ref={mount}>
        {products.map(product =>
          <div key={product.id} className={styles.list}>
            <a className={styles.product} href={path('product_catalog_path', { id: product.id })}>
              <div className={styles.photo}>
                <img src={product.image} />
              </div>

              <div className={styles.title}>
                {product.title}
              </div>

              <div className={styles.price}>
                {product.price}
              </div>
            </a>
          </div>
        )}
      </div>
    </div>
  )
}
