import React from 'react'
import PropTypes from 'prop-types'
import Slider from './Index/Slider'

Index.propTypes = {
  sections: PropTypes.array,
  slides: PropTypes.array.isRequired
}

export default function Index ({ sections, slides }) {
  return (
    <div>
      <Slider slides={slides} />
    </div>
  )
}
