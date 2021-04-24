{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.MediaConvert.Types.Preset
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.MediaConvert.Types.Preset where

import Network.AWS.Lens
import Network.AWS.MediaConvert.Types.PresetSettings
import Network.AWS.MediaConvert.Types.Type
import Network.AWS.Prelude

-- | A preset is a collection of preconfigured media conversion settings that you want MediaConvert to apply to the output during the conversion process.
--
-- /See:/ 'preset' smart constructor.
data Preset = Preset'
  { _pCategory :: !(Maybe Text),
    _pARN :: !(Maybe Text),
    _pCreatedAt :: !(Maybe POSIX),
    _pLastUpdated :: !(Maybe POSIX),
    _pDescription :: !(Maybe Text),
    _pType :: !(Maybe Type),
    _pSettings :: !PresetSettings,
    _pName :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'Preset' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'pCategory' - An optional category you create to organize your presets.
--
-- * 'pARN' - An identifier for this resource that is unique within all of AWS.
--
-- * 'pCreatedAt' - The timestamp in epoch seconds for preset creation.
--
-- * 'pLastUpdated' - The timestamp in epoch seconds when the preset was last updated.
--
-- * 'pDescription' - An optional description you create for each preset.
--
-- * 'pType' - A preset can be of two types: system or custom. System or built-in preset can't be modified or deleted by the user.
--
-- * 'pSettings' - Settings for preset
--
-- * 'pName' - A name you create for each preset. Each name must be unique within your account.
preset ::
  -- | 'pSettings'
  PresetSettings ->
  -- | 'pName'
  Text ->
  Preset
preset pSettings_ pName_ =
  Preset'
    { _pCategory = Nothing,
      _pARN = Nothing,
      _pCreatedAt = Nothing,
      _pLastUpdated = Nothing,
      _pDescription = Nothing,
      _pType = Nothing,
      _pSettings = pSettings_,
      _pName = pName_
    }

-- | An optional category you create to organize your presets.
pCategory :: Lens' Preset (Maybe Text)
pCategory = lens _pCategory (\s a -> s {_pCategory = a})

-- | An identifier for this resource that is unique within all of AWS.
pARN :: Lens' Preset (Maybe Text)
pARN = lens _pARN (\s a -> s {_pARN = a})

-- | The timestamp in epoch seconds for preset creation.
pCreatedAt :: Lens' Preset (Maybe UTCTime)
pCreatedAt = lens _pCreatedAt (\s a -> s {_pCreatedAt = a}) . mapping _Time

-- | The timestamp in epoch seconds when the preset was last updated.
pLastUpdated :: Lens' Preset (Maybe UTCTime)
pLastUpdated = lens _pLastUpdated (\s a -> s {_pLastUpdated = a}) . mapping _Time

-- | An optional description you create for each preset.
pDescription :: Lens' Preset (Maybe Text)
pDescription = lens _pDescription (\s a -> s {_pDescription = a})

-- | A preset can be of two types: system or custom. System or built-in preset can't be modified or deleted by the user.
pType :: Lens' Preset (Maybe Type)
pType = lens _pType (\s a -> s {_pType = a})

-- | Settings for preset
pSettings :: Lens' Preset PresetSettings
pSettings = lens _pSettings (\s a -> s {_pSettings = a})

-- | A name you create for each preset. Each name must be unique within your account.
pName :: Lens' Preset Text
pName = lens _pName (\s a -> s {_pName = a})

instance FromJSON Preset where
  parseJSON =
    withObject
      "Preset"
      ( \x ->
          Preset'
            <$> (x .:? "category")
            <*> (x .:? "arn")
            <*> (x .:? "createdAt")
            <*> (x .:? "lastUpdated")
            <*> (x .:? "description")
            <*> (x .:? "type")
            <*> (x .: "settings")
            <*> (x .: "name")
      )

instance Hashable Preset

instance NFData Preset
