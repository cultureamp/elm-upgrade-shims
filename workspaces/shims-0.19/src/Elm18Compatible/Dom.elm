module Elm18Compatible.Dom exposing
    ( Error
    , Id
    , focus
    )

import Browser.Dom as Dom18


type alias Id =
    Dom18.Id


type alias Error =
    Dom18.Error


focus =
    Dom18.focus
