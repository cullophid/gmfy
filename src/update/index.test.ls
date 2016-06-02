test = require 'tape'
{assocPath} = require '../util'
{diffString} = require 'json-diff'

commands =
  noop: -> void
  login: -> void

update = (require './') commands

init =
  games: []
  location: '#/'
  gameForm:
    name: ''
    description: ''

test 'update should return init state if given an empty action', (t) ->
  t.plan 2
  [state, cmd] = update void []

  t.deepEqual state, init
  t.equal cmd commands.noop

test 'update should return a login command on LOGIN', (t) ->
  t.plan 2
  [state, cmd] = update void ['LOGIN', {email: 'test@email.com'}]

  t.equal cmd, commands.login
  t.deepEqual state, init

test 'update should update location on SET_LOCATION', (t) ->
  t.plan 2
  [state, cmd] = update init, ['SET_LOCATION', '#/games']

  t.equal cmd, commands.noop
  t.deepEqual state, {...init, location: '#/games'}

  test 'update should clear gameForm on SET_LOCATION = `#/games/new`', (t) ->
    t.plan 2
    [state, cmd] = update {...init, gameForm: {name: 'name', description: 'description'}} ['SET_LOCATION', '#/games/new']

    t.equal cmd, commands.noop
    t.deepEqual state, {...init, location: '#/games/new'}

test 'update should update the specified form field on SET_FORM_FIELD', (t) ->
  t.plan 2
  [state, cmd] = update void ['SET_FORM_FIELD', {form: 'gameForm', field: 'name', value: 'hello'}]

  t.equal cmd, commands.noop
  t.deepEqual state, assocPath ['gameForm', 'name'], 'hello', init

test 'update should add a new game to the game list on CREATE_GAME', (t) ->
  t.plan 2
  [state, cmd] = update void ['CREATE_GAME', {name: 'game name', description: 'game description'}]
  newGame =
    id: 'game-name'
    name: 'game name'
    description: 'game description'
    activities: []
    players: []

  t.equal cmd, commands.noop
  t.deepEqual state, {
    ...init,
    games: [newGame]
    location: '#/games'
  }
