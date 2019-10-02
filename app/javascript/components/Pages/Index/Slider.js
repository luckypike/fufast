import React, { useState, useEffect, useRef } from 'react'
import PropTypes from 'prop-types'
import Siema from 'siema'

import styles from './Slider.module.css'

Slider.propTypes = {
  slides: PropTypes.array.isRequired
}

export default function Slider ({ slides }) {
  const slider = useRef()
  const mount = useRef()

  console.log(slides)

  useEffect(() => {
    slider.current = new Siema({
      selector: mount.current
    })
  }, [])

  const [current, setCurrent] = useState(1)

  return (
    <div className={styles.root}>
      <div className={styles.placeholder}></div>

      <div className={styles.slider}>
        <div className={styles.images} ref={mount}>
          {slides.map(slide =>
            <div key={slide.id} className={styles.image}>
              <img style={{ backgroundImage: `url(${slide.path})` }} />
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
