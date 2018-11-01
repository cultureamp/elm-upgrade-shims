module Elm19Compatible.Regex exposing (contains, fromString, never, replace)

import Regex exposing (..)


never : Regex
never =
    Regex.regex "$."


fromString : String -> Maybe Regex
fromString a =
    Just (Regex.regex a)


contains : Regex -> String -> Bool
contains =
    Regex.contains


replace : Regex -> (Match -> String) -> String -> String
replace =
    Regex.replace Regex.All
