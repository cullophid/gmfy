{DIV, H2, A} = require '../lib/html'
header = require './header'
module.exports = (dispatch, state) -->
  DIV {}, [
    header dispatch, {title: 'GMFY'}
    DIV class: 'col-md-6 col-md-offset-3', [
      H2 {}, 'Welcome to GMFY'
      DIV class: 'form-group', [
        A class: 'btn btn-block btn-white-outline', href: '#/games', 'View Your Games'
      ]
      DIV {}, [
        A class: 'btn btn-block btn-white-outline', href: '#/games/new', 'Create New Game'
      ]
    ]
  ]
