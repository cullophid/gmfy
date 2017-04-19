module GraphApi exposing (..)

import GraphQL.Request.Builder exposing (..)
import GraphQL.Request.Builder.Arg as Arg
import GraphQL.Request.Builder.Variable as Var
import Game exposing (Game)
import Http

sendQueryRequest : Request Query a -> Task GraphQLClient.Error a
sendQueryRequest request =
    GraphQLClient.sendQuery "/" request


gameQuery : Document Query Game { vars }
gameQuery =
    let
        gameId =
            Var.required "gameId" .gameId Var.id
        game =
            object Game
                |> with (field "title" [] string)
                |> with (field "description" [] string)

        queryRoot =
            extract
                (field "games"
                    [ ("id", Arg.variable gameId ) ]
                    game
                )
    in
        queryDocument queryRoot

gameRequest : Request Query (List Game)
