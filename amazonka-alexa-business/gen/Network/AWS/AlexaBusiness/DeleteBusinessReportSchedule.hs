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
-- Module      : Network.AWS.AlexaBusiness.DeleteBusinessReportSchedule
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes the recurring report delivery schedule with the specified schedule ARN.
module Network.AWS.AlexaBusiness.DeleteBusinessReportSchedule
  ( -- * Creating a Request
    deleteBusinessReportSchedule,
    DeleteBusinessReportSchedule,

    -- * Request Lenses
    dbrsScheduleARN,

    -- * Destructuring the Response
    deleteBusinessReportScheduleResponse,
    DeleteBusinessReportScheduleResponse,

    -- * Response Lenses
    dbrsrrsResponseStatus,
  )
where

import Network.AWS.AlexaBusiness.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'deleteBusinessReportSchedule' smart constructor.
newtype DeleteBusinessReportSchedule = DeleteBusinessReportSchedule'
  { _dbrsScheduleARN ::
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

-- | Creates a value of 'DeleteBusinessReportSchedule' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dbrsScheduleARN' - The ARN of the business report schedule.
deleteBusinessReportSchedule ::
  -- | 'dbrsScheduleARN'
  Text ->
  DeleteBusinessReportSchedule
deleteBusinessReportSchedule pScheduleARN_ =
  DeleteBusinessReportSchedule'
    { _dbrsScheduleARN =
        pScheduleARN_
    }

-- | The ARN of the business report schedule.
dbrsScheduleARN :: Lens' DeleteBusinessReportSchedule Text
dbrsScheduleARN = lens _dbrsScheduleARN (\s a -> s {_dbrsScheduleARN = a})

instance AWSRequest DeleteBusinessReportSchedule where
  type
    Rs DeleteBusinessReportSchedule =
      DeleteBusinessReportScheduleResponse
  request = postJSON alexaBusiness
  response =
    receiveEmpty
      ( \s h x ->
          DeleteBusinessReportScheduleResponse'
            <$> (pure (fromEnum s))
      )

instance Hashable DeleteBusinessReportSchedule

instance NFData DeleteBusinessReportSchedule

instance ToHeaders DeleteBusinessReportSchedule where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "AlexaForBusiness.DeleteBusinessReportSchedule" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON DeleteBusinessReportSchedule where
  toJSON DeleteBusinessReportSchedule' {..} =
    object
      ( catMaybes
          [Just ("ScheduleArn" .= _dbrsScheduleARN)]
      )

instance ToPath DeleteBusinessReportSchedule where
  toPath = const "/"

instance ToQuery DeleteBusinessReportSchedule where
  toQuery = const mempty

-- | /See:/ 'deleteBusinessReportScheduleResponse' smart constructor.
newtype DeleteBusinessReportScheduleResponse = DeleteBusinessReportScheduleResponse'
  { _dbrsrrsResponseStatus ::
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

-- | Creates a value of 'DeleteBusinessReportScheduleResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dbrsrrsResponseStatus' - -- | The response status code.
deleteBusinessReportScheduleResponse ::
  -- | 'dbrsrrsResponseStatus'
  Int ->
  DeleteBusinessReportScheduleResponse
deleteBusinessReportScheduleResponse pResponseStatus_ =
  DeleteBusinessReportScheduleResponse'
    { _dbrsrrsResponseStatus =
        pResponseStatus_
    }

-- | -- | The response status code.
dbrsrrsResponseStatus :: Lens' DeleteBusinessReportScheduleResponse Int
dbrsrrsResponseStatus = lens _dbrsrrsResponseStatus (\s a -> s {_dbrsrrsResponseStatus = a})

instance NFData DeleteBusinessReportScheduleResponse
