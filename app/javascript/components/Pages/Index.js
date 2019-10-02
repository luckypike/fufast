import React from 'react'
import PropTypes from 'prop-types'

Index.propTypes = {
  sections: PropTypes.array,
  slides: PropTypes.array.isRequired
}

export default function Index ({ sections, slides }) {
  return (
    <div>
      Index

      {/* <div>
        {sections.map(section =>
          <div key={section.id}>
            <a href={`/catalog/${section.slug}`}>{section.title}</a>
          </div>
        )}
      </div> */}

      <div>
        {slides.map(slide =>
          <div key={slide.id}>
            <img width="200" src={slide.path} />
          </div>
        )}
      </div>
    </div>
  )
}
