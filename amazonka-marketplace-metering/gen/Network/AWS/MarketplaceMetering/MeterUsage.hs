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
-- Module      : Network.AWS.MarketplaceMetering.MeterUsage
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- API to emit metering records. For identical requests, the API is idempotent. It simply returns the metering record ID.
--
--
-- MeterUsage is authenticated on the buyer's AWS account using credentials from the EC2 instance, ECS task, or EKS pod.
--
-- MeterUsage can optionally include multiple usage allocations, to provide customers with usage data split into buckets by tags that you define (or allow the customer to define).
module Network.AWS.MarketplaceMetering.MeterUsage
  ( -- * Creating a Request
    meterUsage,
    MeterUsage,

    -- * Request Lenses
    muDryRun,
    muUsageAllocations,
    muUsageQuantity,
    muProductCode,
    muTimestamp,
    muUsageDimension,

    -- * Destructuring the Response
    meterUsageResponse,
    MeterUsageResponse,

    -- * Response Lenses
    murrsMeteringRecordId,
    murrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.MarketplaceMetering.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'meterUsage' smart constructor.
data MeterUsage = MeterUsage'
  { _muDryRun ::
      !(Maybe Bool),
    _muUsageAllocations ::
      !(Maybe (List1 UsageAllocation)),
    _muUsageQuantity :: !(Maybe Nat),
    _muProductCode :: !Text,
    _muTimestamp :: !POSIX,
    _muUsageDimension :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'MeterUsage' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'muDryRun' - Checks whether you have the permissions required for the action, but does not make the request. If you have the permissions, the request returns DryRunOperation; otherwise, it returns UnauthorizedException. Defaults to @false@ if not specified.
--
-- * 'muUsageAllocations' - The set of UsageAllocations to submit. The sum of all UsageAllocation quantities must equal the UsageQuantity of the MeterUsage request, and each UsageAllocation must have a unique set of tags (include no tags).
--
-- * 'muUsageQuantity' - Consumption value for the hour. Defaults to @0@ if not specified.
--
-- * 'muProductCode' - Product code is used to uniquely identify a product in AWS Marketplace. The product code should be the same as the one used during the publishing of a new product.
--
-- * 'muTimestamp' - Timestamp, in UTC, for which the usage is being reported. Your application can meter usage for up to one hour in the past. Make sure the timestamp value is not before the start of the software usage.
--
-- * 'muUsageDimension' - It will be one of the fcp dimension name provided during the publishing of the product.
meterUsage ::
  -- | 'muProductCode'
  Text ->
  -- | 'muTimestamp'
  UTCTime ->
  -- | 'muUsageDimension'
  Text ->
  MeterUsage
meterUsage pProductCode_ pTimestamp_ pUsageDimension_ =
  MeterUsage'
    { _muDryRun = Nothing,
      _muUsageAllocations = Nothing,
      _muUsageQuantity = Nothing,
      _muProductCode = pProductCode_,
      _muTimestamp = _Time # pTimestamp_,
      _muUsageDimension = pUsageDimension_
    }

-- | Checks whether you have the permissions required for the action, but does not make the request. If you have the permissions, the request returns DryRunOperation; otherwise, it returns UnauthorizedException. Defaults to @false@ if not specified.
muDryRun :: Lens' MeterUsage (Maybe Bool)
muDryRun = lens _muDryRun (\s a -> s {_muDryRun = a})

-- | The set of UsageAllocations to submit. The sum of all UsageAllocation quantities must equal the UsageQuantity of the MeterUsage request, and each UsageAllocation must have a unique set of tags (include no tags).
muUsageAllocations :: Lens' MeterUsage (Maybe (NonEmpty UsageAllocation))
muUsageAllocations = lens _muUsageAllocations (\s a -> s {_muUsageAllocations = a}) . mapping _List1

-- | Consumption value for the hour. Defaults to @0@ if not specified.
muUsageQuantity :: Lens' MeterUsage (Maybe Natural)
muUsageQuantity = lens _muUsageQuantity (\s a -> s {_muUsageQuantity = a}) . mapping _Nat

-- | Product code is used to uniquely identify a product in AWS Marketplace. The product code should be the same as the one used during the publishing of a new product.
muProductCode :: Lens' MeterUsage Text
muProductCode = lens _muProductCode (\s a -> s {_muProductCode = a})

-- | Timestamp, in UTC, for which the usage is being reported. Your application can meter usage for up to one hour in the past. Make sure the timestamp value is not before the start of the software usage.
muTimestamp :: Lens' MeterUsage UTCTime
muTimestamp = lens _muTimestamp (\s a -> s {_muTimestamp = a}) . _Time

-- | It will be one of the fcp dimension name provided during the publishing of the product.
muUsageDimension :: Lens' MeterUsage Text
muUsageDimension = lens _muUsageDimension (\s a -> s {_muUsageDimension = a})

instance AWSRequest MeterUsage where
  type Rs MeterUsage = MeterUsageResponse
  request = postJSON marketplaceMetering
  response =
    receiveJSON
      ( \s h x ->
          MeterUsageResponse'
            <$> (x .?> "MeteringRecordId") <*> (pure (fromEnum s))
      )

instance Hashable MeterUsage

instance NFData MeterUsage

instance ToHeaders MeterUsage where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ("AWSMPMeteringService.MeterUsage" :: ByteString),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON MeterUsage where
  toJSON MeterUsage' {..} =
    object
      ( catMaybes
          [ ("DryRun" .=) <$> _muDryRun,
            ("UsageAllocations" .=) <$> _muUsageAllocations,
            ("UsageQuantity" .=) <$> _muUsageQuantity,
            Just ("ProductCode" .= _muProductCode),
            Just ("Timestamp" .= _muTimestamp),
            Just ("UsageDimension" .= _muUsageDimension)
          ]
      )

instance ToPath MeterUsage where
  toPath = const "/"

instance ToQuery MeterUsage where
  toQuery = const mempty

-- | /See:/ 'meterUsageResponse' smart constructor.
data MeterUsageResponse = MeterUsageResponse'
  { _murrsMeteringRecordId ::
      !(Maybe Text),
    _murrsResponseStatus :: !Int
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'MeterUsageResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'murrsMeteringRecordId' - Metering record id.
--
-- * 'murrsResponseStatus' - -- | The response status code.
meterUsageResponse ::
  -- | 'murrsResponseStatus'
  Int ->
  MeterUsageResponse
meterUsageResponse pResponseStatus_ =
  MeterUsageResponse'
    { _murrsMeteringRecordId =
        Nothing,
      _murrsResponseStatus = pResponseStatus_
    }

-- | Metering record id.
murrsMeteringRecordId :: Lens' MeterUsageResponse (Maybe Text)
murrsMeteringRecordId = lens _murrsMeteringRecordId (\s a -> s {_murrsMeteringRecordId = a})

-- | -- | The response status code.
murrsResponseStatus :: Lens' MeterUsageResponse Int
murrsResponseStatus = lens _murrsResponseStatus (\s a -> s {_murrsResponseStatus = a})

instance NFData MeterUsageResponse
