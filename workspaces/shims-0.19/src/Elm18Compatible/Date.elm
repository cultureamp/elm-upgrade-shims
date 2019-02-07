module Elm18Compatible.Date exposing (Date, fromTime)

import Time as Time19

type alias Date = Time19.Posix
type alias Time = Float

fromTime : Float -> Date
fromTime time = Time19.millisToPosix (Basics.round time)
