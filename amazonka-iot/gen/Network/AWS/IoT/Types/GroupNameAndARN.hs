{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.IoT.Types.GroupNameAndARN
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.IoT.Types.GroupNameAndARN where

import Network.AWS.Lens
import Network.AWS.Prelude

-- | The name and ARN of a group.
--
--
--
-- /See:/ 'groupNameAndARN' smart constructor.
data GroupNameAndARN = GroupNameAndARN'
  { _gnaaGroupName ::
      !(Maybe Text),
    _gnaaGroupARN :: !(Maybe Text)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'GroupNameAndARN' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gnaaGroupName' - The group name.
--
-- * 'gnaaGroupARN' - The group ARN.
groupNameAndARN ::
  GroupNameAndARN
groupNameAndARN =
  GroupNameAndARN'
    { _gnaaGroupName = Nothing,
      _gnaaGroupARN = Nothing
    }

-- | The group name.
gnaaGroupName :: Lens' GroupNameAndARN (Maybe Text)
gnaaGroupName = lens _gnaaGroupName (\s a -> s {_gnaaGroupName = a})

-- | The group ARN.
gnaaGroupARN :: Lens' GroupNameAndARN (Maybe Text)
gnaaGroupARN = lens _gnaaGroupARN (\s a -> s {_gnaaGroupARN = a})

instance FromJSON GroupNameAndARN where
  parseJSON =
    withObject
      "GroupNameAndARN"
      ( \x ->
          GroupNameAndARN'
            <$> (x .:? "groupName") <*> (x .:? "groupArn")
      )

instance Hashable GroupNameAndARN

instance NFData GroupNameAndARN
