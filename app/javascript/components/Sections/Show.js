import React, { useState, useEffect, useRef } from 'react'
import PropTypes from 'prop-types'
import { BrowserRouter as Router, Route } from 'react-router-dom'
import axios from 'axios'
import classNames from 'classnames'
import querystring from 'querystring'
import debounce from 'lodash.debounce'

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
  primary: PropTypes.object.isRequired,
  secondary: PropTypes.object,
  subs: PropTypes.array,
  location: PropTypes.object.isRequired,
  history: PropTypes.object.isRequired
}

function Section ({ section, primary, secondary, subs, history, location }) {
  const [showProps, setShowProps] = useState(false)
  // const [section, setSection] = useState()
  const [products, setProducts] = useState()
  const [sections, setSections] = useState()
  const [properties, setProperties] = useState()
  const [params, setParams] = useState()
  const [toggle, setToggle] = useState(false)

  const _fetch = async (params) => {
    const { data } = await axios.get(
      path('section_catalog_path', { slug: section.slug, format: 'json' }),
      { params }
    )
    setProducts(data.products)
    setSections(data.sections)
    // setSection(data.section)
    setProperties(data.properties)
  }

  const _fetchDebounced = useRef(debounce(params => _fetch(params), 400))

  useEffect(() => {
    // _fetchDebounced.current(params)
  }, [])

  useEffect(() => {
    _fetchDebounced.current(params)
  }, [params])

  useEffect(() => {
    console.log('SET PARAMS')
    setParams(querystring.parse(location.search.slice(1)))
  }, [location])

  return (
    <div className={page.root}>
      <div className={classNames(styles.overlay, { [styles.active]: toggle })} onClick={() => [setShowProps(!showProps), setToggle(false)]}></div>

      {section.depth === 1 && section.image &&
        <div className={styles.image} style={{ backgroundImage: `url(${section.image.proxy})` }} />
      }

      <div className={page.com}>
        <div className={styles.header}>
          <h1 className={classNames({ [styles.h2]: section.depth !== 1, [styles.withProps]: properties && properties.length > 0 })}>
            {secondary ? secondary.title : section.title}
          </h1>

          {subs.length > 0 &&
            <div className={styles.subs}>
              {subs.map(({ id, title, slug }) =>
                <a key={id} href={path('section_catalog_path', { slug })}>
                  {title}
                </a>
              )}
            </div>
          }

          {properties &&
            <>
              <div className={classNames(styles.properties, { [styles.active]: showProps })}>
                <Properties properties={properties} params={params} history={history} />
              </div>

              <div className={styles.propertiesToggle} onClick={() => [setShowProps(!showProps), setToggle(!toggle)]}>
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

        <div>
          <Products products={products} />
        </div>
      </div>
    </div>
  )
}
