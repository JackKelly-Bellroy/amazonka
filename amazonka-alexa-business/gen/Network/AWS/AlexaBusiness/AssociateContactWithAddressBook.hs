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
-- Module      : Network.AWS.AlexaBusiness.AssociateContactWithAddressBook
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Associates a contact with a given address book.
module Network.AWS.AlexaBusiness.AssociateContactWithAddressBook
  ( -- * Creating a Request
    associateContactWithAddressBook,
    AssociateContactWithAddressBook,

    -- * Request Lenses
    acwabContactARN,
    acwabAddressBookARN,

    -- * Destructuring the Response
    associateContactWithAddressBookResponse,
    AssociateContactWithAddressBookResponse,

    -- * Response Lenses
    acwabrrsResponseStatus,
  )
where

import Network.AWS.AlexaBusiness.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'associateContactWithAddressBook' smart constructor.
data AssociateContactWithAddressBook = AssociateContactWithAddressBook'
  { _acwabContactARN ::
      !Text,
    _acwabAddressBookARN ::
      !Text
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'AssociateContactWithAddressBook' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'acwabContactARN' - The ARN of the contact to associate with an address book.
--
-- * 'acwabAddressBookARN' - The ARN of the address book with which to associate the contact.
associateContactWithAddressBook ::
  -- | 'acwabContactARN'
  Text ->
  -- | 'acwabAddressBookARN'
  Text ->
  AssociateContactWithAddressBook
associateContactWithAddressBook
  pContactARN_
  pAddressBookARN_ =
    AssociateContactWithAddressBook'
      { _acwabContactARN =
          pContactARN_,
        _acwabAddressBookARN = pAddressBookARN_
      }

-- | The ARN of the contact to associate with an address book.
acwabContactARN :: Lens' AssociateContactWithAddressBook Text
acwabContactARN = lens _acwabContactARN (\s a -> s {_acwabContactARN = a})

-- | The ARN of the address book with which to associate the contact.
acwabAddressBookARN :: Lens' AssociateContactWithAddressBook Text
acwabAddressBookARN = lens _acwabAddressBookARN (\s a -> s {_acwabAddressBookARN = a})

instance AWSRequest AssociateContactWithAddressBook where
  type
    Rs AssociateContactWithAddressBook =
      AssociateContactWithAddressBookResponse
  request = postJSON alexaBusiness
  response =
    receiveEmpty
      ( \s h x ->
          AssociateContactWithAddressBookResponse'
            <$> (pure (fromEnum s))
      )

instance Hashable AssociateContactWithAddressBook

instance NFData AssociateContactWithAddressBook

instance ToHeaders AssociateContactWithAddressBook where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "AlexaForBusiness.AssociateContactWithAddressBook" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON AssociateContactWithAddressBook where
  toJSON AssociateContactWithAddressBook' {..} =
    object
      ( catMaybes
          [ Just ("ContactArn" .= _acwabContactARN),
            Just ("AddressBookArn" .= _acwabAddressBookARN)
          ]
      )

instance ToPath AssociateContactWithAddressBook where
  toPath = const "/"

instance ToQuery AssociateContactWithAddressBook where
  toQuery = const mempty

-- | /See:/ 'associateContactWithAddressBookResponse' smart constructor.
newtype AssociateContactWithAddressBookResponse = AssociateContactWithAddressBookResponse'
  { _acwabrrsResponseStatus ::
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

-- | Creates a value of 'AssociateContactWithAddressBookResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'acwabrrsResponseStatus' - -- | The response status code.
associateContactWithAddressBookResponse ::
  -- | 'acwabrrsResponseStatus'
  Int ->
  AssociateContactWithAddressBookResponse
associateContactWithAddressBookResponse
  pResponseStatus_ =
    AssociateContactWithAddressBookResponse'
      { _acwabrrsResponseStatus =
          pResponseStatus_
      }

-- | -- | The response status code.
acwabrrsResponseStatus :: Lens' AssociateContactWithAddressBookResponse Int
acwabrrsResponseStatus = lens _acwabrrsResponseStatus (\s a -> s {_acwabrrsResponseStatus = a})

instance
  NFData
    AssociateContactWithAddressBookResponse
