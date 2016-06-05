{propEq, find} = require '../util'
{router, route} = require '../lib/router'
homePage = require './home-page'
gamesListPage = require './games-list-page'
gamePage = require './game-page'
notFoundPage = require './not-found-page'
newGamePage = require './new-game-page'




module.exports = (dispatch, state) -->
  {location, gameForm, games} = state

  router location, [
    route /^#\/games\/?(.*)$/, (path)-> gamesListPage dispatch, {games, location, gameForm}
    route /.*/, -> notFoundPage dispatch, state
  ]
