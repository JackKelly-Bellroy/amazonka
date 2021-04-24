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
-- Module      : Network.AWS.ImportExport.UpdateJob
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- You use this operation to change the parameters specified in the original manifest file by supplying a new manifest file. The manifest file attached to this request replaces the original manifest file. You can only use the operation after a CreateJob request but before the data transfer starts and you can only use it on jobs you own.
module Network.AWS.ImportExport.UpdateJob
  ( -- * Creating a Request
    updateJob,
    UpdateJob,

    -- * Request Lenses
    ujAPIVersion,
    ujJobId,
    ujManifest,
    ujJobType,
    ujValidateOnly,

    -- * Destructuring the Response
    updateJobResponse,
    UpdateJobResponse,

    -- * Response Lenses
    ujrrsWarningMessage,
    ujrrsArtifactList,
    ujrrsSuccess,
    ujrrsResponseStatus,
  )
where

import Network.AWS.ImportExport.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | Input structure for the UpateJob operation.
--
-- /See:/ 'updateJob' smart constructor.
data UpdateJob = UpdateJob'
  { _ujAPIVersion ::
      !(Maybe Text),
    _ujJobId :: !Text,
    _ujManifest :: !Text,
    _ujJobType :: !JobType,
    _ujValidateOnly :: !Bool
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'UpdateJob' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ujAPIVersion' - Undocumented member.
--
-- * 'ujJobId' - Undocumented member.
--
-- * 'ujManifest' - Undocumented member.
--
-- * 'ujJobType' - Undocumented member.
--
-- * 'ujValidateOnly' - Undocumented member.
updateJob ::
  -- | 'ujJobId'
  Text ->
  -- | 'ujManifest'
  Text ->
  -- | 'ujJobType'
  JobType ->
  -- | 'ujValidateOnly'
  Bool ->
  UpdateJob
updateJob pJobId_ pManifest_ pJobType_ pValidateOnly_ =
  UpdateJob'
    { _ujAPIVersion = Nothing,
      _ujJobId = pJobId_,
      _ujManifest = pManifest_,
      _ujJobType = pJobType_,
      _ujValidateOnly = pValidateOnly_
    }

-- | Undocumented member.
ujAPIVersion :: Lens' UpdateJob (Maybe Text)
ujAPIVersion = lens _ujAPIVersion (\s a -> s {_ujAPIVersion = a})

-- | Undocumented member.
ujJobId :: Lens' UpdateJob Text
ujJobId = lens _ujJobId (\s a -> s {_ujJobId = a})

-- | Undocumented member.
ujManifest :: Lens' UpdateJob Text
ujManifest = lens _ujManifest (\s a -> s {_ujManifest = a})

-- | Undocumented member.
ujJobType :: Lens' UpdateJob JobType
ujJobType = lens _ujJobType (\s a -> s {_ujJobType = a})

-- | Undocumented member.
ujValidateOnly :: Lens' UpdateJob Bool
ujValidateOnly = lens _ujValidateOnly (\s a -> s {_ujValidateOnly = a})

instance AWSRequest UpdateJob where
  type Rs UpdateJob = UpdateJobResponse
  request = postQuery importExport
  response =
    receiveXMLWrapper
      "UpdateJobResult"
      ( \s h x ->
          UpdateJobResponse'
            <$> (x .@? "WarningMessage")
            <*> ( x .@? "ArtifactList" .!@ mempty
                    >>= may (parseXMLList "member")
                )
            <*> (x .@? "Success")
            <*> (pure (fromEnum s))
      )

instance Hashable UpdateJob

instance NFData UpdateJob

instance ToHeaders UpdateJob where
  toHeaders = const mempty

instance ToPath UpdateJob where
  toPath = const "/"

instance ToQuery UpdateJob where
  toQuery UpdateJob' {..} =
    mconcat
      [ "Operation=UpdateJob",
        "Action" =: ("UpdateJob" :: ByteString),
        "Version" =: ("2010-06-01" :: ByteString),
        "APIVersion" =: _ujAPIVersion,
        "JobId" =: _ujJobId,
        "Manifest" =: _ujManifest,
        "JobType" =: _ujJobType,
        "ValidateOnly" =: _ujValidateOnly
      ]

-- | Output structure for the UpateJob operation.
--
-- /See:/ 'updateJobResponse' smart constructor.
data UpdateJobResponse = UpdateJobResponse'
  { _ujrrsWarningMessage ::
      !(Maybe Text),
    _ujrrsArtifactList ::
      !(Maybe [Artifact]),
    _ujrrsSuccess :: !(Maybe Bool),
    _ujrrsResponseStatus :: !Int
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'UpdateJobResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ujrrsWarningMessage' - Undocumented member.
--
-- * 'ujrrsArtifactList' - Undocumented member.
--
-- * 'ujrrsSuccess' - Undocumented member.
--
-- * 'ujrrsResponseStatus' - -- | The response status code.
updateJobResponse ::
  -- | 'ujrrsResponseStatus'
  Int ->
  UpdateJobResponse
updateJobResponse pResponseStatus_ =
  UpdateJobResponse'
    { _ujrrsWarningMessage = Nothing,
      _ujrrsArtifactList = Nothing,
      _ujrrsSuccess = Nothing,
      _ujrrsResponseStatus = pResponseStatus_
    }

-- | Undocumented member.
ujrrsWarningMessage :: Lens' UpdateJobResponse (Maybe Text)
ujrrsWarningMessage = lens _ujrrsWarningMessage (\s a -> s {_ujrrsWarningMessage = a})

-- | Undocumented member.
ujrrsArtifactList :: Lens' UpdateJobResponse [Artifact]
ujrrsArtifactList = lens _ujrrsArtifactList (\s a -> s {_ujrrsArtifactList = a}) . _Default . _Coerce

-- | Undocumented member.
ujrrsSuccess :: Lens' UpdateJobResponse (Maybe Bool)
ujrrsSuccess = lens _ujrrsSuccess (\s a -> s {_ujrrsSuccess = a})

-- | -- | The response status code.
ujrrsResponseStatus :: Lens' UpdateJobResponse Int
ujrrsResponseStatus = lens _ujrrsResponseStatus (\s a -> s {_ujrrsResponseStatus = a})

instance NFData UpdateJobResponse
