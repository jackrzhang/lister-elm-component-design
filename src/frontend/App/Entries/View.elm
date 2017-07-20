module App.Entries.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
--import Html.Events exposing (onClick)

import State.Types exposing (..)
import State.Entries.Types exposing (Entry)


-- INTERFACE

type alias Interface =
    { filteredList : List Entry
    }


-- VIEW

view : Interface -> Html Msg
view interface =
    let
        { filteredList } = interface

    in
        div []
            [ div [] (List.map viewEntry filteredList)
            ]


viewEntry : Entry -> Html Msg
viewEntry entry =
    let textStyle =
        if entry.complete then
            " complete"
        else
            " active"
    in
        div [ class "entry" ]
            [ span
                [ class "checkmark" 
                --, onClick (toggleComplete entry)
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
                    --, onClick (removeEntry entry.id)
                    ] 
                    [ text " ×" 
                    ]
                ]
            ]
