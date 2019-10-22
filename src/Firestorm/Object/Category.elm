-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Firestorm.Object.Category exposing (id, insertedAt, threads, title, updatedAt)

import Firestorm.InputObject
import Firestorm.Interface
import Firestorm.Object
import Firestorm.Scalar
import Firestorm.Union
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


id : SelectionSet Firestorm.Scalar.Id Firestorm.Object.Category
id =
    Object.selectionForField "id" [] (Object.scalarDecoder |> Decode.map Firestorm.Scalar.Id)


insertedAt : SelectionSet Firestorm.Scalar.DateTime Firestorm.Object.Category
insertedAt =
    Object.selectionForField "insertedAt" [] (Object.scalarDecoder |> Decode.map Firestorm.Scalar.DateTime)


threads : SelectionSet decodesTo Firestorm.Object.Thread -> SelectionSet (List decodesTo) Firestorm.Object.Category
threads object_ =
    Object.selectionForCompositeField "threads" [] object_ (identity >> Decode.list)


title : SelectionSet String Firestorm.Object.Category
title =
    Object.selectionForField "title" [] Decode.string


updatedAt : SelectionSet Firestorm.Scalar.DateTime Firestorm.Object.Category
updatedAt =
    Object.selectionForField "updatedAt" [] (Object.scalarDecoder |> Decode.map Firestorm.Scalar.DateTime)