import React, { useState } from 'react'
import PropTypes from 'prop-types'
import classNames from 'classnames'

import styles from './Header.module.css'

import Logo from '!svg-react-loader?!../images/logo.svg'
import Search from '!svg-react-loader?!../images/search.svg'
import Cart from '!svg-react-loader?!../images/cart.svg'

Header.propTypes = {
  sections: PropTypes.array
}

export default function Header ({ sections }) {
  const [toggle, setToggle] = useState(false)

  return (
    <header className={classNames(styles.root, { [styles.toggled]: toggle })}>
      <div className={classNames(styles.overlay, { [styles.active]: toggle })} onClick={() => setToggle(false)}></div>

      <div className={styles.burger_menu}>
        <div className={styles.burger} onClick={() => setToggle(!toggle)}>
          <svg viewBox="0 0 20 11">
            <rect height="1" width="20" x="0" y="0" />
            <rect height="1" width="20" x="0" y="5" />
            <rect height="1" width="20" x="0" y="10" />
          </svg>
        </div>
      </div>

      <div className={styles.logo}>
        <a href="/">
          <Logo />
        </a>
      </div>

      <nav className={styles.nav}>
        <div className={styles.menu}>
          {sections.map((section, i) =>
            <div className={styles.item} key={i}>
              <a href={`/catalog/${section.slug}`}>
                {section.title}
              </a>
            </div>
          )}

          <div className={styles.mobile}>
            <div className={styles.item}>
              <a href="/">
                О компании
              </a>
            </div>

            <div className={styles.item}>
              <a href="/">
                Контакты
              </a>
            </div>
          </div>
        </div>
      </nav>

      <div className={styles.phone}>
        + 7 910 793 7733
      </div>

      <div className={styles.search}>
        <a href="/">
          <Search />
        </a>
      </div>

      <div className={styles.cart}>
        <a href="/">
          <Cart />
        </a>
      </div>
    </header>
  )
}
