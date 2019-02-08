module Elm18Compatible.Date.Extra exposing (Interval(..), toIsoString)

import Date as Date18
import Date.Extra as Extra18

type alias Interval = Extra18.Interval

toIsoString : Elm18Compatible.Date -> String
toIsoString =
    Extra18.toIsoString


toFormattedString _ = "TODO dhotson"

floor = Debug.crash "todo"
diff = Debug.crash "todo"
compare = Debug.crash "todo"
