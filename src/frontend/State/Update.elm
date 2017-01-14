module State.Update exposing (..)

import Navigation exposing (Location)

import State.Types exposing (..)
import State.Input.Update as Input exposing (..)


-- INIT

init : Location -> ( Model, Cmd Msg )
init location =
    ( (locationToModel location initialModel), initialCmd )


initialModel : Model
initialModel =
    { input = Input.initialModel
    }


initialCmd : Cmd Msg
initialCmd =
    Cmd.batch
        [ 
        ]


-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp -> 
            model ! []

        UrlChange location ->
            (locationToModel location model) ! []

        MsgForInput inputMsg ->
            let input =
                Input.updateModel inputMsg model.input
            in 
                { model | input = input } ! []



-- HELPERS

locationToModel : Location -> Model -> Model
locationToModel location model =
    model
