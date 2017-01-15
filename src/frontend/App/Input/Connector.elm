module App.Input.Connector exposing (..)

import Html exposing (Html)

import State.Types exposing (..)
import State.Input.Types as Input
import App.Input.View exposing (view)
import App.Input.Types exposing (..)


-- CONTAINER

connector : Model -> Html Msg
connector model =
    view (connect model)


connect : Model -> Interface
connect model =
    let
        text =
            model.input.text

    in 
        { text_ = text
        , updateInput = updateInput
        --, enterInput = (enterInput model)
        }


-- MSG INTERFACES

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
