{log, map} = require '../util'
{DIV, H3, A, P} = require '../lib/html'
header = require './header'

renderGame = ({id, name, description}) ->
  DIV class: 'list-group-item anim-from-left', [
    A href: "#/games/#{id}/activities", [
      DIV class:"media", [
        DIV class:"media-left", [
          DIV class:"fa fa-circle-o fa-3x", []
        ]
        DIV class: "media-body", [
          H3 {}, name
          P {}, description
        ]
      ]
    ]
  ]

module.exports = (dispatch, {games}) -->
  DIV {}, [
    header dispatch, {title: 'Games'}
    DIV class: 'col-md-6 col-md-offset-3',[
      DIV class: 'row',[
        DIV id: 'games-list', class: 'list-group anim-list-stagger', map renderGame, games
      ]
    ]
  ]
