{h} = require 'preact'
{router, route} = require './router'
home-page = require './home-page'
games-list-page = require './games-list-page'
not-found-page = require './not-found-page'

module.exports = (dispatch, state) -->
  {location} = state

  router location, [
    * /^#$/,
      -> home-page dispatch, state
    * /^#\/games$/,
      -> games-list-page dispatch, state
    * /./,
      -> not-found-page dispatch, state
  ]
