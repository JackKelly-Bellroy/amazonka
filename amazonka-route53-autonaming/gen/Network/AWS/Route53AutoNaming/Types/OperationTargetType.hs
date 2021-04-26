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
-- Module      : Network.AWS.Route53AutoNaming.Types.OperationTargetType
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.Route53AutoNaming.Types.OperationTargetType
  ( OperationTargetType
      ( ..,
        OperationTargetTypeOTTINSTANCE,
        OperationTargetTypeOTTNAMESPACE,
        OperationTargetTypeOTTSERVICE
      ),
  )
where

import qualified Network.AWS.Prelude as Prelude

newtype OperationTargetType = OperationTargetType'
  { fromOperationTargetType ::
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

pattern OperationTargetTypeOTTINSTANCE :: OperationTargetType
pattern OperationTargetTypeOTTINSTANCE = OperationTargetType' "INSTANCE"

pattern OperationTargetTypeOTTNAMESPACE :: OperationTargetType
pattern OperationTargetTypeOTTNAMESPACE = OperationTargetType' "NAMESPACE"

pattern OperationTargetTypeOTTSERVICE :: OperationTargetType
pattern OperationTargetTypeOTTSERVICE = OperationTargetType' "SERVICE"

{-# COMPLETE
  OperationTargetTypeOTTINSTANCE,
  OperationTargetTypeOTTNAMESPACE,
  OperationTargetTypeOTTSERVICE,
  OperationTargetType'
  #-}

instance Prelude.FromText OperationTargetType where
  parser = OperationTargetType' Prelude.<$> Prelude.takeText

instance Prelude.ToText OperationTargetType where
  toText (OperationTargetType' x) = x

instance Prelude.Hashable OperationTargetType

instance Prelude.NFData OperationTargetType

instance Prelude.ToByteString OperationTargetType

instance Prelude.ToQuery OperationTargetType

instance Prelude.ToHeader OperationTargetType

instance Prelude.FromJSON OperationTargetType where
  parseJSON = Prelude.parseJSONText "OperationTargetType"
