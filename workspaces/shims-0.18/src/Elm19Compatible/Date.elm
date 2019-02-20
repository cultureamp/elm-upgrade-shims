module Elm19Compatible.Date exposing (toIsoString)

import Date as Date18
import Date.Extra as DateExtra18


toIsoString : Date18.Date -> String
toIsoString =
    DateExtra18.toIsoString
