module Update exposing (update)
import Model exposing (..)

update : Msg -> Model -> (Model, Cmd Msg)
update message model =
  case message of
    NoOp -> (model, Cmd.none)
