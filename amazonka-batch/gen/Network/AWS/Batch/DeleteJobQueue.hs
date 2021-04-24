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
-- Module      : Network.AWS.Batch.DeleteJobQueue
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes the specified job queue. You must first disable submissions for a queue with the 'UpdateJobQueue' operation. All jobs in the queue are eventually terminated when you delete a job queue. The jobs are terminated at a rate of about 16 jobs each second.
--
--
-- It's not necessary to disassociate compute environments from a queue before submitting a @DeleteJobQueue@ request.
module Network.AWS.Batch.DeleteJobQueue
  ( -- * Creating a Request
    deleteJobQueue,
    DeleteJobQueue,

    -- * Request Lenses
    djqJobQueue,

    -- * Destructuring the Response
    deleteJobQueueResponse,
    DeleteJobQueueResponse,

    -- * Response Lenses
    delrsResponseStatus,
  )
where

import Network.AWS.Batch.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | Contains the parameters for @DeleteJobQueue@ .
--
--
--
-- /See:/ 'deleteJobQueue' smart constructor.
newtype DeleteJobQueue = DeleteJobQueue'
  { _djqJobQueue ::
      Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'DeleteJobQueue' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'djqJobQueue' - The short name or full Amazon Resource Name (ARN) of the queue to delete.
deleteJobQueue ::
  -- | 'djqJobQueue'
  Text ->
  DeleteJobQueue
deleteJobQueue pJobQueue_ =
  DeleteJobQueue' {_djqJobQueue = pJobQueue_}

-- | The short name or full Amazon Resource Name (ARN) of the queue to delete.
djqJobQueue :: Lens' DeleteJobQueue Text
djqJobQueue = lens _djqJobQueue (\s a -> s {_djqJobQueue = a})

instance AWSRequest DeleteJobQueue where
  type Rs DeleteJobQueue = DeleteJobQueueResponse
  request = postJSON batch
  response =
    receiveEmpty
      ( \s h x ->
          DeleteJobQueueResponse' <$> (pure (fromEnum s))
      )

instance Hashable DeleteJobQueue

instance NFData DeleteJobQueue

instance ToHeaders DeleteJobQueue where
  toHeaders =
    const
      ( mconcat
          [ "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON DeleteJobQueue where
  toJSON DeleteJobQueue' {..} =
    object
      (catMaybes [Just ("jobQueue" .= _djqJobQueue)])

instance ToPath DeleteJobQueue where
  toPath = const "/v1/deletejobqueue"

instance ToQuery DeleteJobQueue where
  toQuery = const mempty

-- | /See:/ 'deleteJobQueueResponse' smart constructor.
newtype DeleteJobQueueResponse = DeleteJobQueueResponse'
  { _delrsResponseStatus ::
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

-- | Creates a value of 'DeleteJobQueueResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'delrsResponseStatus' - -- | The response status code.
deleteJobQueueResponse ::
  -- | 'delrsResponseStatus'
  Int ->
  DeleteJobQueueResponse
deleteJobQueueResponse pResponseStatus_ =
  DeleteJobQueueResponse'
    { _delrsResponseStatus =
        pResponseStatus_
    }

-- | -- | The response status code.
delrsResponseStatus :: Lens' DeleteJobQueueResponse Int
delrsResponseStatus = lens _delrsResponseStatus (\s a -> s {_delrsResponseStatus = a})

instance NFData DeleteJobQueueResponse
