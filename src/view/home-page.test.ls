test = require 'tape'
homePage = require './home-page'
{findNode} = require '../util'

test 'homePage should contain a title `GMFY`', (t) ->
  t.plan 1

  vdom = homePage void, {}
  title = findNode ((node) -> node.nodeName == 'h1'), vdom

  t.deepEqual title.children, ['GMFY']
