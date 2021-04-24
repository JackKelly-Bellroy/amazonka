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
-- Module      : Network.AWS.AlexaBusiness.CreateConferenceProvider
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Adds a new conference provider under the user's AWS account.
module Network.AWS.AlexaBusiness.CreateConferenceProvider
  ( -- * Creating a Request
    createConferenceProvider,
    CreateConferenceProvider,

    -- * Request Lenses
    ccpIPDialIn,
    ccpTags,
    ccpPSTNDialIn,
    ccpClientRequestToken,
    ccpConferenceProviderName,
    ccpConferenceProviderType,
    ccpMeetingSetting,

    -- * Destructuring the Response
    createConferenceProviderResponse,
    CreateConferenceProviderResponse,

    -- * Response Lenses
    ccprrsConferenceProviderARN,
    ccprrsResponseStatus,
  )
where

import Network.AWS.AlexaBusiness.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'createConferenceProvider' smart constructor.
data CreateConferenceProvider = CreateConferenceProvider'
  { _ccpIPDialIn ::
      !(Maybe IPDialIn),
    _ccpTags ::
      !(Maybe [Tag]),
    _ccpPSTNDialIn ::
      !(Maybe PSTNDialIn),
    _ccpClientRequestToken ::
      !(Maybe Text),
    _ccpConferenceProviderName ::
      !Text,
    _ccpConferenceProviderType ::
      !ConferenceProviderType,
    _ccpMeetingSetting ::
      !MeetingSetting
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'CreateConferenceProvider' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ccpIPDialIn' - The IP endpoint and protocol for calling.
--
-- * 'ccpTags' - The tags to be added to the specified resource. Do not provide system tags.
--
-- * 'ccpPSTNDialIn' - The information for PSTN conferencing.
--
-- * 'ccpClientRequestToken' - The request token of the client.
--
-- * 'ccpConferenceProviderName' - The name of the conference provider.
--
-- * 'ccpConferenceProviderType' - Represents a type within a list of predefined types.
--
-- * 'ccpMeetingSetting' - The meeting settings for the conference provider.
createConferenceProvider ::
  -- | 'ccpConferenceProviderName'
  Text ->
  -- | 'ccpConferenceProviderType'
  ConferenceProviderType ->
  -- | 'ccpMeetingSetting'
  MeetingSetting ->
  CreateConferenceProvider
createConferenceProvider
  pConferenceProviderName_
  pConferenceProviderType_
  pMeetingSetting_ =
    CreateConferenceProvider'
      { _ccpIPDialIn = Nothing,
        _ccpTags = Nothing,
        _ccpPSTNDialIn = Nothing,
        _ccpClientRequestToken = Nothing,
        _ccpConferenceProviderName =
          pConferenceProviderName_,
        _ccpConferenceProviderType =
          pConferenceProviderType_,
        _ccpMeetingSetting = pMeetingSetting_
      }

-- | The IP endpoint and protocol for calling.
ccpIPDialIn :: Lens' CreateConferenceProvider (Maybe IPDialIn)
ccpIPDialIn = lens _ccpIPDialIn (\s a -> s {_ccpIPDialIn = a})

-- | The tags to be added to the specified resource. Do not provide system tags.
ccpTags :: Lens' CreateConferenceProvider [Tag]
ccpTags = lens _ccpTags (\s a -> s {_ccpTags = a}) . _Default . _Coerce

-- | The information for PSTN conferencing.
ccpPSTNDialIn :: Lens' CreateConferenceProvider (Maybe PSTNDialIn)
ccpPSTNDialIn = lens _ccpPSTNDialIn (\s a -> s {_ccpPSTNDialIn = a})

-- | The request token of the client.
ccpClientRequestToken :: Lens' CreateConferenceProvider (Maybe Text)
ccpClientRequestToken = lens _ccpClientRequestToken (\s a -> s {_ccpClientRequestToken = a})

-- | The name of the conference provider.
ccpConferenceProviderName :: Lens' CreateConferenceProvider Text
ccpConferenceProviderName = lens _ccpConferenceProviderName (\s a -> s {_ccpConferenceProviderName = a})

-- | Represents a type within a list of predefined types.
ccpConferenceProviderType :: Lens' CreateConferenceProvider ConferenceProviderType
ccpConferenceProviderType = lens _ccpConferenceProviderType (\s a -> s {_ccpConferenceProviderType = a})

-- | The meeting settings for the conference provider.
ccpMeetingSetting :: Lens' CreateConferenceProvider MeetingSetting
ccpMeetingSetting = lens _ccpMeetingSetting (\s a -> s {_ccpMeetingSetting = a})

instance AWSRequest CreateConferenceProvider where
  type
    Rs CreateConferenceProvider =
      CreateConferenceProviderResponse
  request = postJSON alexaBusiness
  response =
    receiveJSON
      ( \s h x ->
          CreateConferenceProviderResponse'
            <$> (x .?> "ConferenceProviderArn")
            <*> (pure (fromEnum s))
      )

instance Hashable CreateConferenceProvider

instance NFData CreateConferenceProvider

instance ToHeaders CreateConferenceProvider where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "AlexaForBusiness.CreateConferenceProvider" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON CreateConferenceProvider where
  toJSON CreateConferenceProvider' {..} =
    object
      ( catMaybes
          [ ("IPDialIn" .=) <$> _ccpIPDialIn,
            ("Tags" .=) <$> _ccpTags,
            ("PSTNDialIn" .=) <$> _ccpPSTNDialIn,
            ("ClientRequestToken" .=) <$> _ccpClientRequestToken,
            Just
              ( "ConferenceProviderName"
                  .= _ccpConferenceProviderName
              ),
            Just
              ( "ConferenceProviderType"
                  .= _ccpConferenceProviderType
              ),
            Just ("MeetingSetting" .= _ccpMeetingSetting)
          ]
      )

instance ToPath CreateConferenceProvider where
  toPath = const "/"

instance ToQuery CreateConferenceProvider where
  toQuery = const mempty

-- | /See:/ 'createConferenceProviderResponse' smart constructor.
data CreateConferenceProviderResponse = CreateConferenceProviderResponse'
  { _ccprrsConferenceProviderARN ::
      !( Maybe
           Text
       ),
    _ccprrsResponseStatus ::
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

-- | Creates a value of 'CreateConferenceProviderResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ccprrsConferenceProviderARN' - The ARN of the newly-created conference provider.
--
-- * 'ccprrsResponseStatus' - -- | The response status code.
createConferenceProviderResponse ::
  -- | 'ccprrsResponseStatus'
  Int ->
  CreateConferenceProviderResponse
createConferenceProviderResponse pResponseStatus_ =
  CreateConferenceProviderResponse'
    { _ccprrsConferenceProviderARN =
        Nothing,
      _ccprrsResponseStatus = pResponseStatus_
    }

-- | The ARN of the newly-created conference provider.
ccprrsConferenceProviderARN :: Lens' CreateConferenceProviderResponse (Maybe Text)
ccprrsConferenceProviderARN = lens _ccprrsConferenceProviderARN (\s a -> s {_ccprrsConferenceProviderARN = a})

-- | -- | The response status code.
ccprrsResponseStatus :: Lens' CreateConferenceProviderResponse Int
ccprrsResponseStatus = lens _ccprrsResponseStatus (\s a -> s {_ccprrsResponseStatus = a})

instance NFData CreateConferenceProviderResponse
