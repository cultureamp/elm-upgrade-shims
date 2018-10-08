module Shims.Basics exposing (modBy, remainderBy)

import Basics


modBy : Int -> Int -> Int
modBy a b =
    b % a


remainderBy : Int -> Int -> Int
remainderBy a b =
    Basics.rem b a
