module State.Types exposing (..)

import Navigation exposing (Location)

import State.Input.Types as Input


-- MODEL

type alias Model =
    { input : Input.Model
    }


-- MSG

type Msg
    = NoOp
    | UrlChange Location
    | MsgForInput Input.Msg
