{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.AlexaBusiness.Types.DeviceNetworkProfileInfo
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.AlexaBusiness.Types.DeviceNetworkProfileInfo where

import Network.AWS.Lens
import Network.AWS.Prelude

-- | Detailed information about a device's network profile.
--
--
--
-- /See:/ 'deviceNetworkProfileInfo' smart constructor.
data DeviceNetworkProfileInfo = DeviceNetworkProfileInfo'
  { _dnpiCertificateExpirationTime ::
      !(Maybe POSIX),
    _dnpiCertificateARN ::
      !(Maybe Text),
    _dnpiNetworkProfileARN ::
      !(Maybe Text)
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'DeviceNetworkProfileInfo' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dnpiCertificateExpirationTime' - The time (in epoch) when the certificate expires.
--
-- * 'dnpiCertificateARN' - The ARN of the certificate associated with a device.
--
-- * 'dnpiNetworkProfileARN' - The ARN of the network profile associated with a device.
deviceNetworkProfileInfo ::
  DeviceNetworkProfileInfo
deviceNetworkProfileInfo =
  DeviceNetworkProfileInfo'
    { _dnpiCertificateExpirationTime =
        Nothing,
      _dnpiCertificateARN = Nothing,
      _dnpiNetworkProfileARN = Nothing
    }

-- | The time (in epoch) when the certificate expires.
dnpiCertificateExpirationTime :: Lens' DeviceNetworkProfileInfo (Maybe UTCTime)
dnpiCertificateExpirationTime = lens _dnpiCertificateExpirationTime (\s a -> s {_dnpiCertificateExpirationTime = a}) . mapping _Time

-- | The ARN of the certificate associated with a device.
dnpiCertificateARN :: Lens' DeviceNetworkProfileInfo (Maybe Text)
dnpiCertificateARN = lens _dnpiCertificateARN (\s a -> s {_dnpiCertificateARN = a})

-- | The ARN of the network profile associated with a device.
dnpiNetworkProfileARN :: Lens' DeviceNetworkProfileInfo (Maybe Text)
dnpiNetworkProfileARN = lens _dnpiNetworkProfileARN (\s a -> s {_dnpiNetworkProfileARN = a})

instance FromJSON DeviceNetworkProfileInfo where
  parseJSON =
    withObject
      "DeviceNetworkProfileInfo"
      ( \x ->
          DeviceNetworkProfileInfo'
            <$> (x .:? "CertificateExpirationTime")
            <*> (x .:? "CertificateArn")
            <*> (x .:? "NetworkProfileArn")
      )

instance Hashable DeviceNetworkProfileInfo

instance NFData DeviceNetworkProfileInfo
