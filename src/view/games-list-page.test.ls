test = require 'tape'
gamesListPage = require './games-list-page'
{findNode} = require '../util'

test 'should render a list of games', (t) ->
  t.plan  2
  vdom = gamesListPage void, {games: [{name: 'game', description: 'description'}]}
  title = findNode ((node) -> node.nodeName == 'h3'), vdom
  description = findNode ((node) -> node.nodeName == 'p'), vdom
  t.deepEqual title.children, ['game']
  t.deepEqual description.children, ['description']

test 'should render an empty list if no games are provided', (t) ->
  t.plan  1
  vdom = gamesListPage void, {games: []}
  list = findNode ((node) -> node.attributes?.id == 'games-list'), vdom
  t.deepEqual list.children, []
