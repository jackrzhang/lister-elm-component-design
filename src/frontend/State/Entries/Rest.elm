module State.Entries.Rest exposing (..)

import Http exposing (Error)
import Json.Decode as Decode
--import Json.Encode as Encode

import State.Types as S
import State.Entries.Types as Entries exposing (Entry)


-- COMMANDS

fetchAll : Cmd S.Msg
fetchAll =
    Http.send fetchAllResponse getEntries


-- MSG CONTAINERS

fetchAllResponse : Result Error (List Entry) -> S.Msg
fetchAllResponse result =
    Entries.FetchAllResponse result
        |> Entries.MsgForModel
        |> S.MsgForEntries


-- REQUESTS

getEntries : Http.Request (List Entry)
getEntries =
    Http.get entriesUrl entriesDecoder


-- RESOURCES

entriesUrl : String
entriesUrl =
    "/api/entries"


entryUrl : Int -> String
entryUrl id =
    String.join "/" [ entriesUrl, toString id ]


-- DECODERS

entriesDecoder : Decode.Decoder (List Entry)
entriesDecoder =
    Decode.list entryDecoder


entryDecoder : Decode.Decoder Entry
entryDecoder =
    Decode.map3 Entry
        (Decode.field "id" Decode.int)
        (Decode.field "text" Decode.string)
        (Decode.field "complete" Decode.bool)


-- ENCODERS
