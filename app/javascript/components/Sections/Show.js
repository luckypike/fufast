import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import { BrowserRouter as Router, Route } from 'react-router-dom'
import axios from 'axios'
import classNames from 'classnames'
import querystring from 'querystring'

import { path } from '../Routes'
import Products from '../Products/List'
import Properties from './Show/Properties'

import styles from './Show.module.css'
import page from '../Page.module.css'

export default function Show (props) {
  return (
    <Router>
      <Route render={({ location, history }) => <Section location={location} history={history} {...props} />} />
    </Router>
  )
}

Section.propTypes = {
  section: PropTypes.object.isRequired,
  location: PropTypes.object.isRequired,
  history: PropTypes.object.isRequired
}

function Section (props) {
  const [showProps, setShowProps] = useState(false)
  const [section, setSection] = useState()
  const [products, setProducts] = useState()
  const [sections, setSections] = useState()
  const [properties, setProperties] = useState()
  const [params, setParams] = useState()

  useEffect(() => {
    const _fetch = async () => {
      const { data } = await axios.get(path('section_catalog_path', { slug: props.section.slug, format: 'json' }))
      setProducts(data.products)
      setSections(data.sections)
      setSection(data.section)
      setProperties(data.properties)
    }

    _fetch()
  }, [])

  useEffect(() => {
    if (params) console.log('RELOAD PRODUCTS')
  }, [params])

  useEffect(() => {
    console.log('SET PARAMS')
    setParams(querystring.parse(props.location.search.slice(1)))
  }, [props.location])

  return (
    <div className={page.root}>
      <div className={page.com}>
        {section &&
          <div className={styles.header}>
            <h1 className={classNames({ [styles.h2]: section.depth !== 1, [styles.withProps]: properties && properties.length > 0 })}>
              {section.secondary ? section.secondary.title : section.title}
            </h1>

            {section.subs.length > 0 &&
              <div className={styles.subs}>
                {section.subs.map(section =>
                  <a key={section.id} href={path('section_catalog_path', { slug: section.slug })}>
                    {section.title}
                  </a>
                )}
              </div>
            }

            {properties &&
              <>
                <div className={classNames(styles.properties, { [styles.active]: showProps })}>
                  <Properties properties={properties} params={params} history={props.history} />
                </div>

                <div className={styles.propertiesToggle} onClick={() => setShowProps(!showProps)}>
                  <svg viewBox="0 0 24 24">
                    <rect height="2" width="16" x="4" y="8" fill="#8F8F8F" />
                    <rect height="6" width="2" x="7" y="6" fill="#8F8F8F" />
                    <rect height="2" width="16" x="4" y="14" fill="#8F8F8F" />
                    <rect height="6" width="2" x="14" y="12" fill="#8F8F8F" />
                  </svg>

                </div>
              </>
            }

            {section.description &&
              <div className={styles.description}>
                {section.description}
              </div>
            }

            {/* {section.parent &&
              <div>
                <a href={`/catalog/${section.parent.slug}`}>{section.parent.title}</a>
                <hr />
              </div>
            } */}
            {/* {section.image &&
              <img width="200" src={section.image.path} />
            } */}

            {/* {siblings &&
              <div>
                {siblings.map(section =>
                  <span key={section.id}>
                    <a href={`/catalog/${section.slug}`}>{section.title}</a>
                  </span>
                )}
                <hr />
              </div>
            } */}
          </div>
        }

        {sections &&
          <div>
            {sections.map(section =>
              <div key={section.id}>
                <h2>
                  <a href={path('section_catalog_path', { slug: section.slug })}>{section.title}</a>
                </h2>

                <div>
                  <Products products={section.products} />
                </div>
              </div>
            )}
          </div>
        }

        {products &&
          <div>
            <Products products={products} />
          </div>
        }
      </div>
    </div>
  )
}
