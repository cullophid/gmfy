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
    route /^#\/$/, -> homePage dispatch, state
    route /^#\/games\/new$/, -> newGamePage dispatch, {gameForm}
    route /^#\/games\/(.*)\/activities$/, (gameId) -> gamePage dispatch, {game: (find (propEq 'id', gameId), games)}
    route /^#\/games$/, -> gamesListPage dispatch, {games}
    route /.*/, -> notFoundPage dispatch, state
  ]
