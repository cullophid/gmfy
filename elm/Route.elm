module Route exposing (Route(..), parseRoute)

import UrlParser exposing (s)
import UrlParser exposing (Parser, s, parsePath, map, (</>), string, oneOf)
import Navigation exposing (Location)
type Route =
    NotFound
  | GameListRoute
  | NewGameRoute
  | NewActivityRoute String
  | GameRoute String
  | ActivityRoute String String


parseRoute : Location -> Route
parseRoute location =
  let
    parser = oneOf [
      map NewGameRoute (s "games" </> s "new"),
      map NewActivityRoute (s "games" </> string </> s "activities" </> s "new"),
      map ActivityRoute (s "games" </> string </> s "activities" </> string),
      map GameRoute (s "games" </> string),
      map GameListRoute (s "games")
      ]
  in
    Maybe.withDefault NotFound <| parsePath parser location
