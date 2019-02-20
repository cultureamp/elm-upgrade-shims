module Elm19Compatible.Date exposing (toIsoString)

import Date as Date19


toIsoString : Date19.Date -> String
toIsoString =
    Date19.toIsoString
