import React, { useEffect, useState, useRef } from 'react'
import PropTypes from 'prop-types'
import Siema from 'siema'
import classNames from 'classnames'

import styles from './Slider.module.css'

Slider.propTypes = {
  product: PropTypes.object
}

export default function Slider ({ product }) {
  const slider = useRef()
  const mount = useRef()

  useEffect(() => {
    slider.current = new Siema({
      selector: mount.current,
      onChange: () => {
        setCurrent(slider.current.currentSlide)
      }
    })
  }, [])

  const [current, setCurrent] = useState(0)

  return (
    <div className={styles.root}>
      <div className={styles.slider}>
        {product.images.length > 1 &&
          <>
            <div className={styles.prev} onClick={() => slider.current.prev()}>
              <svg viewBox="0 0 60 60">
                <polyline points="35,16 25,30 35,44"></polyline>
              </svg>
            </div>

            <div className={styles.next} onClick={() => slider.current.next()}>
              <svg viewBox="0 0 60 60">
                <polyline points="25,16 35,30 25,44"></polyline>
              </svg>
            </div>
          </>
        }

        <div className={styles.images} ref={mount}>
          {product.images.length > 1 && product.images.map(image =>
            <div key={image.id} className={styles.image}>
              <img src={image.product.large} />
            </div>
          )}
        </div>
      </div>

      {product.images.length === 1 &&
        <div className={styles.image}>
          <img src={product.images[0].product.small} />
        </div>
      }

      {product.images.length > 1 &&
        <div className={styles.icons}>
          {product.images.map((i, index) =>
            <div key={i.id} className={classNames(styles.mini_icons, { [styles.active]: current === index })} onClick={() => slider.current.goTo(index)}>
              <img src={i.product.small} />
            </div>
          )}
        </div>
      }
    </div>
  )
}
