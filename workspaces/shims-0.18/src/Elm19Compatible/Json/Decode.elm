module Elm19Compatible.Json.Decode exposing (succeed)

import Json.Decode as Decode18

succeed : a -> Decode18.Decoder a
succeed = Decode18.succeed
