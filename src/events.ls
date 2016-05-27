{slice, last} = require './util'
{set-location} = require './actions'

module.exports = (dispatch) ->
  window.addEventListener "hashchange", (e) ->
    hash = last slice 0, Infinity, e.newURL.match /(#.*$)/
    dispatch set-location hash
