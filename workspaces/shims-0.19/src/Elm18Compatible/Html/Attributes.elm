module Elm18Compatible.Html.Attributes exposing (style)

import Html exposing (Attribute)
import VirtualDom


style : List ( String, String ) -> Attribute msg
style styles =
    let
        values =
            String.concat <| List.map (\( k, v ) -> k ++ ": " ++ v ++ ";") styles
    in
    VirtualDom.attribute "style" values
