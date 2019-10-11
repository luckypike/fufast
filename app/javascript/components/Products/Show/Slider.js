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
  console.log(product)

  useEffect(() => {
    slider.current = new Siema({
      selector: mount.current,
      perPage: 1,
      onChange: () => {
        setCurrent(slider.current.currentSlide)
      }
    })
  }, [])

  const [current, setCurrent] = useState(0)

  return (
    <div className={styles.root}>
      <div className={styles.slider}>
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

        <div className={styles.images} ref={mount}>
          {product.images.map(image =>
            <div key={image.id} className={styles.image}>
              <img src={image.proxy} />
            </div>
          )}
        </div>
      </div>

      <div className={styles.icons}>
        {product.images.map((i, index) =>
          <div key={i.id}>
            <div className={classNames(styles.mini_icons, { [styles.active]: current === index })} onClick={() => slider.current.goTo(index)}>
              <img src={i.proxy} />
            </div>
          </div>
        )}
      </div>
    </div>
  )
}
