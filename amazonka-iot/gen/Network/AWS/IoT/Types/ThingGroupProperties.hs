{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.IoT.Types.ThingGroupProperties
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.IoT.Types.ThingGroupProperties where

import Network.AWS.IoT.Types.AttributePayload
import Network.AWS.Lens
import Network.AWS.Prelude

-- | Thing group properties.
--
--
--
-- /See:/ 'thingGroupProperties' smart constructor.
data ThingGroupProperties = ThingGroupProperties'
  { _tgpThingGroupDescription ::
      !(Maybe Text),
    _tgpAttributePayload ::
      !(Maybe AttributePayload)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'ThingGroupProperties' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'tgpThingGroupDescription' - The thing group description.
--
-- * 'tgpAttributePayload' - The thing group attributes in JSON format.
thingGroupProperties ::
  ThingGroupProperties
thingGroupProperties =
  ThingGroupProperties'
    { _tgpThingGroupDescription =
        Nothing,
      _tgpAttributePayload = Nothing
    }

-- | The thing group description.
tgpThingGroupDescription :: Lens' ThingGroupProperties (Maybe Text)
tgpThingGroupDescription = lens _tgpThingGroupDescription (\s a -> s {_tgpThingGroupDescription = a})

-- | The thing group attributes in JSON format.
tgpAttributePayload :: Lens' ThingGroupProperties (Maybe AttributePayload)
tgpAttributePayload = lens _tgpAttributePayload (\s a -> s {_tgpAttributePayload = a})

instance FromJSON ThingGroupProperties where
  parseJSON =
    withObject
      "ThingGroupProperties"
      ( \x ->
          ThingGroupProperties'
            <$> (x .:? "thingGroupDescription")
            <*> (x .:? "attributePayload")
      )

instance Hashable ThingGroupProperties

instance NFData ThingGroupProperties

instance ToJSON ThingGroupProperties where
  toJSON ThingGroupProperties' {..} =
    object
      ( catMaybes
          [ ("thingGroupDescription" .=)
              <$> _tgpThingGroupDescription,
            ("attributePayload" .=) <$> _tgpAttributePayload
          ]
      )
