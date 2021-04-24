{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Batch.Types.JobSummary
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.Batch.Types.JobSummary where

import Network.AWS.Batch.Types.ArrayPropertiesSummary
import Network.AWS.Batch.Types.ContainerSummary
import Network.AWS.Batch.Types.JobStatus
import Network.AWS.Batch.Types.NodePropertiesSummary
import Network.AWS.Lens
import Network.AWS.Prelude

-- | An object representing summary details of a job.
--
--
--
-- /See:/ 'jobSummary' smart constructor.
data JobSummary = JobSummary'
  { _jsContainer ::
      !(Maybe ContainerSummary),
    _jsStartedAt :: !(Maybe Integer),
    _jsStatus :: !(Maybe JobStatus),
    _jsArrayProperties ::
      !(Maybe ArrayPropertiesSummary),
    _jsCreatedAt :: !(Maybe Integer),
    _jsJobARN :: !(Maybe Text),
    _jsStoppedAt :: !(Maybe Integer),
    _jsNodeProperties ::
      !(Maybe NodePropertiesSummary),
    _jsStatusReason :: !(Maybe Text),
    _jsJobId :: !Text,
    _jsJobName :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'JobSummary' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'jsContainer' - An object representing the details of the container that's associated with the job.
--
-- * 'jsStartedAt' - The Unix timestamp for when the job was started (when the job transitioned from the @STARTING@ state to the @RUNNING@ state).
--
-- * 'jsStatus' - The current status for the job.
--
-- * 'jsArrayProperties' - The array properties of the job, if it is an array job.
--
-- * 'jsCreatedAt' - The Unix timestamp for when the job was created. For non-array jobs and parent array jobs, this is when the job entered the @SUBMITTED@ state (at the time 'SubmitJob' was called). For array child jobs, this is when the child job was spawned by its parent and entered the @PENDING@ state.
--
-- * 'jsJobARN' - The Amazon Resource Name (ARN) of the job.
--
-- * 'jsStoppedAt' - The Unix timestamp for when the job was stopped (when the job transitioned from the @RUNNING@ state to a terminal state, such as @SUCCEEDED@ or @FAILED@ ).
--
-- * 'jsNodeProperties' - The node properties for a single node in a job summary list.
--
-- * 'jsStatusReason' - A short, human-readable string to provide additional details about the current status of the job.
--
-- * 'jsJobId' - The ID of the job.
--
-- * 'jsJobName' - The name of the job.
jobSummary ::
  -- | 'jsJobId'
  Text ->
  -- | 'jsJobName'
  Text ->
  JobSummary
jobSummary pJobId_ pJobName_ =
  JobSummary'
    { _jsContainer = Nothing,
      _jsStartedAt = Nothing,
      _jsStatus = Nothing,
      _jsArrayProperties = Nothing,
      _jsCreatedAt = Nothing,
      _jsJobARN = Nothing,
      _jsStoppedAt = Nothing,
      _jsNodeProperties = Nothing,
      _jsStatusReason = Nothing,
      _jsJobId = pJobId_,
      _jsJobName = pJobName_
    }

-- | An object representing the details of the container that's associated with the job.
jsContainer :: Lens' JobSummary (Maybe ContainerSummary)
jsContainer = lens _jsContainer (\s a -> s {_jsContainer = a})

-- | The Unix timestamp for when the job was started (when the job transitioned from the @STARTING@ state to the @RUNNING@ state).
jsStartedAt :: Lens' JobSummary (Maybe Integer)
jsStartedAt = lens _jsStartedAt (\s a -> s {_jsStartedAt = a})

-- | The current status for the job.
jsStatus :: Lens' JobSummary (Maybe JobStatus)
jsStatus = lens _jsStatus (\s a -> s {_jsStatus = a})

-- | The array properties of the job, if it is an array job.
jsArrayProperties :: Lens' JobSummary (Maybe ArrayPropertiesSummary)
jsArrayProperties = lens _jsArrayProperties (\s a -> s {_jsArrayProperties = a})

-- | The Unix timestamp for when the job was created. For non-array jobs and parent array jobs, this is when the job entered the @SUBMITTED@ state (at the time 'SubmitJob' was called). For array child jobs, this is when the child job was spawned by its parent and entered the @PENDING@ state.
jsCreatedAt :: Lens' JobSummary (Maybe Integer)
jsCreatedAt = lens _jsCreatedAt (\s a -> s {_jsCreatedAt = a})

-- | The Amazon Resource Name (ARN) of the job.
jsJobARN :: Lens' JobSummary (Maybe Text)
jsJobARN = lens _jsJobARN (\s a -> s {_jsJobARN = a})

-- | The Unix timestamp for when the job was stopped (when the job transitioned from the @RUNNING@ state to a terminal state, such as @SUCCEEDED@ or @FAILED@ ).
jsStoppedAt :: Lens' JobSummary (Maybe Integer)
jsStoppedAt = lens _jsStoppedAt (\s a -> s {_jsStoppedAt = a})

-- | The node properties for a single node in a job summary list.
jsNodeProperties :: Lens' JobSummary (Maybe NodePropertiesSummary)
jsNodeProperties = lens _jsNodeProperties (\s a -> s {_jsNodeProperties = a})

-- | A short, human-readable string to provide additional details about the current status of the job.
jsStatusReason :: Lens' JobSummary (Maybe Text)
jsStatusReason = lens _jsStatusReason (\s a -> s {_jsStatusReason = a})

-- | The ID of the job.
jsJobId :: Lens' JobSummary Text
jsJobId = lens _jsJobId (\s a -> s {_jsJobId = a})

-- | The name of the job.
jsJobName :: Lens' JobSummary Text
jsJobName = lens _jsJobName (\s a -> s {_jsJobName = a})

instance FromJSON JobSummary where
  parseJSON =
    withObject
      "JobSummary"
      ( \x ->
          JobSummary'
            <$> (x .:? "container")
            <*> (x .:? "startedAt")
            <*> (x .:? "status")
            <*> (x .:? "arrayProperties")
            <*> (x .:? "createdAt")
            <*> (x .:? "jobArn")
            <*> (x .:? "stoppedAt")
            <*> (x .:? "nodeProperties")
            <*> (x .:? "statusReason")
            <*> (x .: "jobId")
            <*> (x .: "jobName")
      )

instance Hashable JobSummary

instance NFData JobSummary
