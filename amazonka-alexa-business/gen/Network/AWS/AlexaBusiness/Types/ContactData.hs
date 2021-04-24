{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.AlexaBusiness.Types.ContactData
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.AlexaBusiness.Types.ContactData where

import Network.AWS.AlexaBusiness.Types.PhoneNumber
import Network.AWS.AlexaBusiness.Types.SipAddress
import Network.AWS.Lens
import Network.AWS.Prelude

-- | Information related to a contact.
--
--
--
-- /See:/ 'contactData' smart constructor.
data ContactData = ContactData'
  { _cdPhoneNumber ::
      !(Maybe (Sensitive Text)),
    _cdPhoneNumbers :: !(Maybe [PhoneNumber]),
    _cdDisplayName :: !(Maybe Text),
    _cdContactARN :: !(Maybe Text),
    _cdFirstName :: !(Maybe Text),
    _cdLastName :: !(Maybe Text),
    _cdSipAddresses :: !(Maybe [SipAddress])
  }
  deriving (Eq, Show, Data, Typeable, Generic)

-- | Creates a value of 'ContactData' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cdPhoneNumber' - The phone number of the contact. The phone number type defaults to WORK. You can specify PhoneNumber or PhoneNumbers. We recommend that you use PhoneNumbers, which lets you specify the phone number type and multiple numbers.
--
-- * 'cdPhoneNumbers' - The list of phone numbers for the contact.
--
-- * 'cdDisplayName' - The name of the contact to display on the console.
--
-- * 'cdContactARN' - The ARN of the contact.
--
-- * 'cdFirstName' - The first name of the contact, used to call the contact on the device.
--
-- * 'cdLastName' - The last name of the contact, used to call the contact on the device.
--
-- * 'cdSipAddresses' - The list of SIP addresses for the contact.
contactData ::
  ContactData
contactData =
  ContactData'
    { _cdPhoneNumber = Nothing,
      _cdPhoneNumbers = Nothing,
      _cdDisplayName = Nothing,
      _cdContactARN = Nothing,
      _cdFirstName = Nothing,
      _cdLastName = Nothing,
      _cdSipAddresses = Nothing
    }

-- | The phone number of the contact. The phone number type defaults to WORK. You can specify PhoneNumber or PhoneNumbers. We recommend that you use PhoneNumbers, which lets you specify the phone number type and multiple numbers.
cdPhoneNumber :: Lens' ContactData (Maybe Text)
cdPhoneNumber = lens _cdPhoneNumber (\s a -> s {_cdPhoneNumber = a}) . mapping _Sensitive

-- | The list of phone numbers for the contact.
cdPhoneNumbers :: Lens' ContactData [PhoneNumber]
cdPhoneNumbers = lens _cdPhoneNumbers (\s a -> s {_cdPhoneNumbers = a}) . _Default . _Coerce

-- | The name of the contact to display on the console.
cdDisplayName :: Lens' ContactData (Maybe Text)
cdDisplayName = lens _cdDisplayName (\s a -> s {_cdDisplayName = a})

-- | The ARN of the contact.
cdContactARN :: Lens' ContactData (Maybe Text)
cdContactARN = lens _cdContactARN (\s a -> s {_cdContactARN = a})

-- | The first name of the contact, used to call the contact on the device.
cdFirstName :: Lens' ContactData (Maybe Text)
cdFirstName = lens _cdFirstName (\s a -> s {_cdFirstName = a})

-- | The last name of the contact, used to call the contact on the device.
cdLastName :: Lens' ContactData (Maybe Text)
cdLastName = lens _cdLastName (\s a -> s {_cdLastName = a})

-- | The list of SIP addresses for the contact.
cdSipAddresses :: Lens' ContactData [SipAddress]
cdSipAddresses = lens _cdSipAddresses (\s a -> s {_cdSipAddresses = a}) . _Default . _Coerce

instance FromJSON ContactData where
  parseJSON =
    withObject
      "ContactData"
      ( \x ->
          ContactData'
            <$> (x .:? "PhoneNumber")
            <*> (x .:? "PhoneNumbers" .!= mempty)
            <*> (x .:? "DisplayName")
            <*> (x .:? "ContactArn")
            <*> (x .:? "FirstName")
            <*> (x .:? "LastName")
            <*> (x .:? "SipAddresses" .!= mempty)
      )

instance Hashable ContactData

instance NFData ContactData
