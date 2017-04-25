module GQL exposing (..)

import GraphQL.Request.Builder exposing (..)
import GraphQL.Client.Http as GraphQLClient exposing (Error)
import GraphQL.Request.Builder.Arg exposing (Value, variable)
import GraphQL.Request.Builder.Variable as Var
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

idVar : Value {a| id : String}
idVar = variable <| Var.required "id" .id Var.id

emailVar : Value {a| email : String}
emailVar = variable <| Var.required "email" .email Var.string
