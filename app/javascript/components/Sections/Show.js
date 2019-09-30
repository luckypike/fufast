import React from 'react'
import PropTypes from 'prop-types'

Show.propTypes = {
  section: PropTypes.object.isRequired,
  products: PropTypes.array.isRequired
}

export default function Show ({ section, products }) {
  return (
    <div>
      {section.title}

      {products &&
        <div>
          {products.map(product =>
            <div key={product.id}>
              <a href={`/catalog/${product.id}`}>{product.id} - {product.title}</a>
            </div>
          )}
        </div>
      }
    </div>
  )
}
