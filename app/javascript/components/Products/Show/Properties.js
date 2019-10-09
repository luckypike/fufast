import React from 'react'
import PropTypes from 'prop-types'

import styles from './Properties.module.css'

Properties.propTypes = {
  properties: PropTypes.array.isRequired
}

export default function Properties ({ properties }) {
  return (
    <div className={styles.root}>
      {properties.filter(p => ![104, 103, 105, 107, 111].includes(p.id)).map(property =>
        <Property key={property.id} property={property} />
      )}
    </div>
  )
}

Property.propTypes = {
  property: PropTypes.object.isRequired
}

function Property ({ property }) {
  let values = []

  if (property.type === 'S') {
    values = property.values.map(v => v.value)
  }

  if (property.type === 'L') {
    const labels = property.items.reduce((acc, v) => ({ ...acc, [v.id]: v.value }), {})

    values = property.values.map(v => labels[v.value])
  }

  return (
    <div className={styles.property}>
      <div className={styles.label}>
        {property.title}
      </div>

      <div className={styles.value}>
        {values.join(', ')}
      </div>
    </div>
  )
}
