import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import axios from 'axios'
import ReactMarkdown from 'react-markdown'

import Cart from './Show/Cart'
import Properties from './Show/Properties'
import Slider from './Show/Slider'

import styles from './Show.module.css'
import page from '../Page.module.css'

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

  if (!product.images) return null

  return (
    <div className={page.root}>
      <div className={page.com}>
        <div className={styles.root}>
          <div className={styles.slider}>
            <Slider product={product} />
          </div>

          <div className={styles.main}>
            <h1>
              {product.title}
            </h1>

            <div className={styles.data}>
              <ReactMarkdown source={product.description} escapeHtml={false} />

              {product.properties &&
                <Properties properties={product.properties} />
              }

              {product.properties &&
                <div>
                  <Cart product={product} token={props.token} />
                </div>
              }
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
