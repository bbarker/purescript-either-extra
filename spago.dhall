{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "either-extra"
, license = "MPL-2.0"
, repository = "https://github.com/bbarker/purescript-either-extra.git"
, dependencies = [ "either" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
