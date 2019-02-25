module Elm18Compatible.Date.Extra exposing (Interval(..), toIsoString, diff, floor, compare, toFormattedString)

import Date as Date18
import Date.Extra as Extra18


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


toIsoString : Date18.Date -> String
toIsoString =
    Extra18.toIsoString


toFormattedString =
    Extra18.toFormattedString


floor : Interval -> Date18.Date -> Date18.Date
floor interval date =
    Extra18.floor (convertInterval interval) date


diff : Interval -> Date18.Date -> Date18.Date -> Int
diff interval dateA dateB =
    Extra18.diff (convertInterval interval) dateA dateB


compare =
    Extra18.compare


convertInterval : Interval -> Extra18.Interval
convertInterval interval =
    case interval of
        Year ->
            Extra18.Year

        Quarter ->
            Extra18.Quarter

        Month ->
            Extra18.Month

        Week ->
            Extra18.Week

        Monday ->
            Extra18.Monday

        Tuesday ->
            Extra18.Tuesday

        Wednesday ->
            Extra18.Wednesday

        Thursday ->
            Extra18.Thursday

        Friday ->
            Extra18.Friday

        Saturday ->
            Extra18.Saturday

        Sunday ->
            Extra18.Sunday

        Day ->
            Extra18.Day

        Hour ->
            Extra18.Hour

        Minute ->
            Extra18.Minute

        Second ->
            Extra18.Second

        Millisecond ->
            Extra18.Millisecond
