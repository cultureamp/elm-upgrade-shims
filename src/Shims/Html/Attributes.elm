module Shims.Html.Attributes
    exposing
        ( style
        )

import Html.Attributes
import Html


style : String -> String -> Html.Attribute msg
style name value =
    Html.Attributes.style [ ( name, value ) ]
