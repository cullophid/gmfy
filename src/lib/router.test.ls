test = require 'tape'
sinon = require 'sinon'
{router, route} = require './router'


test 'route should return a route object', (t) ->
  t.plan 1
  regex = /./
  handler= -> void
  t.deepEqual (route regex, handler), {regex, handler}

test 'router should call the handler of the first match', (t) ->
  t.plan 3
  matchedHandler = sinon.spy -> 'firstMatch'
  unMatchedHandler = sinon.spy()
  actual = router '#/', [
    route /^doesnotmatch$/, unMatchedHandler
    route /^.*$/, matchedHandler
    route /^doesnotmatch$/, unMatchedHandler
  ]

  t.equal actual, 'firstMatch'
  t.equal unMatchedHandler.called, false
  t.equal matchedHandler.calledOnce, true

test 'router should pass in matched args to the handler', (t) ->
    t.plan 2
    handler = sinon.spy()
    router '#/firstArg/secondArg', [
      route /^#\/(.*)\/(.*)$/, handler
    ]

    t.equal handler.calledOnce, true
    t.deepEqual handler.args[0], ['firstArg', 'secondArg']
