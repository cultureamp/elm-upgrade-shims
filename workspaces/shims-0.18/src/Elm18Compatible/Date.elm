module Elm18Compatible.Date exposing (Date, fromTime)

import Date as Date18

type alias Date = Date18.Date
type alias Time = Date18.Time

fromTime = Date18.fromTime
