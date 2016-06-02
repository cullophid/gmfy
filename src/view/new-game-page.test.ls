test = require 'tape'
sinon = require 'sinon'
newGamePage = require './new-game-page'
{findNode} = require '../util'

triggerInput = (e, elem) --> elem?.attributes?.onInput e
triggerSubmit = (e, elem) --> elem?.attributes?.onSubmit e

state=
  gameForm:
    name: 'old name'
    description: 'old description'

test 'new-game-page should dispatch a SET_FORM_FIELD when name changes', (t) ->
  t.plan 3
  dispatch = sinon.spy()
  vdom = newGamePage dispatch, state
  name = findNode ((node) -> node.attributes?.name == 'name'), vdom

  t.equal name.attributes?.value, 'old name'

  triggerInput target: value: 'new name', name

  t.equal dispatch.calledOnce, true
  t.deepEqual dispatch.args[0], [['SET_FORM_FIELD', {form: 'gameForm', field: 'name', value: 'new name'}]]

test 'new-game-page should dispatch a SET_FORM_FIELD when name changes', (t) ->
  t.plan 3
  dispatch = sinon.spy()
  vdom = newGamePage dispatch, state

  description = findNode ((node) -> node.attributes?.name == 'description'), vdom

  t.equal description.attributes.value, 'old description'

  triggerInput target: value: 'new description', description

  t.equal dispatch.calledOnce, true
  t.deepEqual dispatch.args[0], [['SET_FORM_FIELD', {form: 'gameForm', field: 'description', value: 'new description'}]]

test 'new-game-page should dispatch an action on form submit', (t) ->
  t.plan 3
  dispatch = sinon.spy()
  vdom = newGamePage dispatch, state

  form = findNode ((node) -> node.attributes?.id == 'new-game-form'), vdom

  e = preventDefault: sinon.spy()

  triggerSubmit e, form

  t.equal dispatch.calledOnce, true
  t.deepEqual dispatch.args[0], [['CREATE_GAME', {name: 'old name', description: 'old description'}]]

  t.equal e.preventDefault.calledOnce, true
