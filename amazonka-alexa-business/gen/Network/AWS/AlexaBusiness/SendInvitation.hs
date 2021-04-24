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
-- Module      : Network.AWS.AlexaBusiness.SendInvitation
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Sends an enrollment invitation email with a URL to a user. The URL is valid for 30 days or until you call this operation again, whichever comes first.
module Network.AWS.AlexaBusiness.SendInvitation
  ( -- * Creating a Request
    sendInvitation,
    SendInvitation,

    -- * Request Lenses
    siUserARN,

    -- * Destructuring the Response
    sendInvitationResponse,
    SendInvitationResponse,

    -- * Response Lenses
    sirrsResponseStatus,
  )
where

import Network.AWS.AlexaBusiness.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'sendInvitation' smart constructor.
newtype SendInvitation = SendInvitation'
  { _siUserARN ::
      Maybe Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'SendInvitation' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'siUserARN' - The ARN of the user to whom to send an invitation. Required.
sendInvitation ::
  SendInvitation
sendInvitation =
  SendInvitation' {_siUserARN = Nothing}

-- | The ARN of the user to whom to send an invitation. Required.
siUserARN :: Lens' SendInvitation (Maybe Text)
siUserARN = lens _siUserARN (\s a -> s {_siUserARN = a})

instance AWSRequest SendInvitation where
  type Rs SendInvitation = SendInvitationResponse
  request = postJSON alexaBusiness
  response =
    receiveEmpty
      ( \s h x ->
          SendInvitationResponse' <$> (pure (fromEnum s))
      )

instance Hashable SendInvitation

instance NFData SendInvitation

instance ToHeaders SendInvitation where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ("AlexaForBusiness.SendInvitation" :: ByteString),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON SendInvitation where
  toJSON SendInvitation' {..} =
    object (catMaybes [("UserArn" .=) <$> _siUserARN])

instance ToPath SendInvitation where
  toPath = const "/"

instance ToQuery SendInvitation where
  toQuery = const mempty

-- | /See:/ 'sendInvitationResponse' smart constructor.
newtype SendInvitationResponse = SendInvitationResponse'
  { _sirrsResponseStatus ::
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

-- | Creates a value of 'SendInvitationResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'sirrsResponseStatus' - -- | The response status code.
sendInvitationResponse ::
  -- | 'sirrsResponseStatus'
  Int ->
  SendInvitationResponse
sendInvitationResponse pResponseStatus_ =
  SendInvitationResponse'
    { _sirrsResponseStatus =
        pResponseStatus_
    }

-- | -- | The response status code.
sirrsResponseStatus :: Lens' SendInvitationResponse Int
sirrsResponseStatus = lens _sirrsResponseStatus (\s a -> s {_sirrsResponseStatus = a})

instance NFData SendInvitationResponse
