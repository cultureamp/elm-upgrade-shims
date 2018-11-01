module Elm18Compatible.Html.Events exposing
    ( Options
    , defaultOptions
    , onWithOptions
    )

import Html exposing (Attribute)
import Html.Events as Events19 exposing (custom)
import Json.Decode as Decode exposing (Decoder, map)


type alias Options =
    { stopPropagation : Bool
    , preventDefault : Bool
    }


defaultOptions =
    { stopPropagation = False
    , preventDefault = False
    }


onWithOptions : String -> Options -> Decoder msg -> Attribute msg
onWithOptions eventName options msgDecoder =
    let
        decoder :
            Decoder
                { message : msg
                , stopPropagation : Bool
                , preventDefault : Bool
                }
        decoder =
            map
                (\msg ->
                    { message = msg
                    , stopPropagation = options.stopPropagation
                    , preventDefault = options.preventDefault
                    }
                )
                msgDecoder
    in
    custom eventName decoder
