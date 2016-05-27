{h} = require 'preact'
header = require './header'
module.exports = (dispatch, {title}) -->
  h 'div', {},
    header dispatch, {title}
    h 'div', class: 'col-md-6 col-md-offset-3',
      h 'div', class: 'row',
        h 'div', class: 'list-group anim-list-stagger',
          h 'div', class: 'list-group-item anim-from-left',
            h 'a', href: '#/games/dev-game/activities',
              h 'div' class:"media",
                h 'div' class:"media-left",
                  h 'div' class:"fa fa-circle-o fa-3x",
                h 'div' class: "media-body",
                  h 'h3' {}, 'dev game'
                  h 'p' {}, ''
