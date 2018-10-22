module Shims.Browser.Events exposing (onKeyPress)

import Json.Decode as Decode
import Json.Encode as Encode
import Keyboard



-- WARNING: be really careful with this. Your decoder will receive an object with {key: ""}
-- If it fails to decode this, your app will crash. (RUNTIME EXCEPTIONS!)
-- Please use this only for a short time to make your code Elm 0.19 ready


onKeyPress : Decode.Decoder msg -> Sub msg
onKeyPress keyDecoder =
    let
        tagger : Keyboard.KeyCode -> msg
        tagger keyCode =
            let
                keyCodeValue : Encode.Value
                keyCodeValue =
                    Encode.string (toString keyCode)

                keyboardEvent : Encode.Value
                keyboardEvent =
                    Encode.object [ ( "key", keyCodeValue ) ]

                result : Result String msg
                result =
                    Decode.decodeValue keyDecoder keyboardEvent
            in
            case result of
                Ok msg ->
                    msg

                Result.Err errorMsg ->
                    Debug.crash errorMsg
    in
    Keyboard.presses tagger
