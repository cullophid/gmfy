{DIV, FORM, INPUT, LABEL, A, TEXTAREA, BUTTON} = require '../lib/html'
{log} = require '../util'
{formOnInput} = require '../lib/form-utils'
header = require './header'
{createGame, setFormField} = require '../actions'

onSubmit = (dispatch, form, e) -->
  e.preventDefault()
  dispatch create-game form

newGameButton =
  A {
    class: 'btn btn-success fixed-bottom-right'
    href: '#/games/new'
    id: 'new-game-button'
    }, ['New Game']

newGamePage = (dispatch, gameForm) -->
  setField = formOnInput dispatch, 'gameForm'
  DIV {}, [
    DIV class: 'col-md-6 col-md-offset-3', [
      FORM id: 'new-game-form', onSubmit: (onSubmit dispatch, gameForm), [
        DIV class: 'form-group anim-fold-in', [
          LABEL {}, 'Title'
          INPUT (
            name: 'name'
            type: 'text'
            class: 'form-control'
            value: gameForm.name
            onInput: (setField 'name')
            ), []
        ]
        DIV class: 'form-group anim-fold-in anum-delay-100', [
          LABEL {}, 'Description'
          TEXTAREA (
            name: 'description'
            class: 'form-control'
            onInput: (setField 'description')
            value: gameForm.description
            ), []
        ]
        DIV class: 'row', [
          DIV class: 'col-xs-6 anim-fold-in anum-delay-200', [
            A class: 'btn btn-danger btn-block', href: '#/', 'Cancel'
          ]
          DIV class: 'col-xs-6 anim-fold-in anum-delay-300', [
            BUTTON type: 'submit', class: 'btn btn-success btn-block', 'Create Game'
          ]
        ]
      ]
    ]
  ]

module.exports = (dispatch, {location, gameForm}) -->
  if location == '#/games/new'
    newGamePage dispatch, gameForm
  else
    newGameButton
