import React from 'react'
import PropTypes from 'prop-types'

import styles from './Properties.module.css'

Properties.propTypes = {
  properties: PropTypes.array.isRequired
}

export default function Properties ({ properties }) {
  if (properties.length < 1) return null

  return (
    <div className={styles.properties}>
      {properties.map(property =>
        <div key={property.id} className={styles.property}>
          <div className={styles.title}>
            {property.title}
          </div>

          <div className={styles.enums}>
            {property.enum.map(item =>
              <div key={item.id} className={styles.enum}>
                {item.value}
              </div>
            )}
          </div>
        </div>
      )}
    </div>
  )
}
