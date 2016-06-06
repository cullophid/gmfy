{log, map} = require '../util'
{DIV, H3, A, P} = require '../lib/html'
header = require './header'
game = require './game'
newGame = require './new-game-page'
module.exports = (dispatch, {games, location, gameForm}) -->
  DIV {}, [
    (header dispatch, {title: 'Games'})
    DIV class: 'col-md-6 col-md-offset-3', [
      DIV class: 'row',[
        DIV id: 'games-list', class: 'list-group anim-list-stagger',
          (map (game dispatch), games)
      ]
    ]

    newGame dispatch, {gameForm, location}
  ]
