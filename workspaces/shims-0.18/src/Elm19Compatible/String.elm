module Elm19Compatible.String exposing
    ( fromFloat
    , fromInt
    , toFloat
    , toInt
    )


fromFloat : Float -> String
fromFloat float =
    toString float


fromInt : Int -> String
fromInt int =
    toString int


toInt : String -> Maybe Int
toInt string =
    Result.toMaybe (String.toInt string)


toFloat : String -> Maybe Float
toFloat string =
    Result.toMaybe (String.toFloat string)
