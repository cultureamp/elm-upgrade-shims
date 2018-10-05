module Shims.Tuple
    exposing
        ( pair
        )


pair : a -> b -> ( a, b )
pair a b =
    ( a, b )
