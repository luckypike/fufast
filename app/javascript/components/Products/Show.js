import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import axios from 'axios'
import ReactMarkdown from 'react-markdown'
import { path } from '../Routes'
import classNames from 'classnames'

import Cart from './Show/Cart'
import Properties from './Show/Properties'
import Slider from './Show/Slider'

import styles from './Show.module.css'
import page from '../Page.module.css'

Show.propTypes = {
  product: PropTypes.object.isRequired,
  token: PropTypes.string.isRequired,
  section: PropTypes.object,
  siblings: PropTypes.array,
  gloves: PropTypes.object,
  gloves_subs: PropTypes.array,
  current: PropTypes.object
}

Link.propTypes = {
  href: PropTypes.string,
  children: PropTypes.string,
  current: PropTypes.string
}

function Link (props) {
  const path = props.href.split('/')
  const last = path.pop()

  return <a href={props.href} className={classNames({ [styles.active]: last === props.current.slug, [styles.inactive]: last !== props.current.slug })}>{props.children}</a>
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
          <div className={styles.sections}>
            <div className={styles.product_sections}>
              {props.section.title}
            </div>

            {props.siblings.length > 0 &&
              <div className={styles.subs}>
                {props.siblings.map(({ id, title, slug }) =>
                  <Link key={id} current={props.current} href={path('section_catalog_path', { slug })}>
                    {title}
                  </Link>
                )}
              </div>
            }

            {props.gloves.id === 168 &&
              <div className={styles.subs}>
                {props.gloves_subs.map(({ id, title, slug }) =>
                  <a key={id} href={path('section_catalog_path', { slug })}>
                    {title}
                  </a>
                )}
              </div>
            }
          </div>

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
