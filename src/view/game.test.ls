test = require 'tape'
game = require './game'
{findNode} = require '../util'


test 'should return a list item if not current selected game', (t) ->
  t.plan 3
  vdom = game {id: 'new-game', name: 'new game', description: 'a game'}
  title = findNode ((node) -> node.attributes?.id == 'game-title'), vdom
  description = findNode ((node) -> node.attributes?.id == 'game-description'), vdom
  t.equal vdom.attributes?.class, 'list-group-item'
  t.deepEqual title.children, ['new game']
  t.deepEqual description.children, ['a game']
