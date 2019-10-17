import React, { useEffect, useRef } from 'react'
import PropTypes from 'prop-types'
import Siema from 'siema'
import { path } from '../../Routes'

import styles from './Sections.module.css'
import buttons from '../../Buttons.module.css'

Section.propTypes = {
  section: PropTypes.object,
  products: PropTypes.array
}

export default function Section ({ section, products }) {
  const slider = useRef()
  const mount = useRef()

  useEffect(() => {
    slider.current = new Siema({
      selector: mount.current,
      perPage: {
        768: 2
      }
    })
  }, [])

  const more = {
    id: 114,
    title: 'Все товары'
  }

  products.push(more)
  const chunks = [...Array(Math.ceil(products.length / 2))].map((n, i) => products.slice(i * 2, (i + 1) * 2))

  return (
    <div className={styles.sections}>
      <div className={styles.section_image}>
        <div className={styles.image} style={{ backgroundImage: `url(${section.image.proxy})` }}>
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

      <div className={styles.section_slider}>
        <div className={styles.slider} ref={mount}>
          {chunks.map((chunk, i) =>
            <div key={i} className={styles.products}>
              {chunk.map(product =>
                <div key={product.id} className={styles.product}>
                  {product.id !== 114 &&
                    <a href={path('product_catalog_path', { id: product.id })}>
                      <div className={styles.photo}>
                        {product.image &&
                          <img src={product.image} />
                        }
                      </div>

                      <div className={styles.tap}>
                        <div className={styles.title}>
                          {product.title}
                        </div>

                        <div className={styles.price}>
                          {product.price}
                        </div>
                      </div>
                    </a>
                  }
                  {product.id === 114 &&
                    <div className={styles.more}>
                      <a href={path('section_catalog_path', { slug: section.slug })} className={buttons.main}>
                        {product.title}
                      </a>
                    </div>
                  }
                </div>
              )}
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
