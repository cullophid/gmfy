module Bulma.Grid exposing (..)

import Bulma.Util exposing (BasicComponent, basicDiv)
import Html exposing (a, Attribute, Html)

columns : String -> List (Html msg) -> Html msg
columns = basicDiv "columns"

column : BasicComponent msg
column = basicDiv "column"
