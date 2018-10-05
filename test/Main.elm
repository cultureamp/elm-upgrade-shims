module Main exposing (main)

import Html exposing (div, text)
import Shims.String
import Shims.Html.Attributes exposing (style)


main =
    let
        someStringFromInt =
            Shims.String.fromInt 2

        someStringFromFloat =
            Shims.String.fromFloat 3.0
    in
        div
            [ style "width" "90px"
            , style "height" "120px"
            , style "background" "skyblue"
            ]
            [ text someStringFromInt
            , text someStringFromFloat
            ]
