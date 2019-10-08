import React from 'react'

import styles from './Loading.module.css'

export default function Loading () {
  return (
    <div className={styles.root}>
      {[...Array(6).keys()].map(i =>
        <div className={styles.pl} key={i}>
          <div className={styles.image} />
          <div className={styles.title} />
        </div>
      )}
    </div>
  )
}
