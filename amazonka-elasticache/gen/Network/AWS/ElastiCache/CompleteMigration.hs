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
-- Module      : Network.AWS.ElastiCache.CompleteMigration
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Complete the migration of data.
module Network.AWS.ElastiCache.CompleteMigration
  ( -- * Creating a Request
    completeMigration,
    CompleteMigration,

    -- * Request Lenses
    cmForce,
    cmReplicationGroupId,

    -- * Destructuring the Response
    completeMigrationResponse,
    CompleteMigrationResponse,

    -- * Response Lenses
    cmrrsReplicationGroup,
    cmrrsResponseStatus,
  )
where

import Network.AWS.ElastiCache.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'completeMigration' smart constructor.
data CompleteMigration = CompleteMigration'
  { _cmForce ::
      !(Maybe Bool),
    _cmReplicationGroupId :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'CompleteMigration' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cmForce' - Forces the migration to stop without ensuring that data is in sync. It is recommended to use this option only to abort the migration and not recommended when application wants to continue migration to ElastiCache.
--
-- * 'cmReplicationGroupId' - The ID of the replication group to which data is being migrated.
completeMigration ::
  -- | 'cmReplicationGroupId'
  Text ->
  CompleteMigration
completeMigration pReplicationGroupId_ =
  CompleteMigration'
    { _cmForce = Nothing,
      _cmReplicationGroupId = pReplicationGroupId_
    }

-- | Forces the migration to stop without ensuring that data is in sync. It is recommended to use this option only to abort the migration and not recommended when application wants to continue migration to ElastiCache.
cmForce :: Lens' CompleteMigration (Maybe Bool)
cmForce = lens _cmForce (\s a -> s {_cmForce = a})

-- | The ID of the replication group to which data is being migrated.
cmReplicationGroupId :: Lens' CompleteMigration Text
cmReplicationGroupId = lens _cmReplicationGroupId (\s a -> s {_cmReplicationGroupId = a})

instance AWSRequest CompleteMigration where
  type Rs CompleteMigration = CompleteMigrationResponse
  request = postQuery elastiCache
  response =
    receiveXMLWrapper
      "CompleteMigrationResult"
      ( \s h x ->
          CompleteMigrationResponse'
            <$> (x .@? "ReplicationGroup") <*> (pure (fromEnum s))
      )

instance Hashable CompleteMigration

instance NFData CompleteMigration

instance ToHeaders CompleteMigration where
  toHeaders = const mempty

instance ToPath CompleteMigration where
  toPath = const "/"

instance ToQuery CompleteMigration where
  toQuery CompleteMigration' {..} =
    mconcat
      [ "Action" =: ("CompleteMigration" :: ByteString),
        "Version" =: ("2015-02-02" :: ByteString),
        "Force" =: _cmForce,
        "ReplicationGroupId" =: _cmReplicationGroupId
      ]

-- | /See:/ 'completeMigrationResponse' smart constructor.
data CompleteMigrationResponse = CompleteMigrationResponse'
  { _cmrrsReplicationGroup ::
      !( Maybe
           ReplicationGroup
       ),
    _cmrrsResponseStatus ::
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

-- | Creates a value of 'CompleteMigrationResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cmrrsReplicationGroup' - Undocumented member.
--
-- * 'cmrrsResponseStatus' - -- | The response status code.
completeMigrationResponse ::
  -- | 'cmrrsResponseStatus'
  Int ->
  CompleteMigrationResponse
completeMigrationResponse pResponseStatus_ =
  CompleteMigrationResponse'
    { _cmrrsReplicationGroup =
        Nothing,
      _cmrrsResponseStatus = pResponseStatus_
    }

-- | Undocumented member.
cmrrsReplicationGroup :: Lens' CompleteMigrationResponse (Maybe ReplicationGroup)
cmrrsReplicationGroup = lens _cmrrsReplicationGroup (\s a -> s {_cmrrsReplicationGroup = a})

-- | -- | The response status code.
cmrrsResponseStatus :: Lens' CompleteMigrationResponse Int
cmrrsResponseStatus = lens _cmrrsResponseStatus (\s a -> s {_cmrrsResponseStatus = a})

instance NFData CompleteMigrationResponse
