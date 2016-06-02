test = require 'tape'
header = require './header'
{findNode} = require '../util'


test 'should render a header with the given title', (t) ->
  t.plan 1
  vdom = header void, title: 'title'

  title = findNode ((node) -> node.attributes?.id == 'title'), vdom

  t.deepEqual title.children, ['title']
