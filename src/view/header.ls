{h} = require 'preact'
module.exports = (dispatch, {title}) -->
  h 'div' class: 'anim-fade-in', [
    h 'div', class: 'card-block', [
      h 'div', class: 'space-between', [
        h 'a', class: 'fa fa-home fa-2x', href: '#', []
        h 'h1', {}, title
        h 'div', {}, []
      ]
    ]
  ]
