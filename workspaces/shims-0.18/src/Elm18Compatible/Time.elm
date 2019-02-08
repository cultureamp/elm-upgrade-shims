module Elm18Compatible.Time exposing (Time, millisecond, second)

import Time as Time18

type alias Time = Time18.Time

millisecond =
    Time18.millisecond

second =
    Time18.second
