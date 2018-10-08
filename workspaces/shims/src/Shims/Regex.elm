module Shims.Regex exposing (contains, fromString, never, replace)

import Regex exposing (..)


never : Regex
never =
    Regex.regex "$."


fromString : String -> Maybe Regex
fromString a =
    Just (Regex.regex a)


contains : Regex -> String -> Bool
contains a =
    Regex.contains a


replace : Regex -> (Match -> String) -> String -> String
replace pattern replacer string =
    Regex.replace Regex.All pattern replacer string
