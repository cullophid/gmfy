module Update exposing (update)
import Model exposing (..)
import Debug

update : Msg -> Model -> (Model, Cmd Msg)
update message model =
  Debug.log "State" <| case message of
    NoOp -> (model, Cmd.none)
    Location hash -> ({model | location = hash} , Cmd.none)
    GameFormTitle title ->
      let
        {gameForm} = model
        state = { model | gameForm = {gameForm| title = title}}
      in (state, Cmd.none)
    _ -> (model, Cmd.none)
