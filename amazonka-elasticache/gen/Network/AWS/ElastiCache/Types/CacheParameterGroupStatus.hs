{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.ElastiCache.Types.CacheParameterGroupStatus
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.ElastiCache.Types.CacheParameterGroupStatus where

import Network.AWS.Lens
import Network.AWS.Prelude

-- | Status of the cache parameter group.
--
--
--
-- /See:/ 'cacheParameterGroupStatus' smart constructor.
data CacheParameterGroupStatus = CacheParameterGroupStatus'
  { _cpgsCacheParameterGroupName ::
      !(Maybe Text),
    _cpgsParameterApplyStatus ::
      !(Maybe Text),
    _cpgsCacheNodeIdsToReboot ::
      !(Maybe [Text])
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'CacheParameterGroupStatus' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cpgsCacheParameterGroupName' - The name of the cache parameter group.
--
-- * 'cpgsParameterApplyStatus' - The status of parameter updates.
--
-- * 'cpgsCacheNodeIdsToReboot' - A list of the cache node IDs which need to be rebooted for parameter changes to be applied. A node ID is a numeric identifier (0001, 0002, etc.).
cacheParameterGroupStatus ::
  CacheParameterGroupStatus
cacheParameterGroupStatus =
  CacheParameterGroupStatus'
    { _cpgsCacheParameterGroupName =
        Nothing,
      _cpgsParameterApplyStatus = Nothing,
      _cpgsCacheNodeIdsToReboot = Nothing
    }

-- | The name of the cache parameter group.
cpgsCacheParameterGroupName :: Lens' CacheParameterGroupStatus (Maybe Text)
cpgsCacheParameterGroupName = lens _cpgsCacheParameterGroupName (\s a -> s {_cpgsCacheParameterGroupName = a})

-- | The status of parameter updates.
cpgsParameterApplyStatus :: Lens' CacheParameterGroupStatus (Maybe Text)
cpgsParameterApplyStatus = lens _cpgsParameterApplyStatus (\s a -> s {_cpgsParameterApplyStatus = a})

-- | A list of the cache node IDs which need to be rebooted for parameter changes to be applied. A node ID is a numeric identifier (0001, 0002, etc.).
cpgsCacheNodeIdsToReboot :: Lens' CacheParameterGroupStatus [Text]
cpgsCacheNodeIdsToReboot = lens _cpgsCacheNodeIdsToReboot (\s a -> s {_cpgsCacheNodeIdsToReboot = a}) . _Default . _Coerce

instance FromXML CacheParameterGroupStatus where
  parseXML x =
    CacheParameterGroupStatus'
      <$> (x .@? "CacheParameterGroupName")
      <*> (x .@? "ParameterApplyStatus")
      <*> ( x .@? "CacheNodeIdsToReboot" .!@ mempty
              >>= may (parseXMLList "CacheNodeId")
          )

instance Hashable CacheParameterGroupStatus

instance NFData CacheParameterGroupStatus
