{DIV, H1} = require '../lib/html'
header = require './header'
module.exports = (dispatch, state) -->
  DIV {}, [
    header dispatch, {title: 'Page Not Found'}
    DIV class: 'col-md-6 col-md-offset-3', [
      H1 {}, 'PAGE NOT FOUND'
    ]
  ]
