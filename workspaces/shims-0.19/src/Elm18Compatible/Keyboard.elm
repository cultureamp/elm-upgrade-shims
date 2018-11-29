module Elm18Compatible.Keyboard exposing
    ( KeyCode
    , downs
    )

import Browser.Events as Events
import Json.Decode as Decode


type alias KeyCode =
    Int


downs : (KeyCode -> msg) -> Sub msg
downs toMsg =
    Events.onKeyDown <|
        Decode.map toMsg <|
            Decode.field "key" Decode.int
