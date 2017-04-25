module GQL exposing (..)

import GraphQL.Request.Builder exposing (..)
import GraphQL.Client.Http as GraphQLClient exposing (Error)
import Task exposing (Task)

sendQuery : ValueSpec NonNull ObjectType a vars -> vars -> Cmd (Result Error a)
sendQuery req vars =
  req
   |> queryDocument
   |> request vars
   |> GraphQLClient.sendQuery "/api/graphql"
   |> Task.attempt (\x -> x)

sendMutation : ValueSpec NonNull ObjectType a vars -> vars -> Cmd (Result Error a)
sendMutation req vars =
  req
   |> mutationDocument
   |> request vars
   |> GraphQLClient.sendMutation "/api/graphql"
   |> Task.attempt (\x -> x)
