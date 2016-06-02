test = require 'tape'
sinon = require 'sinon'
{chain, first, findNode} = require './'


test 'chain should dispatch to the monads chain method', (t) ->
  t.plan 2
  monad = chain: sinon.spy()
  chain 'fn', monad
  t.equal monad.chain.calledOnce, true
  t.deepEqual monad.chain.args[0], ['fn']

test 'chain should throw if method is not implemented', (t) ->
  t.plan 1
  monad = {}
  try
    chain 'fn', monad
    t.fail 'did not throw'
  catch
    t.pass 'monad threw'

test 'first should return the first element matching the predicate, and stop', (t) ->
  t.plan 4
  list = [(sinon.spy -> void), (sinon.spy -> 'success'), (sinon.spy -> void)]
  actual = first ((f) -> f()), list

  t.equal actual, 'success'
  t.equal list[0].calledOnce, true
  t.equal list[1].calledOnce, true
  t.equal list[2].called, false

test 'findNode should walk the given tree and return the first node matching the predicate', (t) ->
  t.plan 1
  tree =
    nodeName: '1'
    children:
      {
        nodeName: 'node'
        children: []
      }
      {
        nodeName: 'node'
        children: [
          { nodeName: 'target', children: ['success']}
        ]
      }
      {
        nodeName: 'node'
        children: [
          { nodeName: 'target', children: ['fail']}
          ]
      }

  actual = findNode ((node) -> node.nodeName == 'target'), tree

  t.deepEqual actual.children, ['success']
