{join, map, toPairs} = '../util'
Future = require 'fantasy-future'
fetch = require 'whatwg-fetch'

stringifyQuery = (query) ->
  (join '&') (map join '=') toPairs query

post = (url, query, data) -->
  new Task (reject, resolve) ->
    options =
      headers:
        'Accept': 'application/json'
        'Content-Type': 'application/json'
      body: data

    fetch "#{url}?#{stringifyQuery query}", options .then resolve, reject

get = (url, query) -->
  new Task (reject, resolve) ->
    options =
      headers:
        'Accept': 'application/json'

    fetch "#{url}?#{stringifyQuery query}", options .then resolve, reject


export login = (email) ->
  post 'localhost:1337/authenticate', {email}
