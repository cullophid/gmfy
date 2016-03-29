module Update.ActivityForm where
import Model exposing (Model)
import Model.Activity exposing (emptyActivity)
import Actions exposing (..)


activityForm : Action -> Model -> Model
activityForm action model =
  let
    {activityForm} = model
  in
    case action of
      AddActivity activity ->
        { model | activityForm = emptyActivity }
      SetActivityTitle title ->
        { model | activityForm = {activityForm| title = title } }
      SetActivityDescription description ->
        { model | activityForm = {activityForm| description = description } }
      SetActivityValue value ->
        { model | activityForm = {activityForm| value = value } }
      _ -> model
