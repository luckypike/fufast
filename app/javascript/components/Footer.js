import React from 'react'
import { path } from './Routes'

import styles from './Footer.module.css'

export default function Footer () {
  return (
    <footer className={styles.footer}>
      <div className={styles.footer_menu}>
        <div className={styles.item}>
          <a href={path('about_path')}>Компания</a>
        </div>
        <div className={styles.item}>
          <a href="#">Контакты</a>
        </div>
      </div>

      <div className={styles.like}>
        <a href="https://luckypike.com">L..IKE</a>
      </div>
    </footer>
  )
}
