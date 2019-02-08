module Elm18Compatible.Date.Extra exposing (Interval, toIsoString)

import Date as Date18
import Date.Extra as Extra18


type alias Interval =
    Extra18.Interval


toIsoString : Date18.Date -> String
toIsoString =
    Extra18.toIsoString


toFormattedString =
    Extra18.toFormattedString


floor =
    Extra18.floor


diff =
    Extra18.diff


compare =
    Extra18.compare
