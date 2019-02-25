module Elm18Compatible.Date.Extra exposing (Interval(..), compare, diff, floor, toFormattedString, toIsoString)

import Elm18Compatible.Date
import Iso8601
import Date


type Interval
    = Year
    | Quarter
    | Month
    | Week
    | Monday
    | Tuesday
    | Wednesday
    | Thursday
    | Friday
    | Saturday
    | Sunday
    | Day
    | Hour
    | Minute
    | Second
    | Millisecond


toIsoString : Elm18Compatible.Date.Date -> String
toIsoString =
    Iso8601.fromTime


toFormattedString _ =
    "TODO dhotson"


floor =
    Debug.todo "todo"


diff : Interval -> Elm18Compatible.Date.Date -> Elm18Compatible.Date.Date -> Date
diff interval =
    Date.diff (toUnit interval) a b


compare =
    Debug.todo "todo"


toUnit : Interval -> Unit
toUnit interval =
    case interval of
        Year ->
            Years

        Month ->
            Months

        Week ->
            Weeks

        Day ->
            Days

        _ ->
            Debug.todo "unsupported Interval"
