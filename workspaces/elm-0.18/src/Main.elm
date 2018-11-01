module Main exposing (main)

import Elm18Compatible.AnimationFrame exposing (times)
import Elm18Compatible.Html.Events exposing (defaultOptions, onWithOptions)
import Elm18Compatible.Time exposing (second)
import Elm19Compatible.Html.Attributes exposing (style)
import Elm19Compatible.String
import Elm19Compatible.Tuple
import Html exposing (div, text)
import Json.Decode as Json


main =
    let
        timeInSeconds =
            2.5 * second

        someStringFromInt =
            Elm19Compatible.String.fromInt 3

        someStringFromFloat =
            Elm19Compatible.String.fromFloat timeInSeconds

        someTuple =
            Elm19Compatible.Tuple.pair "some" "value"

        onClick =
            onWithOptions
                "click"
                { defaultOptions | preventDefault = True }
                (Json.succeed 0)
    in
    div
        [ style "width" "90px"
        , style "height" "120px"
        , style "background" "skyblue"
        , onClick
        ]
        [ text someStringFromInt
        , text someStringFromFloat
        , text (Tuple.first someTuple)
        ]
