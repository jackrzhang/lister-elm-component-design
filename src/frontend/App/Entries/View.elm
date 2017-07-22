module App.Entries.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import State.Types exposing (..)
import State.Entries.Types exposing (Entry)


-- INTERFACE

type alias Interface =
    { filteredList : List Entry
    , removeEntry : Int -> Msg
    , toggleComplete : Entry -> Msg
    }


-- VIEW

view : Interface -> Html Msg
view interface =
    let
        { filteredList } = interface

    in
        div []
            [ div [] (List.map (viewEntry interface) filteredList)
            ]


viewEntry : Interface -> Entry -> Html Msg
viewEntry interface entry =
    let
        textStyle =
            if entry.complete then
                " complete"
            else
                " active"

        clickX =
            interface.removeEntry entry.id

        clickCheck =
            interface.toggleComplete entry

    in
        div [ class "entry" ]
            [ span
                [ class "checkmark" 
                , onClick clickCheck
                ]
                [ text "☑ "
                ]
            , span 
                [ class ("text" ++ textStyle)]
                [ text entry.text
                ]
            , div [ class "container" ]
                [ span 
                    [ class "x" 
                    , onClick clickX
                    ] 
                    [ text " ×" 
                    ]
                ]
            ]
