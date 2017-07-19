module App.Input.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
--import Utility.OnEnter exposing (onEnter)

import State.Types exposing (Msg)


-- INTERFACE

type alias Interface =
    { text_ : String
    , updateInput : String -> Msg
    }


-- VIEW

view : Interface -> Html Msg
view interface =
    let
        { text_ , updateInput } = interface

    in
        div [ class "input" ]
            [ span [ class "caret" ] [ text "❯ " ]
            , input
                [ type_ "text"
                , placeholder "write stuff, hit enter"
                , autofocus True
                , value text_
                , onInput updateInput
                    -- equivalent to: (\str -> App.MsgForInput (Input.UpdateInput str))
                --, onEnter (enterInput model)
                ]
                []
            ]
