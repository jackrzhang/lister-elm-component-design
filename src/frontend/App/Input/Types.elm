module App.Input.Types exposing (..)

import State.Types exposing (..)


type alias Interface =
    { text_ : String
    , updateInput : String -> Msg
    }