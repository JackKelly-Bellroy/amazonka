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
-- Module      : Network.AWS.RDS.PromoteReadReplicaDBCluster
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Promotes a read replica DB cluster to a standalone DB cluster.
module Network.AWS.RDS.PromoteReadReplicaDBCluster
  ( -- * Creating a Request
    promoteReadReplicaDBCluster,
    PromoteReadReplicaDBCluster,

    -- * Request Lenses
    prrdcDBClusterIdentifier,

    -- * Destructuring the Response
    promoteReadReplicaDBClusterResponse,
    PromoteReadReplicaDBClusterResponse,

    -- * Response Lenses
    prrdcrrsDBCluster,
    prrdcrrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.RDS.Types
import Network.AWS.Request
import Network.AWS.Response

-- |
--
--
--
-- /See:/ 'promoteReadReplicaDBCluster' smart constructor.
newtype PromoteReadReplicaDBCluster = PromoteReadReplicaDBCluster'
  { _prrdcDBClusterIdentifier ::
      Text
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'PromoteReadReplicaDBCluster' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'prrdcDBClusterIdentifier' - The identifier of the DB cluster read replica to promote. This parameter isn't case-sensitive.  Constraints:     * Must match the identifier of an existing DB cluster read replica. Example: @my-cluster-replica1@
promoteReadReplicaDBCluster ::
  -- | 'prrdcDBClusterIdentifier'
  Text ->
  PromoteReadReplicaDBCluster
promoteReadReplicaDBCluster pDBClusterIdentifier_ =
  PromoteReadReplicaDBCluster'
    { _prrdcDBClusterIdentifier =
        pDBClusterIdentifier_
    }

-- | The identifier of the DB cluster read replica to promote. This parameter isn't case-sensitive.  Constraints:     * Must match the identifier of an existing DB cluster read replica. Example: @my-cluster-replica1@
prrdcDBClusterIdentifier :: Lens' PromoteReadReplicaDBCluster Text
prrdcDBClusterIdentifier = lens _prrdcDBClusterIdentifier (\s a -> s {_prrdcDBClusterIdentifier = a})

instance AWSRequest PromoteReadReplicaDBCluster where
  type
    Rs PromoteReadReplicaDBCluster =
      PromoteReadReplicaDBClusterResponse
  request = postQuery rds
  response =
    receiveXMLWrapper
      "PromoteReadReplicaDBClusterResult"
      ( \s h x ->
          PromoteReadReplicaDBClusterResponse'
            <$> (x .@? "DBCluster") <*> (pure (fromEnum s))
      )

instance Hashable PromoteReadReplicaDBCluster

instance NFData PromoteReadReplicaDBCluster

instance ToHeaders PromoteReadReplicaDBCluster where
  toHeaders = const mempty

instance ToPath PromoteReadReplicaDBCluster where
  toPath = const "/"

instance ToQuery PromoteReadReplicaDBCluster where
  toQuery PromoteReadReplicaDBCluster' {..} =
    mconcat
      [ "Action"
          =: ("PromoteReadReplicaDBCluster" :: ByteString),
        "Version" =: ("2014-10-31" :: ByteString),
        "DBClusterIdentifier" =: _prrdcDBClusterIdentifier
      ]

-- | /See:/ 'promoteReadReplicaDBClusterResponse' smart constructor.
data PromoteReadReplicaDBClusterResponse = PromoteReadReplicaDBClusterResponse'
  { _prrdcrrsDBCluster ::
      !( Maybe
           DBCluster
       ),
    _prrdcrrsResponseStatus ::
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

-- | Creates a value of 'PromoteReadReplicaDBClusterResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'prrdcrrsDBCluster' - Undocumented member.
--
-- * 'prrdcrrsResponseStatus' - -- | The response status code.
promoteReadReplicaDBClusterResponse ::
  -- | 'prrdcrrsResponseStatus'
  Int ->
  PromoteReadReplicaDBClusterResponse
promoteReadReplicaDBClusterResponse pResponseStatus_ =
  PromoteReadReplicaDBClusterResponse'
    { _prrdcrrsDBCluster =
        Nothing,
      _prrdcrrsResponseStatus =
        pResponseStatus_
    }

-- | Undocumented member.
prrdcrrsDBCluster :: Lens' PromoteReadReplicaDBClusterResponse (Maybe DBCluster)
prrdcrrsDBCluster = lens _prrdcrrsDBCluster (\s a -> s {_prrdcrrsDBCluster = a})

-- | -- | The response status code.
prrdcrrsResponseStatus :: Lens' PromoteReadReplicaDBClusterResponse Int
prrdcrrsResponseStatus = lens _prrdcrrsResponseStatus (\s a -> s {_prrdcrrsResponseStatus = a})

instance NFData PromoteReadReplicaDBClusterResponse
