{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.OpsWorks.DeregisterInstance
-- Copyright   : (c) 2013-2015 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- | Deregister a registered Amazon EC2 or on-premises instance. This action
-- removes the instance from the stack and returns it to your control. This
-- action can not be used with instances that were created with AWS
-- OpsWorks.
--
-- __Required Permissions__: To use this action, an IAM user must have a
-- Manage permissions level for the stack or an attached policy that
-- explicitly grants permissions. For more information on user permissions,
-- see
-- <http://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html Managing User Permissions>.
--
-- <http://docs.aws.amazon.com/opsworks/latest/APIReference/API_DeregisterInstance.html>
module Network.AWS.OpsWorks.DeregisterInstance
    (
    -- * Request
      DeregisterInstance
    -- ** Request constructor
    , deregisterInstance
    -- ** Request lenses
    , derInstanceId

    -- * Response
    , DeregisterInstanceResponse
    -- ** Response constructor
    , deregisterInstanceResponse
    ) where

import Network.AWS.OpsWorks.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'deregisterInstance' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'derInstanceId'
newtype DeregisterInstance = DeregisterInstance'{_derInstanceId :: Text} deriving (Eq, Read, Show)

-- | 'DeregisterInstance' smart constructor.
deregisterInstance :: Text -> DeregisterInstance
deregisterInstance pInstanceId = DeregisterInstance'{_derInstanceId = pInstanceId};

-- | The instance ID.
derInstanceId :: Lens' DeregisterInstance Text
derInstanceId = lens _derInstanceId (\ s a -> s{_derInstanceId = a});

instance AWSRequest DeregisterInstance where
        type Sv DeregisterInstance = OpsWorks
        type Rs DeregisterInstance =
             DeregisterInstanceResponse
        request = postJSON
        response = receiveNull DeregisterInstanceResponse'

instance ToHeaders DeregisterInstance where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("OpsWorks_20130218.DeregisterInstance" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DeregisterInstance where
        toJSON DeregisterInstance'{..}
          = object ["InstanceId" .= _derInstanceId]

instance ToPath DeregisterInstance where
        toPath = const "/"

instance ToQuery DeregisterInstance where
        toQuery = const mempty

-- | /See:/ 'deregisterInstanceResponse' smart constructor.
data DeregisterInstanceResponse = DeregisterInstanceResponse' deriving (Eq, Read, Show)

-- | 'DeregisterInstanceResponse' smart constructor.
deregisterInstanceResponse :: DeregisterInstanceResponse
deregisterInstanceResponse = DeregisterInstanceResponse';
