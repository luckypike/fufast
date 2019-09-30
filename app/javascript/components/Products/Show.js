import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import axios from 'axios'
import ReactMarkdown from 'react-markdown'

import Cart from './Show/Cart'

Show.propTypes = {
  product: PropTypes.object.isRequired,
  token: PropTypes.string.isRequired
}

export default function Show (props) {
  const [product, setProduct] = useState(props.product)

  useEffect(() => {
    const _fetch = async () => {
      const { data } = await axios.get(`/catalog/${product.id}.json`)
      setProduct(data.product)
    }

    _fetch()
  }, [props.product.id])

  return (
    <div>
      <h1>
        {product.title}
      </h1>

      <div>
        <ReactMarkdown source={product.desc} escapeHtml={false} />
      </div>

      {product.properties &&
        <div>
          <Cart product={product} token={props.token} />
        </div>
      }
    </div>
  )
}
