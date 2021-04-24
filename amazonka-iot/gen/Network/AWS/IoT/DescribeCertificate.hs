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
-- Module      : Network.AWS.IoT.DescribeCertificate
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Gets information about the specified certificate.
module Network.AWS.IoT.DescribeCertificate
  ( -- * Creating a Request
    describeCertificate,
    DescribeCertificate,

    -- * Request Lenses
    dCertificateId,

    -- * Destructuring the Response
    describeCertificateResponse,
    DescribeCertificateResponse,

    -- * Response Lenses
    dcrrsCertificateDescription,
    dcrrsResponseStatus,
  )
where

import Network.AWS.IoT.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | The input for the DescribeCertificate operation.
--
--
--
-- /See:/ 'describeCertificate' smart constructor.
newtype DescribeCertificate = DescribeCertificate'
  { _dCertificateId ::
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

-- | Creates a value of 'DescribeCertificate' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dCertificateId' - The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)
describeCertificate ::
  -- | 'dCertificateId'
  Text ->
  DescribeCertificate
describeCertificate pCertificateId_ =
  DescribeCertificate'
    { _dCertificateId =
        pCertificateId_
    }

-- | The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)
dCertificateId :: Lens' DescribeCertificate Text
dCertificateId = lens _dCertificateId (\s a -> s {_dCertificateId = a})

instance AWSRequest DescribeCertificate where
  type
    Rs DescribeCertificate =
      DescribeCertificateResponse
  request = get ioT
  response =
    receiveJSON
      ( \s h x ->
          DescribeCertificateResponse'
            <$> (x .?> "certificateDescription")
            <*> (pure (fromEnum s))
      )

instance Hashable DescribeCertificate

instance NFData DescribeCertificate

instance ToHeaders DescribeCertificate where
  toHeaders = const mempty

instance ToPath DescribeCertificate where
  toPath DescribeCertificate' {..} =
    mconcat ["/certificates/", toBS _dCertificateId]

instance ToQuery DescribeCertificate where
  toQuery = const mempty

-- | The output of the DescribeCertificate operation.
--
--
--
-- /See:/ 'describeCertificateResponse' smart constructor.
data DescribeCertificateResponse = DescribeCertificateResponse'
  { _dcrrsCertificateDescription ::
      !( Maybe
           CertificateDescription
       ),
    _dcrrsResponseStatus ::
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

-- | Creates a value of 'DescribeCertificateResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dcrrsCertificateDescription' - The description of the certificate.
--
-- * 'dcrrsResponseStatus' - -- | The response status code.
describeCertificateResponse ::
  -- | 'dcrrsResponseStatus'
  Int ->
  DescribeCertificateResponse
describeCertificateResponse pResponseStatus_ =
  DescribeCertificateResponse'
    { _dcrrsCertificateDescription =
        Nothing,
      _dcrrsResponseStatus = pResponseStatus_
    }

-- | The description of the certificate.
dcrrsCertificateDescription :: Lens' DescribeCertificateResponse (Maybe CertificateDescription)
dcrrsCertificateDescription = lens _dcrrsCertificateDescription (\s a -> s {_dcrrsCertificateDescription = a})

-- | -- | The response status code.
dcrrsResponseStatus :: Lens' DescribeCertificateResponse Int
dcrrsResponseStatus = lens _dcrrsResponseStatus (\s a -> s {_dcrrsResponseStatus = a})

instance NFData DescribeCertificateResponse
