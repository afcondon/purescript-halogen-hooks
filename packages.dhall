let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.13.5-20200103/packages.dhall sha256:0a6051982fb4eedb72fbe5ca4282259719b7b9b525a4dda60367f98079132f30

let overrides = {=}

let additions =
  { halogen-storybook =
      { dependencies =
          [ "halogen"
          , "routing"
          , "foreign-object"
          ]
      , repo =
          "https://github.com/rnons/purescript-halogen-storybook.git"
      , version =
          "v1.0.0-rc.1"
      }
  , typelevel-eval =
      { dependencies =
          [ "prelude"
          , "typelevel-prelude"
          , "tuples"
          , "unsafe-coerce"
          , "leibniz"
          ]
      , repo =
          "https://github.com/natefaubion/purescript-typelevel-eval.git"
      , version =
          "v0.4.0"
      }
  }

in  upstream // overrides // additions
