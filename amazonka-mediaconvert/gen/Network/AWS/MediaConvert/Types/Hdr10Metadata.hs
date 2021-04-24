{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.MediaConvert.Types.Hdr10Metadata
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.MediaConvert.Types.Hdr10Metadata where

import Network.AWS.Lens
import Network.AWS.Prelude

-- | Use these settings to specify static color calibration metadata, as defined by SMPTE ST 2086. These values don't affect the pixel values that are encoded in the video stream. They are intended to help the downstream video player display content in a way that reflects the intentions of the the content creator.
--
-- /See:/ 'hdr10Metadata' smart constructor.
data Hdr10Metadata = Hdr10Metadata'
  { _hmGreenPrimaryX ::
      !(Maybe Nat),
    _hmMaxLuminance :: !(Maybe Nat),
    _hmGreenPrimaryY :: !(Maybe Nat),
    _hmBluePrimaryY :: !(Maybe Nat),
    _hmBluePrimaryX :: !(Maybe Nat),
    _hmRedPrimaryX :: !(Maybe Nat),
    _hmRedPrimaryY :: !(Maybe Nat),
    _hmWhitePointX :: !(Maybe Nat),
    _hmMinLuminance :: !(Maybe Nat),
    _hmMaxContentLightLevel :: !(Maybe Nat),
    _hmMaxFrameAverageLightLevel ::
      !(Maybe Nat),
    _hmWhitePointY :: !(Maybe Nat)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'Hdr10Metadata' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'hmGreenPrimaryX' - HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
--
-- * 'hmMaxLuminance' - Nominal maximum mastering display luminance in units of of 0.0001 candelas per square meter.
--
-- * 'hmGreenPrimaryY' - HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
--
-- * 'hmBluePrimaryY' - HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
--
-- * 'hmBluePrimaryX' - HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
--
-- * 'hmRedPrimaryX' - HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
--
-- * 'hmRedPrimaryY' - HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
--
-- * 'hmWhitePointX' - HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
--
-- * 'hmMinLuminance' - Nominal minimum mastering display luminance in units of of 0.0001 candelas per square meter
--
-- * 'hmMaxContentLightLevel' - Maximum light level among all samples in the coded video sequence, in units of candelas per square meter.  This setting doesn't have a default value; you must specify a value that is suitable for the content.
--
-- * 'hmMaxFrameAverageLightLevel' - Maximum average light level of any frame in the coded video sequence, in units of candelas per square meter. This setting doesn't have a default value; you must specify a value that is suitable for the content.
--
-- * 'hmWhitePointY' - HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
hdr10Metadata ::
  Hdr10Metadata
hdr10Metadata =
  Hdr10Metadata'
    { _hmGreenPrimaryX = Nothing,
      _hmMaxLuminance = Nothing,
      _hmGreenPrimaryY = Nothing,
      _hmBluePrimaryY = Nothing,
      _hmBluePrimaryX = Nothing,
      _hmRedPrimaryX = Nothing,
      _hmRedPrimaryY = Nothing,
      _hmWhitePointX = Nothing,
      _hmMinLuminance = Nothing,
      _hmMaxContentLightLevel = Nothing,
      _hmMaxFrameAverageLightLevel = Nothing,
      _hmWhitePointY = Nothing
    }

-- | HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
hmGreenPrimaryX :: Lens' Hdr10Metadata (Maybe Natural)
hmGreenPrimaryX = lens _hmGreenPrimaryX (\s a -> s {_hmGreenPrimaryX = a}) . mapping _Nat

-- | Nominal maximum mastering display luminance in units of of 0.0001 candelas per square meter.
hmMaxLuminance :: Lens' Hdr10Metadata (Maybe Natural)
hmMaxLuminance = lens _hmMaxLuminance (\s a -> s {_hmMaxLuminance = a}) . mapping _Nat

-- | HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
hmGreenPrimaryY :: Lens' Hdr10Metadata (Maybe Natural)
hmGreenPrimaryY = lens _hmGreenPrimaryY (\s a -> s {_hmGreenPrimaryY = a}) . mapping _Nat

-- | HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
hmBluePrimaryY :: Lens' Hdr10Metadata (Maybe Natural)
hmBluePrimaryY = lens _hmBluePrimaryY (\s a -> s {_hmBluePrimaryY = a}) . mapping _Nat

-- | HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
hmBluePrimaryX :: Lens' Hdr10Metadata (Maybe Natural)
hmBluePrimaryX = lens _hmBluePrimaryX (\s a -> s {_hmBluePrimaryX = a}) . mapping _Nat

-- | HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
hmRedPrimaryX :: Lens' Hdr10Metadata (Maybe Natural)
hmRedPrimaryX = lens _hmRedPrimaryX (\s a -> s {_hmRedPrimaryX = a}) . mapping _Nat

-- | HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
hmRedPrimaryY :: Lens' Hdr10Metadata (Maybe Natural)
hmRedPrimaryY = lens _hmRedPrimaryY (\s a -> s {_hmRedPrimaryY = a}) . mapping _Nat

-- | HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
hmWhitePointX :: Lens' Hdr10Metadata (Maybe Natural)
hmWhitePointX = lens _hmWhitePointX (\s a -> s {_hmWhitePointX = a}) . mapping _Nat

-- | Nominal minimum mastering display luminance in units of of 0.0001 candelas per square meter
hmMinLuminance :: Lens' Hdr10Metadata (Maybe Natural)
hmMinLuminance = lens _hmMinLuminance (\s a -> s {_hmMinLuminance = a}) . mapping _Nat

-- | Maximum light level among all samples in the coded video sequence, in units of candelas per square meter.  This setting doesn't have a default value; you must specify a value that is suitable for the content.
hmMaxContentLightLevel :: Lens' Hdr10Metadata (Maybe Natural)
hmMaxContentLightLevel = lens _hmMaxContentLightLevel (\s a -> s {_hmMaxContentLightLevel = a}) . mapping _Nat

-- | Maximum average light level of any frame in the coded video sequence, in units of candelas per square meter. This setting doesn't have a default value; you must specify a value that is suitable for the content.
hmMaxFrameAverageLightLevel :: Lens' Hdr10Metadata (Maybe Natural)
hmMaxFrameAverageLightLevel = lens _hmMaxFrameAverageLightLevel (\s a -> s {_hmMaxFrameAverageLightLevel = a}) . mapping _Nat

-- | HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
hmWhitePointY :: Lens' Hdr10Metadata (Maybe Natural)
hmWhitePointY = lens _hmWhitePointY (\s a -> s {_hmWhitePointY = a}) . mapping _Nat

instance FromJSON Hdr10Metadata where
  parseJSON =
    withObject
      "Hdr10Metadata"
      ( \x ->
          Hdr10Metadata'
            <$> (x .:? "greenPrimaryX")
            <*> (x .:? "maxLuminance")
            <*> (x .:? "greenPrimaryY")
            <*> (x .:? "bluePrimaryY")
            <*> (x .:? "bluePrimaryX")
            <*> (x .:? "redPrimaryX")
            <*> (x .:? "redPrimaryY")
            <*> (x .:? "whitePointX")
            <*> (x .:? "minLuminance")
            <*> (x .:? "maxContentLightLevel")
            <*> (x .:? "maxFrameAverageLightLevel")
            <*> (x .:? "whitePointY")
      )

instance Hashable Hdr10Metadata

instance NFData Hdr10Metadata

instance ToJSON Hdr10Metadata where
  toJSON Hdr10Metadata' {..} =
    object
      ( catMaybes
          [ ("greenPrimaryX" .=) <$> _hmGreenPrimaryX,
            ("maxLuminance" .=) <$> _hmMaxLuminance,
            ("greenPrimaryY" .=) <$> _hmGreenPrimaryY,
            ("bluePrimaryY" .=) <$> _hmBluePrimaryY,
            ("bluePrimaryX" .=) <$> _hmBluePrimaryX,
            ("redPrimaryX" .=) <$> _hmRedPrimaryX,
            ("redPrimaryY" .=) <$> _hmRedPrimaryY,
            ("whitePointX" .=) <$> _hmWhitePointX,
            ("minLuminance" .=) <$> _hmMinLuminance,
            ("maxContentLightLevel" .=)
              <$> _hmMaxContentLightLevel,
            ("maxFrameAverageLightLevel" .=)
              <$> _hmMaxFrameAverageLightLevel,
            ("whitePointY" .=) <$> _hmWhitePointY
          ]
      )
