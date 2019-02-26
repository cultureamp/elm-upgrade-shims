module Elm19Compatible.Url exposing (percentEncode)

import Http as Http18


percentEncode =
    Http18.encodeUri
