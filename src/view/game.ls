{DIV, A} = require '../lib/html'

module.exports = (dispatch, {id, name, description}) -->
  console.log 'NAME', name
  DIV class: 'list-group-item' 'data-test': 'game', [
    A href: "#/games/#{id}", [
      DIV class: 'media', [
        DIV class: 'media-left', [
          DIV class: 'fa fa-circle-o fa-x3', []
        ],
        DIV class: 'media-body', []
      ]
    ]
  ]
