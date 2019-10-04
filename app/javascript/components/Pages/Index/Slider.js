import React, { useEffect, useRef } from 'react'
import PropTypes from 'prop-types'
import Siema from 'siema'

import styles from './Slider.module.css'

Slider.propTypes = {
  slides: PropTypes.array.isRequired
}

export default function Slider ({ slides }) {
  const slider = useRef()
  const mount = useRef()

  useEffect(() => {
    slider.current = new Siema({
      selector: mount.current
    })
  }, [])

  return (
    <div className={styles.root}>
      <div className={styles.placeholder}></div>

      <div className={styles.slider}>
        <div className={styles.nav}>
          {slides.map((s, i) =>
            <div key={s.id} className={styles.slide} onClick={() => slider.current.goTo(i)} />
          )}
        </div>

        <div className={styles.images} ref={mount}>
          {slides.map(slide =>
            <div key={slide.id} >
              <div className={styles.image}>
                <div className={styles.text}>
                  {slide.title}
                </div>
                <img style={{ backgroundImage: `url(${slide.path})` }} />
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
