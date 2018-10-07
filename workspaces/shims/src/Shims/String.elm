module Shims.String exposing
    ( fromFloat
    , fromInt
    )


fromFloat : Float -> String
fromFloat float =
    toString float


fromInt : Int -> String
fromInt int =
    toString int
