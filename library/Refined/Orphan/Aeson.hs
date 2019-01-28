--------------------------------------------------------------------------------

-- Copyright © 2015 Nikita Volkov
-- Copyright © 2018 Remy Goldschmidt
-- Copyright © 2018 Daniel Cartwright
--
-- Permission is hereby granted, free of charge, to any person
-- obtaining a copy of this software and associated documentation
-- files (the "Software"), to deal in the Software without
-- restriction, including without limitation the rights to use,
-- copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the
-- Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be
-- included in all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-- EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
-- OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-- NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
-- HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
-- WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-- FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
-- OTHER DEALINGS IN THE SOFTWARE.

--------------------------------------------------------------------------------

{-# LANGUAGE CPP #-}

--------------------------------------------------------------------------------

-- | This module exposes orphan instances for the 'Refined' type.
--   This is unavoidable given the current module structure.
module Refined.Orphan.Aeson () where

--------------------------------------------------------------------------------

#if HAVE_AESON

import           Control.Monad    ((<=<))
import           Data.Aeson       (FromJSON(parseJSON), ToJSON(toJSON))            
import           Refined.Internal (Refined, Predicate, refineFail, unrefine)

--------------------------------------------------------------------------------

instance (FromJSON a, Predicate p a) => FromJSON (Refined p a) where
  parseJSON = refineFail <=< parseJSON

instance (ToJSON a, Predicate p a) => ToJSON (Refined p a) where
  toJSON = toJSON . unrefine

--------------------------------------------------------------------------------

#endif
