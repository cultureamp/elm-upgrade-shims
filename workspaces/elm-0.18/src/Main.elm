module Main exposing (main)

import Html exposing (div, text)
import Elm19Compatible.String
import Elm19Compatible.Html.Attributes exposing (style)
import Elm19Compatible.Tuple


main =
    let
        someStringFromInt =
            Elm19Compatible.String.fromInt 2

        someStringFromFloat =
            Elm19Compatible.String.fromFloat 3.0

        someTuple =
            Elm19Compatible.Tuple.pair "some" "value"
    in
        div
            [ style "width" "90px"
            , style "height" "120px"
            , style "background" "skyblue"
            ]
            [ text someStringFromInt
            , text someStringFromFloat
            , text (Tuple.first someTuple)
            ]
