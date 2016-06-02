test = require 'tape'
view = require './'
{findNode} = require '../util'

test 'render the home page if location is `#/`', (t) ->
  t.plan 1
  vdom = view void, {location: '#/'}
  title = findNode ((node) -> node.attributes?.id == 'title'), vdom
  t.deepEqual title.children, ['GMFY']

test 'render the games page if location is `#/games`', (t) ->
  t.plan 1
  vdom = view void, {location: '#/games', games: []}
  title = findNode ((node) -> node.attributes?.id == 'title'), vdom
  t.deepEqual title.children, ['Games']

test 'render the new game page if location is `#/games/new`', (t) ->
  t.plan 1
  vdom = view void, {location: '#/games/new', games: [], gameForm: {}}
  title = findNode ((node) -> node.attributes?.id == 'title'), vdom
  t.deepEqual title.children, ['New Game']

test 'render the not found page form form unknown urls', (t) ->
  t.plan 1
  vdom = view void, {location: '#/i/am/not/valid', games: [], gameForm: {}}
  title = findNode ((node) -> node.attributes?.id == 'title'), vdom
  t.deepEqual title.children, ['Page Not Found']
