module View.ErrorModal exposing (errorModal)

import App.Data exposing (Msg(..))
import Html exposing (Html, text)
import GraphQL.Client.Http as GQL exposing (Error(..))
import Http exposing (Error(..))
import Bulma exposing (div)
import Bulma.Elements exposing (notification)
import Bulma.Components exposing (modal)
import GraphQL.Client.Http exposing (Error(..))

httpErrorMessage : Http.Error -> String
httpErrorMessage err =
  case err of
    BadUrl err -> "Bad Url " ++ err
    Timeout -> "Request timed out"
    NetworkError -> "NetworkError"
    BadStatus {status} -> "Bad Status \n" ++ status.message
    BadPayload e {body} -> "Bad Payload " ++ e ++ ": " ++ body

errorMessage : GQL.Error -> String
errorMessage err =
  case err of
    HttpError e -> httpErrorMessage e
    GraphQLError errs -> "GQLError: " ++ (String.join "\n" <| List.map .message errs)


errorModal : Maybe GQL.Error -> Html Msg
errorModal err =
  case err of
    Nothing -> div "" []
    Just err ->
      modal "" [
        notification "is-danger" ClearError [
          text <| errorMessage err
        ]
      ]
