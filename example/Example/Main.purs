module Example.Main where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Effect (Effect)
import Effect.Aff (Aff)
import Example.Basic.Button as Basic
import Example.Effects.Random as Random
import Foreign.Object as Object
import Halogen.Aff as HA
import Halogen.HTML as HH
import Halogen.Storybook (Stories, runStorybook)

main :: Effect Unit
main = HA.runHalogenAff do
  HA.awaitBody >>= runStorybook 
    { stories: examples
    , logo: Just $ HH.text "Halogen Hooks Examples" 
    }

examples :: Stories Aff
examples = 
  Object.fromFoldable
    [ -- "" /\ index
      "Halogen|Basic" /\ Basic.component
    , "Halogen|Effect: Random" /\ Random.component
    ]
  
  -- TODO: Support pure components which are just HTML
  -- where
  -- index :: forall q i. H.Component HH.HTML q i Void Aff
  -- index = Hook.component $ ?a do
  --   HH.div_
  --     [ HH.h1_
  --       [ HH.text "Halogen Hooks" ]
  --     , HH.p_
  --       [ HH.text "See the Halogen Hooks "
  --       , HH.a
  --         [ HP.href "https://github.com/thomashoneyman/purescript-halogen-hooks" ]
  --         [ HH.text "README" ]
  --       , HH.text " for details."
  --       ]
  --     ]