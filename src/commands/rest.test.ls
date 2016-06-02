test = require 'tape'
sinon = require 'sinon'
rest = require './rest'


test 'get should return a Task', (t) ->
  t.plan 3
  headers =
    'Accept': 'application/json'
  fetch = sinon.spy -> Promise.resolve 'It worked'
  {get} = rest fetch
  task = get 'url', param: 'param'

  t.equal fetch.called, false
  task.fork ((err)-> t.fail "should not return #{err}")
  t.equal fetch.calledOnce, true
  t.deepEqual fetch.args[0], ['url?param=param', {headers}]

test 'post should return a Task', (t) ->
  t.plan 3
  headers =
    'Accept': 'application/json'
  fetch = sinon.spy -> {then: -> void}
  {get} = rest fetch
  task = get 'url', param: 'param'

  t.equal fetch.called, false
  task.fork ((err)-> t.fail "should not return #{err}")
  t.equal fetch.calledOnce, true
  t.deepEqual fetch.args[0], ['url?param=param', {headers}]
