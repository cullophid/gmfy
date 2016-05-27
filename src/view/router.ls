{ find, slice, head, tail } = require '../util'

to-array = slice 0, Infinity
home-page = require './home-page'
firstMatch = (url, routes) -->
  when routes.length == 0 then void
  when (resolve-route url, head routes) then that
  when _ then firstMatch url, tail routes

resolve-route = (url, [regex, handler]) -->
  matches = url.match regex
  if matches
    handler ...(tail to-array matches)
  else false

export route = (regex, handler) --> {regex, handler}

export router = (url, routes) -->
  console.log 'routes', routes
  firstMatch url, routes
