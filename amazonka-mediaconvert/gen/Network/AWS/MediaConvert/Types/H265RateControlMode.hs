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
-- Module      : Network.AWS.MediaConvert.Types.H265RateControlMode
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.MediaConvert.Types.H265RateControlMode
  ( H265RateControlMode
      ( ..,
        H265RateControlModeCBR,
        H265RateControlModeQVBR,
        H265RateControlModeVBR
      ),
  )
where

import qualified Network.AWS.Prelude as Prelude

-- | Use this setting to specify whether this output has a variable bitrate
-- (VBR), constant bitrate (CBR) or quality-defined variable bitrate
-- (QVBR).
newtype H265RateControlMode = H265RateControlMode'
  { fromH265RateControlMode ::
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

pattern H265RateControlModeCBR :: H265RateControlMode
pattern H265RateControlModeCBR = H265RateControlMode' "CBR"

pattern H265RateControlModeQVBR :: H265RateControlMode
pattern H265RateControlModeQVBR = H265RateControlMode' "QVBR"

pattern H265RateControlModeVBR :: H265RateControlMode
pattern H265RateControlModeVBR = H265RateControlMode' "VBR"

{-# COMPLETE
  H265RateControlModeCBR,
  H265RateControlModeQVBR,
  H265RateControlModeVBR,
  H265RateControlMode'
  #-}

instance Prelude.FromText H265RateControlMode where
  parser = H265RateControlMode' Prelude.<$> Prelude.takeText

instance Prelude.ToText H265RateControlMode where
  toText (H265RateControlMode' x) = x

instance Prelude.Hashable H265RateControlMode

instance Prelude.NFData H265RateControlMode

instance Prelude.ToByteString H265RateControlMode

instance Prelude.ToQuery H265RateControlMode

instance Prelude.ToHeader H265RateControlMode

instance Prelude.ToJSON H265RateControlMode where
  toJSON = Prelude.toJSONText

instance Prelude.FromJSON H265RateControlMode where
  parseJSON = Prelude.parseJSONText "H265RateControlMode"
