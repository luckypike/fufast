import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import axios from 'axios'

Show.propTypes = {
  section: PropTypes.object.isRequired
}

export default function Show (props) {
  const [section, setSection] = useState()
  const [products, setProducts] = useState()
  const [sections, setSections] = useState()
  const [siblings, setSiblings] = useState()

  useEffect(() => {
    const _fetch = async () => {
      const { data } = await axios.get(`/catalog/${props.section.slug}.json`)
      setProducts(data.products)
      setSections(data.sections)
      setSection(data.section)
      setSiblings(data.siblings)
    }

    _fetch()
  }, [])

  return (
    <div>

      {section &&
        <div>
          {section.parent &&
            <div>
              <a href={`/catalog/${section.parent.slug}`}>{section.parent.title}</a>
              <hr />
            </div>
          }
          {section.image &&
            <img width="200" src={section.image.path} />
          }
          {section.title}

          {siblings &&
            <div>
              {siblings.map(section =>
                <span key={section.id}>
                  <a href={`/catalog/${section.slug}`}>{section.title}</a>
                </span>
              )}
              <hr />
            </div>
          }

        </div>
      }

      {sections &&
        <div>
          {sections.map(section =>
            <div key={section.id}>
              <a href={`/catalog/${section.slug}`}>{section.title}</a>
            </div>
          )}
        </div>
      }

      <hr />

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
