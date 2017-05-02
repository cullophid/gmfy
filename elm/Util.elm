module Util exposing (..)
import Dict exposing (Dict)

import Focus exposing (Focus)
import Json.Decode as Decode exposing (Decoder, string)
import Date exposing (Date)


find : (a -> Bool) -> List a -> Maybe a
find f xs =
  case xs of
    [] -> Nothing
    x :: xs -> if f x then Just x else find f xs



indexWith : (a -> comparable) -> List a -> Dict comparable a
indexWith f list =
  Dict.fromList <| List.map (\x -> (f x, x)) list



dateDecoder : Decoder Date
dateDecoder =
  let
    decode datestring =
      case Date.fromString datestring of
        Err e -> Decode.fail e
        Ok date -> Decode.succeed date
  in
    Decode.andThen decode string

foldResult : (err -> b) -> (a -> b) -> Result err a -> b
foldResult error success result =
  case result of
    Err err -> error err
    Ok a -> success a

format: String -> List String -> String
format template values =
  let
      parts = String.split "%%" template
  in
    String.join "" <| List.map2 (++) parts values
