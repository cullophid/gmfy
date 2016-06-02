{DIV, FORM, LABEL, INPUT} = require '../lib/html'
setForm
module.exports = (dispatch, {loginForm}) ->
  setField = (field, e) -->
    dispatch setFormField 'loginForm', field, e.target.value

  DIV class: '', [
    FORM onSubmit: onSubmit, [
      LABEL {}, [
        'Email'
        INPUT {
          class: 'form-control'
          type: 'text'
          onInput: setField 'email'
          value: loginForm.email
        }
      ]
      LABEL {}, [
        'Email'
        INPUT {
          class: 'form-control'
          type: 'password'
          onInput: setField 'password'
          value: loginForm.password
        }
      ]
    ]
  ]
