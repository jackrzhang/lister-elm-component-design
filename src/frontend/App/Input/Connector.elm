module App.Input.Connector exposing (..)

import Html exposing (Html)

import State.Types exposing (..)
import State.Input.Types as Input
import App.Input.View exposing (..)


connector : Model -> Html Msg
connector model =
    view (connect model)


connect : Model -> Interface
connect model =
    { text_ = text_ model
    , updateInput = updateInput
    --, enterInput = (enterInput model)
    }


-- MODEL -> INTERFACE

text_ : Model -> String
text_ model =
    model.input.text


-- MSG -> INTERFACE

updateInput : String -> Msg
updateInput str =
    Input.UpdateInput str
        |> MsgForInput


--enterInput : String -> Msg
--enterInput text =
--    if text == "" then
--        App.NoOp
--    else
--        App.ChainMsgs
--            [ (addEntry text)
--            , (MsgForInput Input.ClearInput)
--            ]


--addEntry : String -> Msg
--addEntry text =
--    Entries.AddEntryRequest text
--        |> Entries.MsgForCmd
--        |> App.MsgForEntries
