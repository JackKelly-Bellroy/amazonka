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
-- Module      : Network.AWS.MediaConvert.Types.AudioNormalizationAlgorithmControl
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.MediaConvert.Types.AudioNormalizationAlgorithmControl
  ( AudioNormalizationAlgorithmControl
      ( ..,
        AudioNormalizationAlgorithmControlCORRECTAUDIO,
        AudioNormalizationAlgorithmControlMEASUREONLY
      ),
  )
where

import qualified Network.AWS.Prelude as Prelude

-- | When enabled the output audio is corrected using the chosen algorithm.
-- If disabled, the audio will be measured but not adjusted.
newtype AudioNormalizationAlgorithmControl = AudioNormalizationAlgorithmControl'
  { fromAudioNormalizationAlgorithmControl ::
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

pattern AudioNormalizationAlgorithmControlCORRECTAUDIO :: AudioNormalizationAlgorithmControl
pattern AudioNormalizationAlgorithmControlCORRECTAUDIO = AudioNormalizationAlgorithmControl' "CORRECT_AUDIO"

pattern AudioNormalizationAlgorithmControlMEASUREONLY :: AudioNormalizationAlgorithmControl
pattern AudioNormalizationAlgorithmControlMEASUREONLY = AudioNormalizationAlgorithmControl' "MEASURE_ONLY"

{-# COMPLETE
  AudioNormalizationAlgorithmControlCORRECTAUDIO,
  AudioNormalizationAlgorithmControlMEASUREONLY,
  AudioNormalizationAlgorithmControl'
  #-}

instance Prelude.FromText AudioNormalizationAlgorithmControl where
  parser = AudioNormalizationAlgorithmControl' Prelude.<$> Prelude.takeText

instance Prelude.ToText AudioNormalizationAlgorithmControl where
  toText (AudioNormalizationAlgorithmControl' x) = x

instance Prelude.Hashable AudioNormalizationAlgorithmControl

instance Prelude.NFData AudioNormalizationAlgorithmControl

instance Prelude.ToByteString AudioNormalizationAlgorithmControl

instance Prelude.ToQuery AudioNormalizationAlgorithmControl

instance Prelude.ToHeader AudioNormalizationAlgorithmControl

instance Prelude.ToJSON AudioNormalizationAlgorithmControl where
  toJSON = Prelude.toJSONText

instance Prelude.FromJSON AudioNormalizationAlgorithmControl where
  parseJSON = Prelude.parseJSONText "AudioNormalizationAlgorithmControl"
