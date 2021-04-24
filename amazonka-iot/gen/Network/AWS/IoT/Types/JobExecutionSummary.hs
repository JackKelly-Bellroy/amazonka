{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.IoT.Types.JobExecutionSummary
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.IoT.Types.JobExecutionSummary where

import Network.AWS.IoT.Types.JobExecutionStatus
import Network.AWS.Lens
import Network.AWS.Prelude

-- | The job execution summary.
--
--
--
-- /See:/ 'jobExecutionSummary' smart constructor.
data JobExecutionSummary = JobExecutionSummary'
  { _jesStartedAt ::
      !(Maybe POSIX),
    _jesStatus ::
      !(Maybe JobExecutionStatus),
    _jesQueuedAt :: !(Maybe POSIX),
    _jesExecutionNumber ::
      !(Maybe Integer),
    _jesLastUpdatedAt ::
      !(Maybe POSIX)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'JobExecutionSummary' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'jesStartedAt' - The time, in seconds since the epoch, when the job execution started.
--
-- * 'jesStatus' - The status of the job execution.
--
-- * 'jesQueuedAt' - The time, in seconds since the epoch, when the job execution was queued.
--
-- * 'jesExecutionNumber' - A string (consisting of the digits "0" through "9") which identifies this particular job execution on this particular device. It can be used later in commands which return or update job execution information.
--
-- * 'jesLastUpdatedAt' - The time, in seconds since the epoch, when the job execution was last updated.
jobExecutionSummary ::
  JobExecutionSummary
jobExecutionSummary =
  JobExecutionSummary'
    { _jesStartedAt = Nothing,
      _jesStatus = Nothing,
      _jesQueuedAt = Nothing,
      _jesExecutionNumber = Nothing,
      _jesLastUpdatedAt = Nothing
    }

-- | The time, in seconds since the epoch, when the job execution started.
jesStartedAt :: Lens' JobExecutionSummary (Maybe UTCTime)
jesStartedAt = lens _jesStartedAt (\s a -> s {_jesStartedAt = a}) . mapping _Time

-- | The status of the job execution.
jesStatus :: Lens' JobExecutionSummary (Maybe JobExecutionStatus)
jesStatus = lens _jesStatus (\s a -> s {_jesStatus = a})

-- | The time, in seconds since the epoch, when the job execution was queued.
jesQueuedAt :: Lens' JobExecutionSummary (Maybe UTCTime)
jesQueuedAt = lens _jesQueuedAt (\s a -> s {_jesQueuedAt = a}) . mapping _Time

-- | A string (consisting of the digits "0" through "9") which identifies this particular job execution on this particular device. It can be used later in commands which return or update job execution information.
jesExecutionNumber :: Lens' JobExecutionSummary (Maybe Integer)
jesExecutionNumber = lens _jesExecutionNumber (\s a -> s {_jesExecutionNumber = a})

-- | The time, in seconds since the epoch, when the job execution was last updated.
jesLastUpdatedAt :: Lens' JobExecutionSummary (Maybe UTCTime)
jesLastUpdatedAt = lens _jesLastUpdatedAt (\s a -> s {_jesLastUpdatedAt = a}) . mapping _Time

instance FromJSON JobExecutionSummary where
  parseJSON =
    withObject
      "JobExecutionSummary"
      ( \x ->
          JobExecutionSummary'
            <$> (x .:? "startedAt")
            <*> (x .:? "status")
            <*> (x .:? "queuedAt")
            <*> (x .:? "executionNumber")
            <*> (x .:? "lastUpdatedAt")
      )

instance Hashable JobExecutionSummary

instance NFData JobExecutionSummary
