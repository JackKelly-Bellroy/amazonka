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
-- Module      : Network.AWS.IoT.DeleteMitigationAction
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes a defined mitigation action from your AWS account.
module Network.AWS.IoT.DeleteMitigationAction
  ( -- * Creating a Request
    deleteMitigationAction,
    DeleteMitigationAction,

    -- * Request Lenses
    dmaActionName,

    -- * Destructuring the Response
    deleteMitigationActionResponse,
    DeleteMitigationActionResponse,

    -- * Response Lenses
    dmarrsResponseStatus,
  )
where

import Network.AWS.IoT.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'deleteMitigationAction' smart constructor.
newtype DeleteMitigationAction = DeleteMitigationAction'
  { _dmaActionName ::
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

-- | Creates a value of 'DeleteMitigationAction' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dmaActionName' - The name of the mitigation action that you want to delete.
deleteMitigationAction ::
  -- | 'dmaActionName'
  Text ->
  DeleteMitigationAction
deleteMitigationAction pActionName_ =
  DeleteMitigationAction'
    { _dmaActionName =
        pActionName_
    }

-- | The name of the mitigation action that you want to delete.
dmaActionName :: Lens' DeleteMitigationAction Text
dmaActionName = lens _dmaActionName (\s a -> s {_dmaActionName = a})

instance AWSRequest DeleteMitigationAction where
  type
    Rs DeleteMitigationAction =
      DeleteMitigationActionResponse
  request = delete ioT
  response =
    receiveEmpty
      ( \s h x ->
          DeleteMitigationActionResponse'
            <$> (pure (fromEnum s))
      )

instance Hashable DeleteMitigationAction

instance NFData DeleteMitigationAction

instance ToHeaders DeleteMitigationAction where
  toHeaders = const mempty

instance ToPath DeleteMitigationAction where
  toPath DeleteMitigationAction' {..} =
    mconcat
      ["/mitigationactions/actions/", toBS _dmaActionName]

instance ToQuery DeleteMitigationAction where
  toQuery = const mempty

-- | /See:/ 'deleteMitigationActionResponse' smart constructor.
newtype DeleteMitigationActionResponse = DeleteMitigationActionResponse'
  { _dmarrsResponseStatus ::
      Int
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'DeleteMitigationActionResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dmarrsResponseStatus' - -- | The response status code.
deleteMitigationActionResponse ::
  -- | 'dmarrsResponseStatus'
  Int ->
  DeleteMitigationActionResponse
deleteMitigationActionResponse pResponseStatus_ =
  DeleteMitigationActionResponse'
    { _dmarrsResponseStatus =
        pResponseStatus_
    }

-- | -- | The response status code.
dmarrsResponseStatus :: Lens' DeleteMitigationActionResponse Int
dmarrsResponseStatus = lens _dmarrsResponseStatus (\s a -> s {_dmarrsResponseStatus = a})

instance NFData DeleteMitigationActionResponse
