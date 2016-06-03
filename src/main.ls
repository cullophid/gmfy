{render} = require 'preact'
events = require './events'
redux = require './lib/redux'
view = require './view'
storage = require './lib/storage'
update = require './update'
commands = require './commands'
{log, curryN} = require './util'

dom = null
mainElement = document.getElementById 'main'
{dispatch, subscribe, getState} = redux update commands

events dispatch

updateUrl = ({location}) ->
  history.pushState {}, "", location unless location == window.location.hash

subscribe ([state, command]) ->
  console.log 'STATE', state
  updateUrl state
  command.fork(-> void, -> void)
  storage.set 'state', state
  dom := render (view dispatch, state), mainElement, dom
