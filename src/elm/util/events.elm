module Util.Events where
import String
import Html.Events exposing (on, onWithOptions, targetValue)
import Html exposing (Attribute)
import Actions exposing (Action)

onInput action =
    on "input" targetValue (\str -> Signal.message Actions.address (action str))

onNumberInput action =
  on "input" targetValue
    (\str -> Signal.message Actions.address <| action <| getInt str)


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
    (\_ -> Signal.message Actions.address msg)

onClick : Action -> Attribute
onClick action = Html.Events.onClick Actions.address action

onSubmitOptions = {
  stopPropagation = True,
  preventDefault = True
  }
