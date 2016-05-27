{h} = require 'preact'
header = require './header'
module.exports = (dispatch, state) -->
  h 'div', {},
    header dispatch, state
    h 'div', class: 'col-md-6 col-md-offset-3',
      h 'h1', {}, 'PAGE NOT FOUND'
