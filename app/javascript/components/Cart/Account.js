import React from 'react'
import PropTypes from 'prop-types'
import { path } from '../Routes'

import styles from './Account.module.css'
import buttons from '../Buttons.module.css'

Account.propTypes = {
  user: PropTypes.object
}

export default function Account ({ user }) {
  if (!user) return null

  return (
    <div className={styles.root}>
      {user.name &&
        <div className={styles.name}>
          <div className={styles.firstname}>
            {user.name}
          </div>

          <div className={styles.lastname}>
            {user.lastname}
          </div>
        </div>
      }

      <div className={styles.phone}>
        {user.phone}
      </div>

      <div className={styles.email}>
        {user.email}
      </div>

      <div className={styles.link}>
        <a href={path('user_path', { id: user.id })} className={buttons.main}>
          История заказов
        </a>
      </div>
    </div>
  )
}
