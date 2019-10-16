import React, { useState, useEffect, useRef } from 'react'
import PropTypes from 'prop-types'
import querystring from 'querystring'
import classNames from 'classnames'

import styles from './Properties.module.css'

Properties.propTypes = {
  properties: PropTypes.array.isRequired,
  history: PropTypes.object.isRequired,
  params: PropTypes.object.isRequired
}

export default function Properties ({ properties, history, params }) {
  const [values, setValues] = useState(() => {
    const init = {}

    properties.forEach(property => {
      init[property.id] = {}
      property.items.forEach(item => {
        init[property.id][item.id] = (params[property.id] !== undefined && params[property.id].includes(item.id.toString()))
      })
    })
    return init
  })

  const prevValues = usePrevious(values)

  useEffect(() => {
    if (prevValues) {
      const newParams = Object.fromEntries(Object.entries(values).map(([id, i]) => [id, Object.entries(i).filter(([_, j]) => j).map(([id, _]) => id)]).filter(([id, i]) => i.length > 0))

      history.push(location.pathname + '?' + querystring.stringify(newParams))
    }
  }, [values])

  const handleValuesChange = (id, itemValues) => {
    if (itemValues !== values[id]) {
      setValues({ ...values, [id]: itemValues })
    }
  }

  if (properties.length < 1) return null

  return (
    <div className={styles.properties}>
      {properties.filter(p => p.id === 101 || true).map(property =>
        <div key={property.id} className={classNames(styles.property, styles.overlay)}>
          <div className={styles.title}>
            {property.title}
          </div>

          <Items onValuesChange={handleValuesChange} items={property.enum} init={values[property.id]} property={property} />
        </div>
      )}
    </div>
  )
}

Items.propTypes = {
  property: PropTypes.object.isRequired,
  onValuesChange: PropTypes.func.isRequired,
  init: PropTypes.object.isRequired,
  items: PropTypes.array.isRequired
}

function Items ({ items, property, onValuesChange, init }) {
  const [values, setValues] = useState(init)

  const handleValueChange = (id, value) => {
    if (value !== values[id]) {
      setValues({ ...values, [id]: value })
    }
  }

  useEffect(() => {
    onValuesChange(property.id, values)
  }, [values])

  return (
    <ul className={classNames(styles.enums, { [styles.col1]: property.id === 104, [styles.col2]: property.id === 107, [styles.col3]: property.id === 108, [styles.col4]: property.id === 137, [styles.col5]: property.id === 144 })}>
      {items.map(item =>
        <Item onValueChange={handleValueChange} property={property} init={values[item.id]} item={item} key={item.id} />
      )}
    </ul>
  )
}

Item.propTypes = {
  onValueChange: PropTypes.func.isRequired,
  property: PropTypes.object.isRequired,
  init: PropTypes.bool.isRequired,
  item: PropTypes.object.isRequired
}

function Item ({ item, property, onValueChange, init }) {
  const [value, setValue] = useState(init)

  useEffect(() => {
    onValueChange(item.id, value)
  }, [value])

  return (
    <li className={styles.enum}>
      <label>
        <input
          type="checkbox"
          checked={value}
          onChange={({ target: { name, checked } }) => setValue(checked)}
        />
        <div className={styles.item}>{item.value}</div>
      </label>
    </li>
  )
}

function usePrevious (value) {
  const ref = useRef()

  useEffect(() => {
    ref.current = value
  })

  return ref.current
}
