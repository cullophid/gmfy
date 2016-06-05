{DIV, A} = require '../lib/html'

module.exports = (dispatch, {id, name, description}) ->
  DIV class: 'list-group-item', [
    A href: "#/games/#{id}", [
      DIV class: 'media', [
        DIV class: 'media-left', [
          DIV class: 'fa fa-circle-o fa-x3', []
        ],
        DIV class: 'media-body', []
      ]
    ]
  ]
