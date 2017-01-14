module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import State.Types exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ title
        , infoFooter
        ]


title : Html Msg
title =
    header []
        [ h1 []
            [ a [ href "https://github.com/jackrzhang/lister-elm" ] 
                [ text "lister"] 
            ]
        ]


infoFooter : Html Msg
infoFooter =
    footer []
        [ p []
            [ text "Written by "
            , a [ href "https://github.com/jackrzhang" ] [ text "Jack Zhang" ]
            ]
        , p []
            [ text "Built with "
            , a [ href "http://elm-lang.org" ] [ text "Elm" ]
            ]
        ]