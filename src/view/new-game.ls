{DIV, A, H1} = require '../lib/html'

module.exports = (dispatch, {gameForm, location}) ->
  isNewGamePage = location == '#/games/new'
  rootClass = if isNewGamePage
    'page bg-success'
  else 'fixed-bottom-right btn btn-success'
  DIV class: rootClass, [
    if isNewGamePage
      A href: '#/games/new', ['New Game']
    else
      H1 id: 'game-title', ['New Game']
  ]
