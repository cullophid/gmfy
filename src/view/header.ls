{DIV, A, H1} = require '../lib/html'
module.exports = (dispatch, {title}) -->
  DIV class: 'anim-fade-in', [
    DIV class: 'card-block', [
      DIV class: 'space-between', [
        A class: 'fa fa-home fa-2x', href: '#/', []
        H1 id: 'title', title
        DIV {}, []
      ]
    ]
  ]
