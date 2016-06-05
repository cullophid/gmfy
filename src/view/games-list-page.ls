{log, map} = require '../util'
{DIV, H3, A, P} = require '../lib/html'
header = require './header'
game = require './game'

module.exports = (dispatch, {games, path}) -->
  console.log 'PATH', path
  [gameId, subpage, subsubpage] = path?.split '/'
  console.log gameId

  DIV {}, [
    header dispatch, {title: 'Games'}
    DIV class: 'col-md-6 col-md-offset-3',[
      DIV class: 'row',[
        DIV id: 'games-list', class: 'list-group anim-list-stagger', map (game dispatch, gameId), games
      ],
      a class: 'fixed-bottom-right'
    ]
  ]
