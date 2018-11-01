module Tests exposing (tests)

import Expect
import Elm19Compatible.Basics
import Elm19Compatible.Regex
import Elm19Compatible.String
import Elm19Compatible.Tuple
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
                \() -> Expect.equal output (List.map (Elm19Compatible.Basics.modBy 4) input)
            , test "remainderBy" <|
                let
                    input =
                        [ -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5 ]

                    output =
                        [ -1, 0, -3, -2, -1, 0, 1, 2, 3, 0, 1 ]
                in
                \() -> Expect.equal output (List.map (Elm19Compatible.Basics.remainderBy 4) input)
            ]

        --
        , describe "String"
            [ test "fromInt" <|
                \() ->
                    Expect.equal "42" (Elm19Compatible.String.fromInt 42)
            , test "fromFloat" <|
                \() ->
                    Expect.equal "3.141" (Elm19Compatible.String.fromFloat 3.141)
            , test "toInt (valid)" <|
                \() ->
                    Expect.equal (Just 42) (Elm19Compatible.String.toInt "42")
            , test "toFloat (valid)" <|
                \() ->
                    Expect.equal (Just 3.141) (Elm19Compatible.String.toFloat "3.141")
            , test "toInt (invalid)" <|
                \() ->
                    Expect.equal Nothing (Elm19Compatible.String.toInt "...")
            , test "toFloat (invalid)" <|
                \() ->
                    Expect.equal Nothing (Elm19Compatible.String.toInt "...")
            ]

        --
        , describe "Tuple"
            [ test "pair" <|
                \() ->
                    Expect.equal ( 1, 2 ) (Elm19Compatible.Tuple.pair 1 2)
            ]

        --
        , describe "Regex"
            [ describe "contains"
                [ test "digit example" <|
                    let
                        digit =
                            Maybe.withDefault Elm19Compatible.Regex.never <|
                                Elm19Compatible.Regex.fromString "[0-9]"
                    in
                    \() -> Expect.equal (Elm19Compatible.Regex.contains digit "abc123") True
                ]
            , describe "replace" <|
                let
                    userReplace userRegex replacer string =
                        case Elm19Compatible.Regex.fromString userRegex of
                            Nothing ->
                                string

                            Just regex ->
                                Elm19Compatible.Regex.replace regex replacer string
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
        ]
