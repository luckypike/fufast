import React, { useState, useEffect, useRef } from 'react'
import PropTypes from 'prop-types'
import classNames from 'classnames'
import Siema from 'siema'
import { path } from '../../Routes'

import styles from './Logos.module.css'
import buttons from '../../Buttons.module.css'

Logos.propTypes = {
  section: PropTypes.array
}

export default function Logos ({ section }) {
  const slider = useRef()
  const mount = useRef()

  useEffect(() => {
    slider.current = new Siema({
      selector: mount.current,
      loop: true,
      duration: 500,
      onChange: () => {
        setCurrent(slider.current.currentSlide)
      }
    })
    setInterval(() => slider.current.next(1), 4000)
  }, [])

  const [current, setCurrent] = useState(0)

  return (
    <div className={styles.logos_section}>
      <div className={styles.bg}></div>
      <div className={styles.man}></div>

      <div className={styles.slider} ref={mount}>
        <div className={classNames(styles.item, styles.alrosa)}></div>
        <div className={classNames(styles.item, styles.lukoil)}></div>
        <div className={classNames(styles.item, styles.gazprom)}></div>
        <div className={classNames(styles.item, styles.rosneft)}></div>
        <div className={classNames(styles.item, styles.rzd)}></div>
      </div>

      <div className={styles.logos_mini}>
        <div className={classNames(styles.mini_item, styles.alrosa_svg, { [styles.active]: current === 0 })} onClick={() => slider.current.goTo(0)}></div>
        <div className={classNames(styles.mini_item, styles.lukoil_svg, { [styles.active]: current === 1 })} onClick={() => slider.current.goTo(1)}></div>
        <div className={classNames(styles.mini_item, styles.gazprom_svg, { [styles.active]: current === 2 })} onClick={() => slider.current.goTo(2)}></div>
        <div className={classNames(styles.mini_item, styles.rosneft_svg, { [styles.active]: current === 3 })} onClick={() => slider.current.goTo(3)}></div>
        <div className={classNames(styles.mini_item, styles.rzd_svg, { [styles.active]: current === 4 })} onClick={() => slider.current.goTo(4)}></div>
      </div>

      <div className={styles.text}>
        <h1>{section.title}</h1>
        <div className={styles.action}>
          <a href={path('section_catalog_path', { slug: section.slug })} className={buttons.main}>
            Подробнее
          </a>
        </div>
      </div>
    </div>
  )
}
