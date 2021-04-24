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
-- Module      : Network.AWS.IAM.DeleteServiceLinkedRole
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Submits a service-linked role deletion request and returns a @DeletionTaskId@ , which you can use to check the status of the deletion. Before you call this operation, confirm that the role has no active sessions and that any resources used by the role in the linked service are deleted. If you call this operation more than once for the same service-linked role and an earlier deletion task is not complete, then the @DeletionTaskId@ of the earlier request is returned.
--
--
-- If you submit a deletion request for a service-linked role whose linked service is still accessing a resource, then the deletion task fails. If it fails, the 'GetServiceLinkedRoleDeletionStatus' operation returns the reason for the failure, usually including the resources that must be deleted. To delete the service-linked role, you must first remove those resources from the linked service and then submit the deletion request again. Resources are specific to the service that is linked to the role. For more information about removing resources from a service, see the <http://docs.aws.amazon.com/ AWS documentation> for your service.
--
-- For more information about service-linked roles, see <https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html#iam-term-service-linked-role Roles terms and concepts: AWS service-linked role> in the /IAM User Guide/ .
module Network.AWS.IAM.DeleteServiceLinkedRole
  ( -- * Creating a Request
    deleteServiceLinkedRole,
    DeleteServiceLinkedRole,

    -- * Request Lenses
    dslrRoleName,

    -- * Destructuring the Response
    deleteServiceLinkedRoleResponse,
    DeleteServiceLinkedRoleResponse,

    -- * Response Lenses
    dslrrrsResponseStatus,
    dslrrrsDeletionTaskId,
  )
where

import Network.AWS.IAM.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'deleteServiceLinkedRole' smart constructor.
newtype DeleteServiceLinkedRole = DeleteServiceLinkedRole'
  { _dslrRoleName ::
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

-- | Creates a value of 'DeleteServiceLinkedRole' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dslrRoleName' - The name of the service-linked role to be deleted.
deleteServiceLinkedRole ::
  -- | 'dslrRoleName'
  Text ->
  DeleteServiceLinkedRole
deleteServiceLinkedRole pRoleName_ =
  DeleteServiceLinkedRole'
    { _dslrRoleName =
        pRoleName_
    }

-- | The name of the service-linked role to be deleted.
dslrRoleName :: Lens' DeleteServiceLinkedRole Text
dslrRoleName = lens _dslrRoleName (\s a -> s {_dslrRoleName = a})

instance AWSRequest DeleteServiceLinkedRole where
  type
    Rs DeleteServiceLinkedRole =
      DeleteServiceLinkedRoleResponse
  request = postQuery iam
  response =
    receiveXMLWrapper
      "DeleteServiceLinkedRoleResult"
      ( \s h x ->
          DeleteServiceLinkedRoleResponse'
            <$> (pure (fromEnum s)) <*> (x .@ "DeletionTaskId")
      )

instance Hashable DeleteServiceLinkedRole

instance NFData DeleteServiceLinkedRole

instance ToHeaders DeleteServiceLinkedRole where
  toHeaders = const mempty

instance ToPath DeleteServiceLinkedRole where
  toPath = const "/"

instance ToQuery DeleteServiceLinkedRole where
  toQuery DeleteServiceLinkedRole' {..} =
    mconcat
      [ "Action"
          =: ("DeleteServiceLinkedRole" :: ByteString),
        "Version" =: ("2010-05-08" :: ByteString),
        "RoleName" =: _dslrRoleName
      ]

-- | /See:/ 'deleteServiceLinkedRoleResponse' smart constructor.
data DeleteServiceLinkedRoleResponse = DeleteServiceLinkedRoleResponse'
  { _dslrrrsResponseStatus ::
      !Int,
    _dslrrrsDeletionTaskId ::
      !Text
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'DeleteServiceLinkedRoleResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dslrrrsResponseStatus' - -- | The response status code.
--
-- * 'dslrrrsDeletionTaskId' - The deletion task identifier that you can use to check the status of the deletion. This identifier is returned in the format @task/aws-service-role/<service-principal-name>/<role-name>/<task-uuid>@ .
deleteServiceLinkedRoleResponse ::
  -- | 'dslrrrsResponseStatus'
  Int ->
  -- | 'dslrrrsDeletionTaskId'
  Text ->
  DeleteServiceLinkedRoleResponse
deleteServiceLinkedRoleResponse
  pResponseStatus_
  pDeletionTaskId_ =
    DeleteServiceLinkedRoleResponse'
      { _dslrrrsResponseStatus =
          pResponseStatus_,
        _dslrrrsDeletionTaskId = pDeletionTaskId_
      }

-- | -- | The response status code.
dslrrrsResponseStatus :: Lens' DeleteServiceLinkedRoleResponse Int
dslrrrsResponseStatus = lens _dslrrrsResponseStatus (\s a -> s {_dslrrrsResponseStatus = a})

-- | The deletion task identifier that you can use to check the status of the deletion. This identifier is returned in the format @task/aws-service-role/<service-principal-name>/<role-name>/<task-uuid>@ .
dslrrrsDeletionTaskId :: Lens' DeleteServiceLinkedRoleResponse Text
dslrrrsDeletionTaskId = lens _dslrrrsDeletionTaskId (\s a -> s {_dslrrrsDeletionTaskId = a})

instance NFData DeleteServiceLinkedRoleResponse
