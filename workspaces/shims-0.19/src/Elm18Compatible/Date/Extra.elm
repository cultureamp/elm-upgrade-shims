module Elm18Compatible.Date.Extra exposing (Interval(..), compare, diff, floor, toFormattedString, toIsoString)

import Elm18Compatible.Date
import Iso8601


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


diff =
    Debug.todo "todo"


compare =
    Debug.todo "todo"
