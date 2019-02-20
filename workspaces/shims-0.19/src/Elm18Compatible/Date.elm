module Elm18Compatible.Date exposing (Date, fromTime, year)

import Time as Time19


type alias Date =
    Time19.Posix


type alias Time =
    Float


fromTime : Float -> Date
fromTime time =
    Time19.millisToPosix (Basics.round time)


year : Date -> Int
year =
    Time19.toYear Time19.utc


toTime : Date -> Time
toTime =
    Time19.posixToMillis
