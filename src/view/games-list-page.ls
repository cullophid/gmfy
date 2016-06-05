{log, map} = require '../util'
{DIV, H3, A, P} = require '../lib/html'
header = require './header'
newGame = require './new-game'
module.exports = (dispatch, {games, location, gameForm}) -->
  DIV {}, [
    header dispatch, {title: 'Games'}
    DIV class: 'col-md-6 col-md-offset-3',[
      DIV class: 'row',[
        DIV id: 'games-list', class: 'list-group anim-list-stagger', []
      ],
      newGame {gameForm, location}
    ]
  ]
