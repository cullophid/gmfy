{DIV, A, H3, P} = require '../lib/html'

module.exports = (dispatch, selectedId, game) -->
  {id, name, description} = game
  if selectedId == id then console.log 'SELECTED', name
  rootClass = if selectedId == id then 'full-screen fixed bg-warning' else 'list-group-item anim-from-left'
  DIV class: rootClass, [
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
