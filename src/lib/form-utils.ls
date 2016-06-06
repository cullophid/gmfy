{setFormField} = require '../actions'
export formOnInput = (dispatch, form, field, e) -->
  dispatch setFormField form, field, e.target.value
