{filter, forEach} = require './util'
module.exports = (update) -->
  state = update void []
  subscribers = []
  dispatch = (action) ->
    state = update state, action
    forEach ((f) -> f state), subscribers
    state

  subscribe = (subscriber) ->
    subscriber state
    subscribers := [ ...subscribers, subscriber]
    ->
      subscribers := filter (!= subscriber), subscribers

  getState = -> state

  {dispatch, subscribe, getState}
