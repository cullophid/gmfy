module Util.Events where

import Html.Events exposing (..)
import Html exposing (Attribute)
import Actions exposing (actions)

onInput address contentToValue =
    on "input" targetValue (\str -> Signal.message address (contentToValue str))



onSubmit' : Signal.Address a -> a -> Attribute
onSubmit' addr msg =
  onWithOptions
    "submit"
    onSubmitOptions
    targetValue
    (\_ -> Signal.message addr msg)


onSubmitOptions = {
  stopPropagation = True,
  preventDefault = True
  }

linkTo : String -> Attribute
linkTo path =
  onClick actions.address (Actions.GoTo path)
