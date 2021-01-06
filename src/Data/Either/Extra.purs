module Data.Either.Extra where

import Control.Applicative (pure)
import Control.Monad (class Monad, bind)
import Control.Plus (class Plus, empty)
import Data.Either (Either(..))
import Data.Function (flip)
import Prelude ((<<<))

identity :: forall a. a -> a
identity x = x

catLefts ::  forall a b m. Monad m => Plus m => m (Either a b) -> m a
catLefts = catMapLefts identity

catMapLefts :: forall a b c m. Monad m => Plus m
  => (a -> c) -> m (Either a b) -> m c
catMapLefts f = (flip bind) (leftOr empty (pure <<< f))

leftOr :: forall a b c. c -> (a -> c) -> Either a b -> c
leftOr _ f (Left a) = f a
leftOr c _ (Right _) = c

catRights :: forall a b m. Monad m => Plus m => m (Either a b) -> m b
catRights = catMapRights identity

catMapRights :: forall a b c m. Monad m => Plus m 
  => (b -> c) -> m (Either a b) -> m c
catMapRights f = (flip bind) (rightOr empty (pure <<< f))

rightOr :: forall a b c. c -> (b -> c) -> Either a b -> c
rightOr c _ (Left _) = c
rightOr _ f (Right b) = f b
