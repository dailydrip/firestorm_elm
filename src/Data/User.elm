module Data.User
    exposing
        ( Id
        , User
        , Username
        , decoder
        , idDecoder
        , usernameParser
        , usernameToString
        )

import Date exposing (Date)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra
import Json.Decode.Pipeline as Pipeline exposing (custom, decode, hardcoded, required)
import UrlParser


type Username
    = Username String


type Id
    = Id Int


type alias User =
    { id : Id
    , username : Username
    , email : String
    , name : String
    , insertedAt : Date
    , updatedAt : Date
    }


usernameParser : UrlParser.Parser (Username -> a) a
usernameParser =
    UrlParser.custom "USERNAME" (Ok << Username)


usernameToString : Username -> String
usernameToString (Username username) =
    username


idDecoder : Decoder Id
idDecoder =
    Decode.map Id Decode.int


decoder : Decoder User
decoder =
    decode User
        |> required "id" (Decode.map Id Decode.int)
        |> required "username" (Decode.map Username Decode.string)
        |> required "email" Decode.string
        |> required "name" Decode.string
        |> required "inserted_at" Json.Decode.Extra.date
        |> required "updated_at" Json.Decode.Extra.date