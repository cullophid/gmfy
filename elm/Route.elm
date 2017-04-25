module Route exposing (Route(..), parseRoute)

import UrlParser exposing (s)
import UrlParser exposing (Parser, s, parsePath, map, (</>), string, oneOf)
import Navigation exposing (Location)
type Route =
    NotFound
  | HomeRoute
  | LoginRoute
  | LoginPendingRoute
  | LoginTokenRoute String
  | GameListRoute
  | NewGameRoute
  | NewActivityRoute String
  | GameRoute String
  | InvitePlayerRoute String
  | ActivityRoute String

parseRoute : Location -> Route
parseRoute location =
  let
    parser = oneOf [
      map NewActivityRoute (s "games" </> string </> s "activities" </> s "new"),
      map InvitePlayerRoute (s "games" </> string </> s "invite"),
      map NewGameRoute (s "games" </> s "new"),
      map ActivityRoute (s "activities" </> string),
      map GameRoute (s "games" </> string),
      map LoginPendingRoute (s "login" </> s "pending"),
      map LoginTokenRoute (s "login" </> string),
      map GameListRoute (s "games"),
      map LoginRoute (s "login"),
      map HomeRoute (s "")
      ]
  in
    Maybe.withDefault NotFound <| parsePath parser location
