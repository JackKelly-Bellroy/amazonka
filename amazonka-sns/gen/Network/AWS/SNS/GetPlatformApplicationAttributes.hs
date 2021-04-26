{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.SNS.GetPlatformApplicationAttributes
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Retrieves the attributes of the platform application object for the
-- supported push notification services, such as APNS and GCM (Firebase
-- Cloud Messaging). For more information, see
-- <https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html Using Amazon SNS Mobile Push Notifications>.
module Network.AWS.SNS.GetPlatformApplicationAttributes
  ( -- * Creating a Request
    GetPlatformApplicationAttributes (..),
    newGetPlatformApplicationAttributes,

    -- * Request Lenses
    getPlatformApplicationAttributes_platformApplicationArn,

    -- * Destructuring the Response
    GetPlatformApplicationAttributesResponse (..),
    newGetPlatformApplicationAttributesResponse,

    -- * Response Lenses
    getPlatformApplicationAttributesResponse_attributes,
    getPlatformApplicationAttributesResponse_httpStatus,
  )
where

import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response
import Network.AWS.SNS.Types

-- | Input for GetPlatformApplicationAttributes action.
--
-- /See:/ 'newGetPlatformApplicationAttributes' smart constructor.
data GetPlatformApplicationAttributes = GetPlatformApplicationAttributes'
  { -- | PlatformApplicationArn for GetPlatformApplicationAttributesInput.
    platformApplicationArn :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Data, Prelude.Typeable, Prelude.Generic)

-- |
-- Create a value of 'GetPlatformApplicationAttributes' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'platformApplicationArn', 'getPlatformApplicationAttributes_platformApplicationArn' - PlatformApplicationArn for GetPlatformApplicationAttributesInput.
newGetPlatformApplicationAttributes ::
  -- | 'platformApplicationArn'
  Prelude.Text ->
  GetPlatformApplicationAttributes
newGetPlatformApplicationAttributes
  pPlatformApplicationArn_ =
    GetPlatformApplicationAttributes'
      { platformApplicationArn =
          pPlatformApplicationArn_
      }

-- | PlatformApplicationArn for GetPlatformApplicationAttributesInput.
getPlatformApplicationAttributes_platformApplicationArn :: Lens.Lens' GetPlatformApplicationAttributes Prelude.Text
getPlatformApplicationAttributes_platformApplicationArn = Lens.lens (\GetPlatformApplicationAttributes' {platformApplicationArn} -> platformApplicationArn) (\s@GetPlatformApplicationAttributes' {} a -> s {platformApplicationArn = a} :: GetPlatformApplicationAttributes)

instance
  Prelude.AWSRequest
    GetPlatformApplicationAttributes
  where
  type
    Rs GetPlatformApplicationAttributes =
      GetPlatformApplicationAttributesResponse
  request = Request.postQuery defaultService
  response =
    Response.receiveXMLWrapper
      "GetPlatformApplicationAttributesResult"
      ( \s h x ->
          GetPlatformApplicationAttributesResponse'
            Prelude.<$> ( x Prelude..@? "Attributes"
                            Prelude..!@ Prelude.mempty
                            Prelude.>>= Prelude.may
                              (Prelude.parseXMLMap "entry" "key" "value")
                        )
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance
  Prelude.Hashable
    GetPlatformApplicationAttributes

instance
  Prelude.NFData
    GetPlatformApplicationAttributes

instance
  Prelude.ToHeaders
    GetPlatformApplicationAttributes
  where
  toHeaders = Prelude.const Prelude.mempty

instance
  Prelude.ToPath
    GetPlatformApplicationAttributes
  where
  toPath = Prelude.const "/"

instance
  Prelude.ToQuery
    GetPlatformApplicationAttributes
  where
  toQuery GetPlatformApplicationAttributes' {..} =
    Prelude.mconcat
      [ "Action"
          Prelude.=: ( "GetPlatformApplicationAttributes" ::
                         Prelude.ByteString
                     ),
        "Version"
          Prelude.=: ("2010-03-31" :: Prelude.ByteString),
        "PlatformApplicationArn"
          Prelude.=: platformApplicationArn
      ]

-- | Response for GetPlatformApplicationAttributes action.
--
-- /See:/ 'newGetPlatformApplicationAttributesResponse' smart constructor.
data GetPlatformApplicationAttributesResponse = GetPlatformApplicationAttributesResponse'
  { -- | Attributes include the following:
    --
    -- -   @EventEndpointCreated@ – Topic ARN to which EndpointCreated event
    --     notifications should be sent.
    --
    -- -   @EventEndpointDeleted@ – Topic ARN to which EndpointDeleted event
    --     notifications should be sent.
    --
    -- -   @EventEndpointUpdated@ – Topic ARN to which EndpointUpdate event
    --     notifications should be sent.
    --
    -- -   @EventDeliveryFailure@ – Topic ARN to which DeliveryFailure event
    --     notifications should be sent upon Direct Publish delivery failure
    --     (permanent) to one of the application\'s endpoints.
    attributes :: Prelude.Maybe (Prelude.Map Prelude.Text Prelude.Text),
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Data, Prelude.Typeable, Prelude.Generic)

-- |
-- Create a value of 'GetPlatformApplicationAttributesResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'attributes', 'getPlatformApplicationAttributesResponse_attributes' - Attributes include the following:
--
-- -   @EventEndpointCreated@ – Topic ARN to which EndpointCreated event
--     notifications should be sent.
--
-- -   @EventEndpointDeleted@ – Topic ARN to which EndpointDeleted event
--     notifications should be sent.
--
-- -   @EventEndpointUpdated@ – Topic ARN to which EndpointUpdate event
--     notifications should be sent.
--
-- -   @EventDeliveryFailure@ – Topic ARN to which DeliveryFailure event
--     notifications should be sent upon Direct Publish delivery failure
--     (permanent) to one of the application\'s endpoints.
--
-- 'httpStatus', 'getPlatformApplicationAttributesResponse_httpStatus' - The response's http status code.
newGetPlatformApplicationAttributesResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  GetPlatformApplicationAttributesResponse
newGetPlatformApplicationAttributesResponse
  pHttpStatus_ =
    GetPlatformApplicationAttributesResponse'
      { attributes =
          Prelude.Nothing,
        httpStatus = pHttpStatus_
      }

-- | Attributes include the following:
--
-- -   @EventEndpointCreated@ – Topic ARN to which EndpointCreated event
--     notifications should be sent.
--
-- -   @EventEndpointDeleted@ – Topic ARN to which EndpointDeleted event
--     notifications should be sent.
--
-- -   @EventEndpointUpdated@ – Topic ARN to which EndpointUpdate event
--     notifications should be sent.
--
-- -   @EventDeliveryFailure@ – Topic ARN to which DeliveryFailure event
--     notifications should be sent upon Direct Publish delivery failure
--     (permanent) to one of the application\'s endpoints.
getPlatformApplicationAttributesResponse_attributes :: Lens.Lens' GetPlatformApplicationAttributesResponse (Prelude.Maybe (Prelude.HashMap Prelude.Text Prelude.Text))
getPlatformApplicationAttributesResponse_attributes = Lens.lens (\GetPlatformApplicationAttributesResponse' {attributes} -> attributes) (\s@GetPlatformApplicationAttributesResponse' {} a -> s {attributes = a} :: GetPlatformApplicationAttributesResponse) Prelude.. Lens.mapping Prelude._Map

-- | The response's http status code.
getPlatformApplicationAttributesResponse_httpStatus :: Lens.Lens' GetPlatformApplicationAttributesResponse Prelude.Int
getPlatformApplicationAttributesResponse_httpStatus = Lens.lens (\GetPlatformApplicationAttributesResponse' {httpStatus} -> httpStatus) (\s@GetPlatformApplicationAttributesResponse' {} a -> s {httpStatus = a} :: GetPlatformApplicationAttributesResponse)

instance
  Prelude.NFData
    GetPlatformApplicationAttributesResponse
