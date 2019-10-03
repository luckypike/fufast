import React, { useState } from 'react'
import PropTypes from 'prop-types'
import classNames from 'classnames'

import { path } from './Routes'

import styles from './Header.module.css'

import Logo from '!svg-react-loader?!../images/logo.svg'

Header.propTypes = {
  sections: PropTypes.array
}

export default function Header ({ sections }) {
  const [toggle, setToggle] = useState(false)

  return (
    <header className={classNames(styles.root, { [styles.toggled]: toggle })}>
      <div className={classNames(styles.overlay, { [styles.active]: toggle })} onClick={() => setToggle(false)}></div>

      <div className={styles.logo}>
        <a href="/">
          <Logo />
        </a>
      </div>

      <nav className={styles.nav}>
        <div className={styles.menu}>
          {sections.map((section, i) =>
            <div className={styles.item} key={i}>
              <a href={path('section_catalog_path', { slug: section.slug })}>
                {section.title}
              </a>
            </div>
          )}

          <div className={classNames(styles.item, styles.about)}>
            <a href="/about">
              О компании
            </a>
          </div>

          <div className={classNames(styles.item, styles.contacts)}>
            <a href="/">
              Контакты
            </a>
          </div>
        </div>
      </nav>

      <div className={styles.options}>
        <div className={classNames(styles.search, styles.search_icon)}>
          <a href={path('search_path')} />
        </div>

        <div className={classNames(styles.cart, styles.cart_icon)}>
          <a href={path('cart_path')} />
        </div>

        <div className={styles.burger_menu}>
          <div className={styles.burger} onClick={() => setToggle(!toggle)}>
            <svg viewBox="0 0 18 18">
              <rect height="2" width="18" x="0" y="3" />
              <rect height="2" width="18" x="0" y="8" />
              <rect height="2" width="18" x="0" y="13" />
            </svg>
          </div>
        </div>
      </div>
    </header>
  )
}