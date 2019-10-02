import React, { useState, useEffect, useRef } from 'react'
// import PropTypes from 'prop-types'
import debounce from 'lodash.debounce'
import axios from 'axios'

import List from '../Products/List'

import styles from './Index.module.css'
import page from '../Page.module.css'
import form from '../Form.module.css'

export default function Index () {
  const [q, setQ] = useState('')
  const [results, setResults] = useState()

  const _fetch = async (q) => {
    const { data } = await axios.get('/search.json', { params: { q } })
    setResults(data.results)
  }

  const _fetchDebounced = useRef(debounce(q => _fetch(q), 400))

  useEffect(() => {
    if (q !== '') {
      _fetchDebounced.current(q)
    } else {
      _fetchDebounced.current.cancel()
      setResults()
    }
  }, [q])

  return (
    <div className={page.root}>
      <div className={page.com}>
        <div className={styles.input}>
          <div className={form.input}>
            <input
              autoFocus
              placeholder="Напишите что вы хотите найти..."
              type="text"
              value={q}
              onChange={({ target: { value } }) => setQ(value)}
            />
          </div>
        </div>

        {results && results.length === 0 &&
          <div>По вашему запросу ничего не найдено =(</div>
        }

        {results && results.length > 0 &&
          <div className={styles.results}>
            <List products={results} />
          </div>
        }
      </div>
    </div>
  )
}
