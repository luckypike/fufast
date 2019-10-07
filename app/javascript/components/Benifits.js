import React from 'react'
import classNames from 'classnames'

import styles from './Benifits.module.css'

export default function Footer () {
  return (
    <div className={styles.benifits}>
      <div className={styles.benifit_list}>
        <div className={styles.benifit_item}>
          <div className={classNames(styles.icon, styles.delivery)}></div>
          <div className={styles.desc}>Выгодная доставка</div>
        </div>

        <div className={styles.benifit_item}>
          <div className={classNames(styles.icon, styles.expert)}></div>
          <div className={styles.desc}>Беслатная консультация</div>
        </div>

        <div className={styles.benifit_item}>
          <div className={classNames(styles.icon, styles.sale)}></div>
          <div className={styles.desc}>Распродажа</div>
        </div>

        <a className={styles.benifit_item} href="mailto:info@fufayka.info">
          <div className={classNames(styles.icon, styles.mail)}></div>
          <div className={styles.desc}>info@fufayka.info</div>
        </a>

        <div className={classNames(styles.benifit_item, styles.inactive)}>
          <div className={classNames(styles.icon, styles.phone)}></div>
          <div className={styles.desc}>Заказать звонок</div>
        </div>
      </div>
    </div>
  )
}
