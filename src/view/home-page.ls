{h} = require 'preact'
header = require './header'
module.exports = (dispatch, {title}) -->
  h 'div', {},
    header dispatch, {title}
    h 'div', class: 'col-md-6 col-md-offset-3',
      h 'h2', {}, 'Welcome to GMFY'
      h 'div', class: 'form-group',
        h 'a', class: 'btn btn-block btn-white-outline', href: '#/games', 'View Your Games'
      h 'div', {},
        h 'a', class: 'btn btn-block btn-white-outline', href: '#/games/new', 'Create New Game'
