module Elm18Compatible.Mouse exposing (clicks)

import Browser.Events as Events
import Json.Decode as Decode


type alias Position =
    { x : Int
    , y : Int
    }


position : Decode.Decoder Position
position =
    Decode.map2 Position
        (Decode.field "pageX" Decode.int)
        (Decode.field "pageY" Decode.int)


clicks : (Position -> msg) -> Sub msg
clicks positionMsg =
    Events.onClick <| Decode.map positionMsg position
