import React, { useState } from 'react'
import PropTypes from 'prop-types'
import axios from 'axios'

import { Errors } from '../Form'
import { path } from '../Routes'

import styles from './New.module.css'
import page from '../Page.module.css'
import form from '../Form.module.css'
import buttons from '../Buttons.module.css'

New.propTypes = {
  token: PropTypes.string.isRequired
}

export default function New ({ token }) {
  const [values, setValues] = useState({
    email: '',
    password: ''
  })

  const handleChange = ({ target: { name, value } }) => {
    setValues({ ...values, [name]: value })
  }

  const [errors, setErrors] = useState({})

  const handleSubmit = async e => {
    e.preventDefault()

    await axios.post(path('login_path'), {
      user: values,
      authenticity_token: token
    }).then(res => {
      if (window) window.location = res.headers.location
    }).catch((error) => {
      setErrors(error.response.data)
    })
  }

  return (
    <div className={page.root}>
      <div className={page.text}>
        <h1>
          Вход
        </h1>

        <form onSubmit={handleSubmit} className={form.root}>
          <div className={form.el}>
            <label>
              <div className={form.label}>
                Электронная почта
              </div>

              <div className={form.input}>
                <input
                  type="email"
                  name="email"
                  value={values.email}
                  onChange={handleChange}
                />
              </div>
            </label>

            <Errors errors={errors.email} />
          </div>

          <div className={form.el}>
            <label>
              <div className={form.label}>
                Пароль
              </div>

              <div className={form.input}>
                <input
                  type="password"
                  name="password"
                  value={values.password}
                  onChange={handleChange}
                />
              </div>
            </label>

            <Errors errors={errors.password} />
          </div>

          <button className={buttons.main} type="submit">Войти</button>
        </form>

        <div className={styles.recovery}>
          <a href={path('recovery_path')}>
            Не помните пароль? Восстановить
          </a>
        </div>
      </div>
    </div>
  )
}
