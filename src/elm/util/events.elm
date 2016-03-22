module Util.Events where
import String
import Html.Events exposing (on, onWithOptions, targetValue)
import Html exposing (Attribute)
import Actions exposing (Action, actions)

onInput action =
    on "input" targetValue (\str -> Signal.message actions.address (action str))

onNumberInput action =
  on "input" targetValue
    (\str -> Signal.message actions.address <| action <| getInt str)


getInt : String -> Int
getInt str =
  let parsed = String.toInt str
  in
    case parsed of
      Ok value -> value
      _ -> 0


onSubmit : Action -> Attribute
onSubmit msg =
  onWithOptions
    "submit"
    onSubmitOptions
    targetValue
    (\_ -> Signal.message actions.address msg)

onClick : Action -> Attribute
onClick action = Html.Events.onClick actions.address action

onSubmitOptions = {
  stopPropagation = True,
  preventDefault = True
  }

linkTo : String -> Attribute
linkTo path =
  onClick (Actions.GoTo path)
