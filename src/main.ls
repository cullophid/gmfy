{render} = require 'preact'
events = require './events'
redux = require './redux'
view = require './view'
update = require './update'

dom = void
main-element = document.getElementById 'main'
{dispatch, subscribe, getState} = redux update

events dispatch

subscribe (state) ->
  dom := render (view dispatch, state), main-element, dom
