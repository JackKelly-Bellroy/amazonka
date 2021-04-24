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
-- Module      : Network.AWS.RDS.DescribeDBClusterSnapshotAttributes
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns a list of DB cluster snapshot attribute names and values for a manual DB cluster snapshot.
--
--
-- When sharing snapshots with other AWS accounts, @DescribeDBClusterSnapshotAttributes@ returns the @restore@ attribute and a list of IDs for the AWS accounts that are authorized to copy or restore the manual DB cluster snapshot. If @all@ is included in the list of values for the @restore@ attribute, then the manual DB cluster snapshot is public and can be copied or restored by all AWS accounts.
--
-- To add or remove access for an AWS account to copy or restore a manual DB cluster snapshot, or to make the manual DB cluster snapshot public or private, use the @ModifyDBClusterSnapshotAttribute@ API action.
module Network.AWS.RDS.DescribeDBClusterSnapshotAttributes
  ( -- * Creating a Request
    describeDBClusterSnapshotAttributes,
    DescribeDBClusterSnapshotAttributes,

    -- * Request Lenses
    ddcsaDBClusterSnapshotIdentifier,

    -- * Destructuring the Response
    describeDBClusterSnapshotAttributesResponse,
    DescribeDBClusterSnapshotAttributesResponse,

    -- * Response Lenses
    ddcsarrsDBClusterSnapshotAttributesResult,
    ddcsarrsResponseStatus,
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
-- /See:/ 'describeDBClusterSnapshotAttributes' smart constructor.
newtype DescribeDBClusterSnapshotAttributes = DescribeDBClusterSnapshotAttributes'
  { _ddcsaDBClusterSnapshotIdentifier ::
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

-- | Creates a value of 'DescribeDBClusterSnapshotAttributes' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ddcsaDBClusterSnapshotIdentifier' - The identifier for the DB cluster snapshot to describe the attributes for.
describeDBClusterSnapshotAttributes ::
  -- | 'ddcsaDBClusterSnapshotIdentifier'
  Text ->
  DescribeDBClusterSnapshotAttributes
describeDBClusterSnapshotAttributes
  pDBClusterSnapshotIdentifier_ =
    DescribeDBClusterSnapshotAttributes'
      { _ddcsaDBClusterSnapshotIdentifier =
          pDBClusterSnapshotIdentifier_
      }

-- | The identifier for the DB cluster snapshot to describe the attributes for.
ddcsaDBClusterSnapshotIdentifier :: Lens' DescribeDBClusterSnapshotAttributes Text
ddcsaDBClusterSnapshotIdentifier = lens _ddcsaDBClusterSnapshotIdentifier (\s a -> s {_ddcsaDBClusterSnapshotIdentifier = a})

instance
  AWSRequest
    DescribeDBClusterSnapshotAttributes
  where
  type
    Rs DescribeDBClusterSnapshotAttributes =
      DescribeDBClusterSnapshotAttributesResponse
  request = postQuery rds
  response =
    receiveXMLWrapper
      "DescribeDBClusterSnapshotAttributesResult"
      ( \s h x ->
          DescribeDBClusterSnapshotAttributesResponse'
            <$> (x .@? "DBClusterSnapshotAttributesResult")
            <*> (pure (fromEnum s))
      )

instance Hashable DescribeDBClusterSnapshotAttributes

instance NFData DescribeDBClusterSnapshotAttributes

instance
  ToHeaders
    DescribeDBClusterSnapshotAttributes
  where
  toHeaders = const mempty

instance ToPath DescribeDBClusterSnapshotAttributes where
  toPath = const "/"

instance ToQuery DescribeDBClusterSnapshotAttributes where
  toQuery DescribeDBClusterSnapshotAttributes' {..} =
    mconcat
      [ "Action"
          =: ( "DescribeDBClusterSnapshotAttributes" ::
                 ByteString
             ),
        "Version" =: ("2014-10-31" :: ByteString),
        "DBClusterSnapshotIdentifier"
          =: _ddcsaDBClusterSnapshotIdentifier
      ]

-- | /See:/ 'describeDBClusterSnapshotAttributesResponse' smart constructor.
data DescribeDBClusterSnapshotAttributesResponse = DescribeDBClusterSnapshotAttributesResponse'
  { _ddcsarrsDBClusterSnapshotAttributesResult ::
      !( Maybe
           DBClusterSnapshotAttributesResult
       ),
    _ddcsarrsResponseStatus ::
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

-- | Creates a value of 'DescribeDBClusterSnapshotAttributesResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ddcsarrsDBClusterSnapshotAttributesResult' - Undocumented member.
--
-- * 'ddcsarrsResponseStatus' - -- | The response status code.
describeDBClusterSnapshotAttributesResponse ::
  -- | 'ddcsarrsResponseStatus'
  Int ->
  DescribeDBClusterSnapshotAttributesResponse
describeDBClusterSnapshotAttributesResponse
  pResponseStatus_ =
    DescribeDBClusterSnapshotAttributesResponse'
      { _ddcsarrsDBClusterSnapshotAttributesResult =
          Nothing,
        _ddcsarrsResponseStatus =
          pResponseStatus_
      }

-- | Undocumented member.
ddcsarrsDBClusterSnapshotAttributesResult :: Lens' DescribeDBClusterSnapshotAttributesResponse (Maybe DBClusterSnapshotAttributesResult)
ddcsarrsDBClusterSnapshotAttributesResult = lens _ddcsarrsDBClusterSnapshotAttributesResult (\s a -> s {_ddcsarrsDBClusterSnapshotAttributesResult = a})

-- | -- | The response status code.
ddcsarrsResponseStatus :: Lens' DescribeDBClusterSnapshotAttributesResponse Int
ddcsarrsResponseStatus = lens _ddcsarrsResponseStatus (\s a -> s {_ddcsarrsResponseStatus = a})

instance
  NFData
    DescribeDBClusterSnapshotAttributesResponse
