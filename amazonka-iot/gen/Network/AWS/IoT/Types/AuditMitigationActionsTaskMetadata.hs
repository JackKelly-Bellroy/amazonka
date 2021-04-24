{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.IoT.Types.AuditMitigationActionsTaskMetadata
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.IoT.Types.AuditMitigationActionsTaskMetadata where

import Network.AWS.IoT.Types.AuditMitigationActionsTaskStatus
import Network.AWS.Lens
import Network.AWS.Prelude

-- | Information about an audit mitigation actions task that is returned by @ListAuditMitigationActionsTasks@ .
--
--
--
-- /See:/ 'auditMitigationActionsTaskMetadata' smart constructor.
data AuditMitigationActionsTaskMetadata = AuditMitigationActionsTaskMetadata'
  { _amatmTaskId ::
      !( Maybe
           Text
       ),
    _amatmStartTime ::
      !( Maybe
           POSIX
       ),
    _amatmTaskStatus ::
      !( Maybe
           AuditMitigationActionsTaskStatus
       )
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'AuditMitigationActionsTaskMetadata' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'amatmTaskId' - The unique identifier for the task.
--
-- * 'amatmStartTime' - The time at which the audit mitigation actions task was started.
--
-- * 'amatmTaskStatus' - The current state of the audit mitigation actions task.
auditMitigationActionsTaskMetadata ::
  AuditMitigationActionsTaskMetadata
auditMitigationActionsTaskMetadata =
  AuditMitigationActionsTaskMetadata'
    { _amatmTaskId =
        Nothing,
      _amatmStartTime = Nothing,
      _amatmTaskStatus = Nothing
    }

-- | The unique identifier for the task.
amatmTaskId :: Lens' AuditMitigationActionsTaskMetadata (Maybe Text)
amatmTaskId = lens _amatmTaskId (\s a -> s {_amatmTaskId = a})

-- | The time at which the audit mitigation actions task was started.
amatmStartTime :: Lens' AuditMitigationActionsTaskMetadata (Maybe UTCTime)
amatmStartTime = lens _amatmStartTime (\s a -> s {_amatmStartTime = a}) . mapping _Time

-- | The current state of the audit mitigation actions task.
amatmTaskStatus :: Lens' AuditMitigationActionsTaskMetadata (Maybe AuditMitigationActionsTaskStatus)
amatmTaskStatus = lens _amatmTaskStatus (\s a -> s {_amatmTaskStatus = a})

instance FromJSON AuditMitigationActionsTaskMetadata where
  parseJSON =
    withObject
      "AuditMitigationActionsTaskMetadata"
      ( \x ->
          AuditMitigationActionsTaskMetadata'
            <$> (x .:? "taskId")
            <*> (x .:? "startTime")
            <*> (x .:? "taskStatus")
      )

instance Hashable AuditMitigationActionsTaskMetadata

instance NFData AuditMitigationActionsTaskMetadata
