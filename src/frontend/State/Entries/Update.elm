module State.Entries.Update exposing (..)

import State.Types as S
import State.Entries.Types exposing (..)
import State.Control.Types exposing (Filter(..))
import State.Entries.Rest as Rest


-- INIT

initialModel : Model
initialModel =
    { list = []
    , filter = All
    , currentId = 0
    }


initialCmd : Cmd S.Msg 
initialCmd =
     Rest.fetchAll


-- UPDATE

update : Msg -> Model -> ( Model, Cmd S.Msg )
update msg model =
    case msg of
        MsgForModel modelMsg ->
            ( updateModel modelMsg model, Cmd.none )

        MsgForCmd cmdMsg ->
            ( model, updateCmd cmdMsg model )


updateModel : ModelMsg -> Model -> Model
updateModel msg model =
    case msg of
        FetchAllResponse (Ok list) ->
            { model | list = list }

        FetchAllResponse (Err _) ->
            model

        AddEntryResponse (Ok entry) ->
            { model
                | list = List.append model.list [ entry ]
            }

        AddEntryResponse (Err _) ->
            model


updateCmd : CmdMsg -> Model -> Cmd S.Msg
updateCmd msg model =
    case msg of
        FetchAllRequest ->
            Rest.fetchAll

        AddEntryRequest text ->
            Rest.addEntry text
