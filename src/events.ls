{log, slice, last} = require './util'
{setLocation} = require './actions'

module.exports = (dispatch) ->
  window.addEventListener "hashchange", (e) ->
    hash = last slice 0, Infinity, e.newURL.match /(#.*$)/
    dispatch setLocation log 'hash', hash
