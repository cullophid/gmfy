test = require 'tape'
{log, findNode} = require '../util'
gamePage = require './game-page'

test 'should render the gamePage', (t) ->
  t.plan 1
  dispatch = -> void
  game = {name: 'game name', description: 'game description'}
  vdom = gamePage dispatch, {game}

  navbar = findNode ((node) -> node.attributes?.class == 'navbar-nav nav'), vdom
  t.equal navbar.nodeName, 'ul'
