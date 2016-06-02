{toPairs, join, map} = require '../util'
{Task} = require '../lib/monads'
fetch = require 'whatwg-fetch'

stringifyQuery = (query) ->
  (join '&') (map join '=') toPairs query

module.exports = (fetch) ->
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
  {get, post}
