module Elm18Compatible.Dom exposing
    ( Error
    , Id
    , focus
    )

import Browser.Dom as Dom19


type alias Id = String


type alias Error =
    Dom19.Error


focus =
    Dom19.focus
