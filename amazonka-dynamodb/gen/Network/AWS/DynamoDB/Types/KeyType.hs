{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.DynamoDB.Types.KeyType
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.DynamoDB.Types.KeyType
  ( KeyType
      ( ..,
        KeyTypeHASH,
        KeyTypeRANGE
      ),
  )
where

import qualified Network.AWS.Prelude as Prelude

newtype KeyType = KeyType'
  { fromKeyType ::
      Prelude.Text
  }
  deriving
    ( Prelude.Eq,
      Prelude.Ord,
      Prelude.Read,
      Prelude.Show,
      Prelude.Data,
      Prelude.Typeable,
      Prelude.Generic
    )

pattern KeyTypeHASH :: KeyType
pattern KeyTypeHASH = KeyType' "HASH"

pattern KeyTypeRANGE :: KeyType
pattern KeyTypeRANGE = KeyType' "RANGE"

{-# COMPLETE
  KeyTypeHASH,
  KeyTypeRANGE,
  KeyType'
  #-}

instance Prelude.FromText KeyType where
  parser = KeyType' Prelude.<$> Prelude.takeText

instance Prelude.ToText KeyType where
  toText (KeyType' x) = x

instance Prelude.Hashable KeyType

instance Prelude.NFData KeyType

instance Prelude.ToByteString KeyType

instance Prelude.ToQuery KeyType

instance Prelude.ToHeader KeyType

instance Prelude.ToJSON KeyType where
  toJSON = Prelude.toJSONText

instance Prelude.FromJSON KeyType where
  parseJSON = Prelude.parseJSONText "KeyType"
