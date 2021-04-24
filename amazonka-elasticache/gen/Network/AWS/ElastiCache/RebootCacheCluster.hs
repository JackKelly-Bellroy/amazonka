{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.ElastiCache.RebootCacheCluster
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Reboots some, or all, of the cache nodes within a provisioned cluster. This operation applies any modified cache parameter groups to the cluster. The reboot operation takes place as soon as possible, and results in a momentary outage to the cluster. During the reboot, the cluster status is set to REBOOTING.
--
--
-- The reboot causes the contents of the cache (for each cache node being rebooted) to be lost.
--
-- When the reboot is complete, a cluster event is created.
--
-- Rebooting a cluster is currently supported on Memcached and Redis (cluster mode disabled) clusters. Rebooting is not supported on Redis (cluster mode enabled) clusters.
--
-- If you make changes to parameters that require a Redis (cluster mode enabled) cluster reboot for the changes to be applied, see <http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.Rebooting.html Rebooting a Cluster> for an alternate process.
module Network.AWS.ElastiCache.RebootCacheCluster
  ( -- * Creating a Request
    rebootCacheCluster,
    RebootCacheCluster,

    -- * Request Lenses
    rccCacheClusterId,
    rccCacheNodeIdsToReboot,

    -- * Destructuring the Response
    rebootCacheClusterResponse,
    RebootCacheClusterResponse,

    -- * Response Lenses
    rccrrsCacheCluster,
    rccrrsResponseStatus,
  )
where

import Network.AWS.ElastiCache.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | Represents the input of a @RebootCacheCluster@ operation.
--
--
--
-- /See:/ 'rebootCacheCluster' smart constructor.
data RebootCacheCluster = RebootCacheCluster'
  { _rccCacheClusterId ::
      !Text,
    _rccCacheNodeIdsToReboot ::
      ![Text]
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'RebootCacheCluster' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rccCacheClusterId' - The cluster identifier. This parameter is stored as a lowercase string.
--
-- * 'rccCacheNodeIdsToReboot' - A list of cache node IDs to reboot. A node ID is a numeric identifier (0001, 0002, etc.). To reboot an entire cluster, specify all of the cache node IDs.
rebootCacheCluster ::
  -- | 'rccCacheClusterId'
  Text ->
  RebootCacheCluster
rebootCacheCluster pCacheClusterId_ =
  RebootCacheCluster'
    { _rccCacheClusterId =
        pCacheClusterId_,
      _rccCacheNodeIdsToReboot = mempty
    }

-- | The cluster identifier. This parameter is stored as a lowercase string.
rccCacheClusterId :: Lens' RebootCacheCluster Text
rccCacheClusterId = lens _rccCacheClusterId (\s a -> s {_rccCacheClusterId = a})

-- | A list of cache node IDs to reboot. A node ID is a numeric identifier (0001, 0002, etc.). To reboot an entire cluster, specify all of the cache node IDs.
rccCacheNodeIdsToReboot :: Lens' RebootCacheCluster [Text]
rccCacheNodeIdsToReboot = lens _rccCacheNodeIdsToReboot (\s a -> s {_rccCacheNodeIdsToReboot = a}) . _Coerce

instance AWSRequest RebootCacheCluster where
  type
    Rs RebootCacheCluster =
      RebootCacheClusterResponse
  request = postQuery elastiCache
  response =
    receiveXMLWrapper
      "RebootCacheClusterResult"
      ( \s h x ->
          RebootCacheClusterResponse'
            <$> (x .@? "CacheCluster") <*> (pure (fromEnum s))
      )

instance Hashable RebootCacheCluster

instance NFData RebootCacheCluster

instance ToHeaders RebootCacheCluster where
  toHeaders = const mempty

instance ToPath RebootCacheCluster where
  toPath = const "/"

instance ToQuery RebootCacheCluster where
  toQuery RebootCacheCluster' {..} =
    mconcat
      [ "Action" =: ("RebootCacheCluster" :: ByteString),
        "Version" =: ("2015-02-02" :: ByteString),
        "CacheClusterId" =: _rccCacheClusterId,
        "CacheNodeIdsToReboot"
          =: toQueryList "CacheNodeId" _rccCacheNodeIdsToReboot
      ]

-- | /See:/ 'rebootCacheClusterResponse' smart constructor.
data RebootCacheClusterResponse = RebootCacheClusterResponse'
  { _rccrrsCacheCluster ::
      !( Maybe
           CacheCluster
       ),
    _rccrrsResponseStatus ::
      !Int
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'RebootCacheClusterResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rccrrsCacheCluster' - Undocumented member.
--
-- * 'rccrrsResponseStatus' - -- | The response status code.
rebootCacheClusterResponse ::
  -- | 'rccrrsResponseStatus'
  Int ->
  RebootCacheClusterResponse
rebootCacheClusterResponse pResponseStatus_ =
  RebootCacheClusterResponse'
    { _rccrrsCacheCluster =
        Nothing,
      _rccrrsResponseStatus = pResponseStatus_
    }

-- | Undocumented member.
rccrrsCacheCluster :: Lens' RebootCacheClusterResponse (Maybe CacheCluster)
rccrrsCacheCluster = lens _rccrrsCacheCluster (\s a -> s {_rccrrsCacheCluster = a})

-- | -- | The response status code.
rccrrsResponseStatus :: Lens' RebootCacheClusterResponse Int
rccrrsResponseStatus = lens _rccrrsResponseStatus (\s a -> s {_rccrrsResponseStatus = a})

instance NFData RebootCacheClusterResponse
