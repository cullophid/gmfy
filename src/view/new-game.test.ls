test = require 'tape'
sinon = require 'sinon'
newGame = require './new-game'


test 'Should be a button when not on #/games/new', (t) ->
  t.plan 2
  page = newGame void, {location: '#/games'}
  t.equal page.children.length, 1
  t.equal page.children[0].nodeName, 'h1'
