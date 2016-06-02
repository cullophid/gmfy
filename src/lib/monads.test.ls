test = require 'tape'
sinon = require 'sinon'
{map, chain} = require '../util'
{Task} = require './monads'


test 'new Task should call success when forked with out errors', (t) ->
  t.plan 3
  handler = sinon.spy (reject, resolve) -> resolve 'It worked'
  f = new Task handler
  t.equal handler.called, false

  f.fork t.fail, ((d) ->
    t.equal d, 'It worked'
    t.equal handler.calledOnce, true
  )

test 'new Task should call error when forked with errors', (t) ->
  t.plan 3
  handler = sinon.spy (reject, resolve) -> reject 'It worked'
  f = new Task handler
  t.equal handler.called, false

  f.fork ((d) ->
    t.equal d, 'It worked'
    t.equal handler.calledOnce, true
  ), t.fail

test 'Task.of should create a new Task which always resolves', (t) ->
  t.plan 1
  f = Task.of 'hello world'
  f.fork t.fail, (d) -> t.equal d, 'hello world'

test 'Tasks should implement `map`', (t) ->
  t.plan 1
  f = Task.of 1
  f2 = map (+ 1), f
  f2.fork t.fail, (d) -> t.equal d, 2

test 'Tasks should implement `chain`', (t) ->
  t.plan 1
  f = Task.of 1
  f2 = chain ((v) -> Task.of v + 1), f
  f2.fork t.fail, (d) -> t.equal d, 2
