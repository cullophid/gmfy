test = require 'tape'


test 'test 1', (t) ->
  t.plan 1
  console.log 'TEST 1 START'
  done = ->
    console.log 'TEST 1 DONE'
    t.success 'success'
  setTimeout done, 2000

test 'test 2', (t) ->
  t.plan 1
  console.log 'TEST 2 START'
  done = ->
    console.log 'TEST 2 DONE'
    t.success 'success'
  setTimeout done, 2000
