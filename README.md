# Culture Amp's Elm 0.18-to-0.19 API shims 

This is a workspace for developing shims for dropping into an Elm 0.18 codebase to mimic the 0.19 APIs and prepare for a speedy upgrade. This project was inspired by the upgrade process being undertaken at [NoRedInk](https://github.com/NoRedInk), as described in this episode of [Elm Town](https://elmtown.audio/upgrading-to-elm-019-luke-westby-richard-feldman)!

## Development and testing

`yarn test` builds the example Elm app at `/test/Main.elm` using both the 0.18 and 0.19 compilers, with the API shims included in the 0.18 build only.

This project uses [asdf-vm](https://github.com/asdf-vm/asdf) to juggle Elm versions. The test scripts require asdf to be installed, along with the [asdf-elm](https://github.com/vic/asdf-elm) plugin and Elm versions `0.18.0` and `0.19.0`.

Happy upgrading!

🌈

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
