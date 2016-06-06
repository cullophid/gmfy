test = require 'tape'
gamesListPage = require './games-list-page'
{findNode} = require '../util'

test 'games-list-page should render a list of games', (t) ->
  t.plan  1
  vdom = gamesListPage void, {games: [{id: 'game', name: 'game', description: 'description'}]}
  game = findNode ((node) -> node.attributes?['data-test'] == 'game'), vdom
  t.ok game

test 'games-list-page should render a New Game button', (t) ->
  t.plan  1
  vdom = gamesListPage void, {games: [{id: 'game', name: 'game', description: 'description'}]}
  newGame = findNode ((node) -> node.attributes?.id == 'new-game-button'), vdom
  t.equals newGame.attributes.href, '#/games/new'

test 'games-list-page should render an empty list if no games are provided', (t) ->
  t.plan  1
  vdom = gamesListPage void, {games: []}
  list = findNode ((node) -> node.attributes?.id == 'games-list'), vdom
  t.deepEqual list.children, []
