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
-- Module      : Network.AWS.RDS.CreateDBSubnetGroup
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates a new DB subnet group. DB subnet groups must contain at least one subnet in at least two AZs in the AWS Region.
module Network.AWS.RDS.CreateDBSubnetGroup
  ( -- * Creating a Request
    createDBSubnetGroup,
    CreateDBSubnetGroup,

    -- * Request Lenses
    cdbsgTags,
    cdbsgDBSubnetGroupName,
    cdbsgDBSubnetGroupDescription,
    cdbsgSubnetIds,

    -- * Destructuring the Response
    createDBSubnetGroupResponse,
    CreateDBSubnetGroupResponse,

    -- * Response Lenses
    cdbsgrrsDBSubnetGroup,
    cdbsgrrsResponseStatus,
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
-- /See:/ 'createDBSubnetGroup' smart constructor.
data CreateDBSubnetGroup = CreateDBSubnetGroup'
  { _cdbsgTags ::
      !(Maybe [Tag]),
    _cdbsgDBSubnetGroupName ::
      !Text,
    _cdbsgDBSubnetGroupDescription ::
      !Text,
    _cdbsgSubnetIds :: ![Text]
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'CreateDBSubnetGroup' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cdbsgTags' - Tags to assign to the DB subnet group.
--
-- * 'cdbsgDBSubnetGroupName' - The name for the DB subnet group. This value is stored as a lowercase string. Constraints: Must contain no more than 255 letters, numbers, periods, underscores, spaces, or hyphens. Must not be default. Example: @mySubnetgroup@
--
-- * 'cdbsgDBSubnetGroupDescription' - The description for the DB subnet group.
--
-- * 'cdbsgSubnetIds' - The EC2 Subnet IDs for the DB subnet group.
createDBSubnetGroup ::
  -- | 'cdbsgDBSubnetGroupName'
  Text ->
  -- | 'cdbsgDBSubnetGroupDescription'
  Text ->
  CreateDBSubnetGroup
createDBSubnetGroup
  pDBSubnetGroupName_
  pDBSubnetGroupDescription_ =
    CreateDBSubnetGroup'
      { _cdbsgTags = Nothing,
        _cdbsgDBSubnetGroupName = pDBSubnetGroupName_,
        _cdbsgDBSubnetGroupDescription =
          pDBSubnetGroupDescription_,
        _cdbsgSubnetIds = mempty
      }

-- | Tags to assign to the DB subnet group.
cdbsgTags :: Lens' CreateDBSubnetGroup [Tag]
cdbsgTags = lens _cdbsgTags (\s a -> s {_cdbsgTags = a}) . _Default . _Coerce

-- | The name for the DB subnet group. This value is stored as a lowercase string. Constraints: Must contain no more than 255 letters, numbers, periods, underscores, spaces, or hyphens. Must not be default. Example: @mySubnetgroup@
cdbsgDBSubnetGroupName :: Lens' CreateDBSubnetGroup Text
cdbsgDBSubnetGroupName = lens _cdbsgDBSubnetGroupName (\s a -> s {_cdbsgDBSubnetGroupName = a})

-- | The description for the DB subnet group.
cdbsgDBSubnetGroupDescription :: Lens' CreateDBSubnetGroup Text
cdbsgDBSubnetGroupDescription = lens _cdbsgDBSubnetGroupDescription (\s a -> s {_cdbsgDBSubnetGroupDescription = a})

-- | The EC2 Subnet IDs for the DB subnet group.
cdbsgSubnetIds :: Lens' CreateDBSubnetGroup [Text]
cdbsgSubnetIds = lens _cdbsgSubnetIds (\s a -> s {_cdbsgSubnetIds = a}) . _Coerce

instance AWSRequest CreateDBSubnetGroup where
  type
    Rs CreateDBSubnetGroup =
      CreateDBSubnetGroupResponse
  request = postQuery rds
  response =
    receiveXMLWrapper
      "CreateDBSubnetGroupResult"
      ( \s h x ->
          CreateDBSubnetGroupResponse'
            <$> (x .@? "DBSubnetGroup") <*> (pure (fromEnum s))
      )

instance Hashable CreateDBSubnetGroup

instance NFData CreateDBSubnetGroup

instance ToHeaders CreateDBSubnetGroup where
  toHeaders = const mempty

instance ToPath CreateDBSubnetGroup where
  toPath = const "/"

instance ToQuery CreateDBSubnetGroup where
  toQuery CreateDBSubnetGroup' {..} =
    mconcat
      [ "Action" =: ("CreateDBSubnetGroup" :: ByteString),
        "Version" =: ("2014-10-31" :: ByteString),
        "Tags" =: toQuery (toQueryList "Tag" <$> _cdbsgTags),
        "DBSubnetGroupName" =: _cdbsgDBSubnetGroupName,
        "DBSubnetGroupDescription"
          =: _cdbsgDBSubnetGroupDescription,
        "SubnetIds"
          =: toQueryList "SubnetIdentifier" _cdbsgSubnetIds
      ]

-- | /See:/ 'createDBSubnetGroupResponse' smart constructor.
data CreateDBSubnetGroupResponse = CreateDBSubnetGroupResponse'
  { _cdbsgrrsDBSubnetGroup ::
      !( Maybe
           DBSubnetGroup
       ),
    _cdbsgrrsResponseStatus ::
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

-- | Creates a value of 'CreateDBSubnetGroupResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cdbsgrrsDBSubnetGroup' - Undocumented member.
--
-- * 'cdbsgrrsResponseStatus' - -- | The response status code.
createDBSubnetGroupResponse ::
  -- | 'cdbsgrrsResponseStatus'
  Int ->
  CreateDBSubnetGroupResponse
createDBSubnetGroupResponse pResponseStatus_ =
  CreateDBSubnetGroupResponse'
    { _cdbsgrrsDBSubnetGroup =
        Nothing,
      _cdbsgrrsResponseStatus = pResponseStatus_
    }

-- | Undocumented member.
cdbsgrrsDBSubnetGroup :: Lens' CreateDBSubnetGroupResponse (Maybe DBSubnetGroup)
cdbsgrrsDBSubnetGroup = lens _cdbsgrrsDBSubnetGroup (\s a -> s {_cdbsgrrsDBSubnetGroup = a})

-- | -- | The response status code.
cdbsgrrsResponseStatus :: Lens' CreateDBSubnetGroupResponse Int
cdbsgrrsResponseStatus = lens _cdbsgrrsResponseStatus (\s a -> s {_cdbsgrrsResponseStatus = a})

instance NFData CreateDBSubnetGroupResponse
