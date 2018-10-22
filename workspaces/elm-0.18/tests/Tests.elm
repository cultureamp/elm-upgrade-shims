module Tests exposing (tests)

import Expect
import Json.Decode as Decode
import Shims.Basics
import Shims.Browser.Events
import Shims.Regex
import Shims.String
import Shims.Tuple
import Test exposing (Test, describe, test)


tests : Test
tests =
    describe "Shims"
        [ describe "Basics" <|
            [ test "modBy" <|
                let
                    input =
                        [ -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5 ]

                    output =
                        [ 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1 ]
                in
                \() -> Expect.equal output (List.map (Shims.Basics.modBy 4) input)
            , test "remainderBy" <|
                let
                    input =
                        [ -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5 ]

                    output =
                        [ -1, 0, -3, -2, -1, 0, 1, 2, 3, 0, 1 ]
                in
                \() -> Expect.equal output (List.map (Shims.Basics.remainderBy 4) input)
            ]

        --
        , describe "String"
            [ test "fromInt" <|
                \() ->
                    Expect.equal "42" (Shims.String.fromInt 42)
            , test "fromFloat" <|
                \() ->
                    Expect.equal "3.141" (Shims.String.fromFloat 3.141)
            , test "toInt (valid)" <|
                \() ->
                    Expect.equal (Just 42) (Shims.String.toInt "42")
            , test "toFloat (valid)" <|
                \() ->
                    Expect.equal (Just 3.141) (Shims.String.toFloat "3.141")
            , test "toInt (invalid)" <|
                \() ->
                    Expect.equal Nothing (Shims.String.toInt "...")
            , test "toFloat (invalid)" <|
                \() ->
                    Expect.equal Nothing (Shims.String.toInt "...")
            ]

        --
        , describe "Tuple"
            [ test "pair" <|
                \() ->
                    Expect.equal ( 1, 2 ) (Shims.Tuple.pair 1 2)
            ]

        --
        , describe "Regex"
            [ describe "contains"
                [ test "digit example" <|
                    let
                        digit =
                            Maybe.withDefault Shims.Regex.never <|
                                Shims.Regex.fromString "[0-9]"
                    in
                    \() -> Expect.equal (Shims.Regex.contains digit "abc123") True
                ]
            , describe "replace" <|
                let
                    userReplace userRegex replacer string =
                        case Shims.Regex.fromString userRegex of
                            Nothing ->
                                string

                            Just regex ->
                                Shims.Regex.replace regex replacer string
                in
                [ test "devowel example" <|
                    \() ->
                        let
                            devowel string =
                                userReplace "[aeiou]" (\_ -> "") string
                        in
                        Expect.equal (devowel "The quick brown fox")
                            "Th qck brwn fx"
                , test "reverseWords example" <|
                    \() ->
                        let
                            reverseWords string =
                                userReplace "\\w+" (.match >> String.reverse) string
                        in
                        Expect.equal
                            (reverseWords "deliver mined parts")
                            "reviled denim strap"
                ]
            ]

        --
        , describe "Keyboard Events"
            [ describe "onKeyPress"
                [ test "A decoder should compile okay" <|
                    \() ->
                        let
                            toKey : String -> Key
                            toKey string =
                                case String.uncons string of
                                    Just ( char, "" ) ->
                                        Character char

                                    _ ->
                                        Control string

                            keyDecoder : Decode.Decoder Key
                            keyDecoder =
                                Decode.map toKey (Decode.field "key" Decode.string)

                            elm19Sub =
                                Shims.Browser.Events.onKeyPress keyDecoder
                        in
                        Expect.equal True True
                ]
            ]
        ]


type Key
    = Character Char
    | Control String
