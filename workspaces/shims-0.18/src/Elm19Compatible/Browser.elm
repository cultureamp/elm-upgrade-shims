module Elm19Compatible.Browser exposing (element)

import Html exposing (..)


element :
    { init : flags -> ( model, Cmd msg )
    , view : model -> Html msg
    , update : msg -> model -> ( model, Cmd msg )
    , subscriptions : model -> Sub msg
    }
    -> Program flags model msg
element =
    Html.programWithFlags
