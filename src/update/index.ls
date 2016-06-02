redirect = require './redirect'
storage = require '../lib/storage'
{log, merge, assocPath, replace} = require '../util'

getHash = ->
  if window? then window.location.hash else '#'

emptyModel =
  games: []
  gameForm:
    name: ''
    description: ''

init = {
  ...emptyModel,
  ...(storage.get 'state'),
  location: redirect getHash()
}

newGame = (payload) ->
  {
    ...payload,
    id: replace /\s/g, '-', payload.name
    activities: [],
    players: []
  }

module.exports = (commands) -> (state = init, [type, payload]) ->
  {games, location} = state
  switch type
    when 'LOGIN' then [state, commands.login]
    when 'SET_LOCATION'
      location = redirect payload
      switch location
        when '#/games/new'
          [{
            ...state,
            location,
            gameForm: emptyModel.gameForm
          }, commands.noop]
        when _ then [{ ...state, location}, commands.noop]
    when 'SET_FORM_FIELD' then [(assocPath [payload.form, payload.field], payload.value, state), commands.noop]
    when 'CREATE_GAME'
      [{
        ...state,
        games: [...games, newGame(payload)]
        location: '#/games'
      }, commands.noop]
    when _ then [state, commands.noop]
