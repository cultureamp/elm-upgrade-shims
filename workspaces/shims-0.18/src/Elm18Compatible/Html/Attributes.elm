module Elm18Compatible.Html.Attributes exposing (style)

import Html exposing (Attribute)
import Html.Attributes exposing (style)


style: List ( String, String ) -> Attribute msg
style =
    style
