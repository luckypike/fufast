import React, { useState } from 'react'
import PropTypes from 'prop-types'
import axios from 'axios'

import { Errors } from '../Form'
import { path } from '../Routes'

import page from '../Page.module.css'
import form from '../Form.module.css'
import buttons from '../Buttons.module.css'

New.propTypes = {
  token: PropTypes.string.isRequired
}

export default function New ({ token }) {
  const [values, setValues] = useState({
    email: ''
  })

  const handleChange = ({ target: { name, value } }) => {
    setValues({ ...values, [name]: value })
  }

  const [errors, setErrors] = useState({})

  const handleSubmit = async e => {
    e.preventDefault()

    await axios.post(path('recovery_path'), {
      user: values,
      authenticity_token: token
    }).then(res => {

    }).catch((error) => {
      setErrors(error.response.data)
    })
  }

  return (
    <div className={page.root}>
      <div className={page.text}>
        <h1>
          Восстановить доступ
        </h1>

        <form onSubmit={handleSubmit} className={form.root}>
          <p>
            Для восстановления доступа напишите вашу почту, мы вышлем на нее письмо со ссылкой по которой нужно будет перейти для продолжения.
          </p>

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

          <button className={buttons.main} type="submit">Продолжить</button>
        </form>
      </div>
    </div>
  )
}
