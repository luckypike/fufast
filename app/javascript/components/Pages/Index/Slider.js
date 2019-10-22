import React, { useState, useEffect, useRef } from 'react'
import PropTypes from 'prop-types'
import Siema from 'siema'
import classNames from 'classnames'

import styles from './Slider.module.css'

Slider.propTypes = {
  slides: PropTypes.array.isRequired
}

export default function Slider ({ slides }) {
  const slider = useRef()
  const mount = useRef()

  useEffect(() => {
    slider.current = new Siema({
      selector: mount.current,
      duration: 500,
      loop: true,
      onChange: () => {
        setCurrent(slider.current.currentSlide)
      }
    })
    setInterval(() => slider.current.next(), 7000)
  }, [])

  const [current, setCurrent] = useState(0)

  return (
    <div className={styles.root}>
      <div className={styles.slider}>
        <div className={styles.nav}>
          {slides.map((i, index) =>
            <div key={index} className={classNames(styles.slide, { [styles.active]: current === index })} onClick={() => slider.current.goTo(index)} />
          )}
        </div>

        <div className={styles.images} ref={mount}>
          {slides.map(slide =>
            <div key={slide.id}>
              <div className={styles.image} style={{ backgroundImage: `url(${slide.index.slider})` }}>
                <div className={styles.text}>
                  {slide.title}
                </div>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
