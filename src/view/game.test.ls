test = require 'tape'
game = require './game'
{findNode} = require '../util'


test 'should return a list item if not current selected game', (t) ->
  t.plan 1
  vdom = game void {id: 'new-game', name: 'new game', description: 'a game'}
  t.equal vdom.attributes?.class, 'list-group-item'
