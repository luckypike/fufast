import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import axios from 'axios'

Cart.propTypes = {
  token: PropTypes.string.isRequired,
  products: PropTypes.array.isRequired,
  user: PropTypes.object
}

export default function Cart ({ token, user, products }) {
  const [values, setValues] = useState()
  const [errors, setErrors] = useState({})

  useEffect(() => {
    if (user) setValues({ ...values, user_id: user.id })
  }, [user])

  const handleSubmit = async e => {
    e.preventDefault()

    await axios.post('/orders', {
      order: values,
      authenticity_token: token
    }).then(res => {
      window.location = res.headers.location
    }).catch((error) => {
      setErrors(error.response.data)
    })
  }

  const handleUserChange = (userValues) => {
    setValues({ ...values, user_attributes: userValues })
  }

  console.log(products)

  return (
    <div>
      CART

      {products.length > 0 &&
        <div>
          {products.map(product =>
            <div key={product.id}>
              {product.title}

              {product.attachments.map(attachment =>
                <div key={attachment.id}>
                  <img src={attachment.path} />
                </div>
              )}
            </div>
          )}
        </div>
      }

      <div>
        <form onSubmit={handleSubmit}>
          {user &&
            <div>{user.name}</div>
          }

          {!user && <User onValuesChange={handleUserChange} /> }

          {errors.email_exists && errors.email_exists === true &&
            <div>
              <p>
                Такая почта уже ранее использовалась для заказов.
              </p>

              <a href="/login">Войти или восстановить доступ</a>
            </div>
          }
          <button type="submit">Оформить заказ</button>
        </form>
      </div>
    </div>
  )
}

User.propTypes = {
  onValuesChange: PropTypes.func
}

function User ({ onValuesChange }) {
  const [values, setValues] = useState({
    email: '',
    phone: '',
    name: '',
    lastname: ''
  })

  useEffect(() => {
    onValuesChange && onValuesChange(values)
  }, [values])

  const handleChange = ({ target: { name, value } }) => {
    setValues({ ...values, [name]: value })
  }

  return (
    <>
      <div>
        <input
          type="email"
          name="email"
          value={values.email}
          onChange={handleChange}
        />
      </div>

      <div>
        <input
          type="text"
          name="name"
          value={values.name}
          onChange={handleChange}
        />
      </div>

      <div>
        <input
          type="text"
          name="lastname"
          value={values.lastname}
          onChange={handleChange}
        />
      </div>

      <div>
        <input
          type="tel"
          name="phone"
          value={values.phone}
          onChange={handleChange}
        />
      </div>

    </>
  )
}
