{ find, slice, head, tail } = require '../util'

toArray = slice 0, Infinity
firstMatch = (url, routes) -->
  when routes.length == 0 then void
  when (resolveRoute url, head routes) then that
  when _ then firstMatch url, tail routes

resolveRoute = (url, {regex, handler}) -->
  matches = url.match regex
  if matches
    handler ...(tail toArray matches)
  else false

export route = (regex, handler) --> {regex, handler}

export router = (url, routes) -->
  firstMatch url, routes
