{DIV, NAV, UL, LI, A, HR} = require '../lib/html'
header = require './header'

module.exports = (dispatch, props) -->
  {title, game} = props
  {name, description} = game
  DIV {}, [
    (header dispatch, {title: name}),
    DIV class: 'col-md-6 col-md-offset-3', [
      DIV class: 'row', [
        NAV class: 'navbar', [
          UL class: 'navbar-nav nav', [
            LI class: 'nav-item', [
              A class: 'nav-link', href: '#/games/dev-game/activities', 'Activities'
            ]
            LI class: 'nav-item', [
              LI class: 'nav-link', href: '#/games/dev-game/players', 'Players'
            ]
          ]
        ]
      ]
      HR {},[]
      DIV class: 'row', [
        DIV class: 'list-group anim-list-stagger', []
      ]
      A class: 'fixed-bottom-right btn btn-success anim-from-right anim-delay-400', href: '#/games/dev-game/activities/new', 'New Activity'
    ]
  ]
