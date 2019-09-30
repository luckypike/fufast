import React from 'react'
import PropTypes from 'prop-types'

Index.propTypes = {
  sections: PropTypes.array
}

export default function Index ({ sections }) {
  return (
    <div>
      Index

      <div>
        {sections.map(section =>
          <div key={section.ID}>
            <a href={`/catalog/${section.slug}`}>{section.title}</a>
          </div>
        )}
      </div>
    </div>
  )
}
