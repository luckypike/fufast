import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import axios from 'axios'

Show.propTypes = {
  section: PropTypes.object.isRequired
}

export default function Show ({ section }) {
  const [products, setProducts] = useState()

  useEffect(() => {
    const _fetch = async () => {
      const { data } = await axios.get(`/catalog/${section.slug}.json`)
      setProducts(data.products)
    }

    _fetch()
  }, [])

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
