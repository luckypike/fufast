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

  useEffect(() => {
    slider.current = new Siema({
      selector: mount.current,
      duration: 500,
      loop: true,
      perPage: {
        768: 2
      }
    })
    setInterval(() => slider.current.next(2), 5000)
  }, [])

  const chunks = [...Array(Math.ceil(products.length / 2))].map((n, i) => products.slice(i * 2, (i + 1) * 2))

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
        {chunks.map((chunk, i) =>
          <div key={i} className={styles.products}>
            {chunk.map(product =>
              <div key={product.id} className={styles.product}>
                <a href={path('product_catalog_path', { id: product.id })}>
                  <div className={styles.photo}>
                    <img src={product.image} />
                    <div className={styles.buy}>Выбрать</div>
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
        )}
      </div>
    </div>
  )
}
