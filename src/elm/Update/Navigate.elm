module Update.Navigate where
import Actions
import Actions exposing (..)
import Model exposing (Model)
import Model.Page
import String

navigate : Action -> Model -> Model
navigate action model =
  case action of
    Navigate url ->
      {model
      | page = Model.Page.fromUrl url
      , url = url
      }

    CreateGame _ ->
      { model
      | page = Model.Page.fromUrl "#/games"
      , url = "#/games"
      }
    DeleteGame _ ->
      { model
      | page = Model.Page.fromUrl "#/games"
      , url = "#/games"
      }

    AddActivity gameId _ ->
      let url = "#/games/" ++ gameId ++ "/activities"
      in
        { model
        | page = Model.Page.fromUrl url
        , url = url
        }
    CompleteActivity _ ->
      let
        url = (String.join "/" <| List.take 3 <| String.split "/" model.url) ++ "/players"
      in
        { model
        | page = Model.Page.fromUrl url
        , url = url
        }
    DeleteActivity _ _ ->
      let
        url = String.join "/" <| List.take 4 <| String.split "/" model.url
      in
        { model
        | page = Model.Page.fromUrl url
        , url = url
        }


    _ -> model
