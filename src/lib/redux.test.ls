test = require 'tape'
sinon = require 'sinon'
redux = require './redux'

test 'redux should implement `getState`', (t) ->
  t.plan 2
  update = sinon.spy ->
    ['My State']
  state = redux update

  t.equal state.getState(), 'My State'
  t.equal update.calledOnce, true

test 'redux should implement `dispatch`', (t) ->
  t.plan 3

  update = sinon.spy (state, action) ->
    [{state, action}]
  state = redux update
  action = {type: 'ACTION'}
  newState = state.dispatch action

  t.equal update.callCount, 2, 'should call update twice'
  t.deepEqual state.getState(), {state: {action: [], state: undefined}, action},  'Should update state'
  t.deepEqual state.getState(), newState[0], 'should return state'

test 'redux should implement subscribe', (t) ->
  t.plan 4

  update = sinon.spy (state, action) ->
    [{state, action}]
  state = redux update
  subscriber = sinon.spy()
  state.subscribe subscriber
  action = {type: 'ACTION'}
  state.dispatch action
  t.equal update.callCount, 2
  t.equal subscriber.callCount, 2
  t.deepEqual subscriber.args[0][0], [{action: [], state: undefined}]
  t.deepEqual subscriber.args[1][0], [{action: action, state: {action: [], state: undefined}}]


test 'redux subscribe should return an unsibscribe function', (t) ->
  t.plan 2

  update = sinon.spy (state, action) ->
    [{state, action}]
  state = redux update
  subscriber = sinon.spy()
  unsubscribe = state.subscribe subscriber
  state.dispatch {type: 'ACTION'}
  unsubscribe()
  state.dispatch {type: 'ACTION'}

  t.equal update.callCount, 3
  t.equal subscriber.callCount, 2
