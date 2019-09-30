import React from 'react'
import PropTypes from 'prop-types'
import axios from 'axios'

New.propTypes = {
  token: PropTypes.string.isRequired
}

export default function New ({ token }) {
  const handleLogin = async () => {
    await axios.post('/login', {
      user: {
        email: 'we@luckypike.com'
      },
      authenticity_token: token
    }).then(res => {
      console.log(res)
    }).catch((error) => {
      console.log(error)
    })
  }

  return (
    <div>
      <button onClick={handleLogin}>
        LOGIN
      </button>
    </div>
  )
}
