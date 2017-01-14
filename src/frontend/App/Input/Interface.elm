module App.Input.Interface exposing (..)

import State.Types exposing (Msg)


type alias Interface =
    { text_ : String
    , updateInput : String -> Msg
    }