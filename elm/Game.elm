module Game exposing (Game, GameForm, Games, GameMsg(..), emptyGame, emptyGameForm, gameDecoder, encodeGameForm)

import Json.Decode as Decode exposing (Decoder, field, string, list, map2, map4)
import Json.Encode as Encode
import RemoteData exposing (WebData)
import Dict exposing (Dict)
import Http

type GameMsg =
    GameTitle String
  | GameDescription String
  | SubmitGame GameForm
  | CreateGameSuccess Game
  | CreateGameFail Http.Error
  | FetchGamesFail Http.Error
  | FetchGamesSuccess (List Game)

type alias Games = WebData (Dict String Game)

type alias Game = {
  id: String,
  title: String,
  description: String,
  users: List String
  }

type alias GameForm = {
  title: String,
  description: String
  }


emptyGame : Game
emptyGame = {
  id = "",
  title = "",
  description = "",
  users = []
  }

gameDecoder : Decoder Game
gameDecoder = map4 Game
  (field "id" string)
  (field "title" string)
  (field "description" string)
  (field "users" (list string))


emptyGameForm : GameForm
emptyGameForm = {
  title = "",
  description = ""
  }

encodeGameForm : GameForm -> Encode.Value
encodeGameForm gameForm =
  Encode.object [
    ("title", Encode.string gameForm.title),
    ("description", Encode.string gameForm.description)
  ]
