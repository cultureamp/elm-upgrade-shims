module Main exposing (main)

import Html exposing (div, text)
import Shims.String


main =
    let
        someStringFromInt =
            Shims.String.fromInt 2

        someStringFromFloat =
            Shims.String.fromFloat 3.0
    in
    div []
        [ text someStringFromInt
        , text someStringFromFloat
        ]
