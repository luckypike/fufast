import React from 'react'
import PropTypes from 'prop-types'
import Slider from './Index/Slider'
import Sections from './Index/Sections'
import Logos from './Index/Logos'

Index.propTypes = {
  sections: PropTypes.array,
  products: PropTypes.array,
  slides: PropTypes.array.isRequired
}

export default function Index ({ sections, slides, products }) {
  return (
    <div>
      <div>
        <Slider slides={slides} />
      </div>

      <div>
        {sections &&
          <div>
            {sections.filter(i => i.id !== 244).map(section =>
              <Sections key={section.id} section={section} products={products} />
            )}
          </div>
        }
      </div>

      <div>
        <Logos />
      </div>
    </div>
  )
}
