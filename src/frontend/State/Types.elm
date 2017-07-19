module State.Types exposing (..)

import Navigation exposing (Location)

import State.Input.Types as Input
import State.Control.Types as Control


-- MODEL

type alias Model =
    { input : Input.Model
    , control : Control.Model
    }

type alias Path = String


-- MSG

type Msg
    = NoOp
    | Initialize Location
    | SyncPath
    | ChainMsgs (List Msg)
    | MsgForInput Input.Msg
    | MsgForControl Control.Msg
