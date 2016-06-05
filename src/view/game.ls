{DIV} = require '../lib/html'

module.exports = (dispatch, {id, name, description}) ->
  div class: 'list-group-item', [
    a href: "#/games/#{id}", [
      div class: 'media', [
        div class: 'media-left', [
          div class: 'fa fa-circle-o fa-x3', []
        ],
        div class: 'media-body', []
      ]
    ]
  ]
