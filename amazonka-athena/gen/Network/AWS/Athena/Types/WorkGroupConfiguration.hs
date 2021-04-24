{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Athena.Types.WorkGroupConfiguration
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.Athena.Types.WorkGroupConfiguration where

import Network.AWS.Athena.Types.EngineVersion
import Network.AWS.Athena.Types.ResultConfiguration
import Network.AWS.Lens
import Network.AWS.Prelude

-- | The configuration of the workgroup, which includes the location in Amazon S3 where query results are stored, the encryption option, if any, used for query results, whether the Amazon CloudWatch Metrics are enabled for the workgroup and whether workgroup settings override query settings, and the data usage limits for the amount of data scanned per query or per workgroup. The workgroup settings override is specified in EnforceWorkGroupConfiguration (true/false) in the WorkGroupConfiguration. See 'WorkGroupConfiguration$EnforceWorkGroupConfiguration' .
--
--
--
-- /See:/ 'workGroupConfiguration' smart constructor.
data WorkGroupConfiguration = WorkGroupConfiguration'
  { _wgcBytesScannedCutoffPerQuery ::
      !(Maybe Nat),
    _wgcPublishCloudWatchMetricsEnabled ::
      !(Maybe Bool),
    _wgcEnforceWorkGroupConfiguration ::
      !(Maybe Bool),
    _wgcRequesterPaysEnabled ::
      !(Maybe Bool),
    _wgcEngineVersion ::
      !(Maybe EngineVersion),
    _wgcResultConfiguration ::
      !( Maybe
           ResultConfiguration
       )
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'WorkGroupConfiguration' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'wgcBytesScannedCutoffPerQuery' - The upper data usage limit (cutoff) for the amount of bytes a single query in a workgroup is allowed to scan.
--
-- * 'wgcPublishCloudWatchMetricsEnabled' - Indicates that the Amazon CloudWatch metrics are enabled for the workgroup.
--
-- * 'wgcEnforceWorkGroupConfiguration' - If set to "true", the settings for the workgroup override client-side settings. If set to "false", client-side settings are used. For more information, see <https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html Workgroup Settings Override Client-Side Settings> .
--
-- * 'wgcRequesterPaysEnabled' - If set to @true@ , allows members assigned to a workgroup to reference Amazon S3 Requester Pays buckets in queries. If set to @false@ , workgroup members cannot query data from Requester Pays buckets, and queries that retrieve data from Requester Pays buckets cause an error. The default is @false@ . For more information about Requester Pays buckets, see <https://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html Requester Pays Buckets> in the /Amazon Simple Storage Service Developer Guide/ .
--
-- * 'wgcEngineVersion' - The engine version that all queries running on the workgroup use. Queries on the @AmazonAthenaPreviewFunctionality@ workgroup run on the preview engine regardless of this setting.
--
-- * 'wgcResultConfiguration' - The configuration for the workgroup, which includes the location in Amazon S3 where query results are stored and the encryption option, if any, used for query results. To run the query, you must specify the query results location using one of the ways: either in the workgroup using this setting, or for individual queries (client-side), using 'ResultConfiguration$OutputLocation' . If none of them is set, Athena issues an error that no output location is provided. For more information, see <https://docs.aws.amazon.com/athena/latest/ug/querying.html Query Results> .
workGroupConfiguration ::
  WorkGroupConfiguration
workGroupConfiguration =
  WorkGroupConfiguration'
    { _wgcBytesScannedCutoffPerQuery =
        Nothing,
      _wgcPublishCloudWatchMetricsEnabled = Nothing,
      _wgcEnforceWorkGroupConfiguration = Nothing,
      _wgcRequesterPaysEnabled = Nothing,
      _wgcEngineVersion = Nothing,
      _wgcResultConfiguration = Nothing
    }

-- | The upper data usage limit (cutoff) for the amount of bytes a single query in a workgroup is allowed to scan.
wgcBytesScannedCutoffPerQuery :: Lens' WorkGroupConfiguration (Maybe Natural)
wgcBytesScannedCutoffPerQuery = lens _wgcBytesScannedCutoffPerQuery (\s a -> s {_wgcBytesScannedCutoffPerQuery = a}) . mapping _Nat

-- | Indicates that the Amazon CloudWatch metrics are enabled for the workgroup.
wgcPublishCloudWatchMetricsEnabled :: Lens' WorkGroupConfiguration (Maybe Bool)
wgcPublishCloudWatchMetricsEnabled = lens _wgcPublishCloudWatchMetricsEnabled (\s a -> s {_wgcPublishCloudWatchMetricsEnabled = a})

-- | If set to "true", the settings for the workgroup override client-side settings. If set to "false", client-side settings are used. For more information, see <https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html Workgroup Settings Override Client-Side Settings> .
wgcEnforceWorkGroupConfiguration :: Lens' WorkGroupConfiguration (Maybe Bool)
wgcEnforceWorkGroupConfiguration = lens _wgcEnforceWorkGroupConfiguration (\s a -> s {_wgcEnforceWorkGroupConfiguration = a})

-- | If set to @true@ , allows members assigned to a workgroup to reference Amazon S3 Requester Pays buckets in queries. If set to @false@ , workgroup members cannot query data from Requester Pays buckets, and queries that retrieve data from Requester Pays buckets cause an error. The default is @false@ . For more information about Requester Pays buckets, see <https://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html Requester Pays Buckets> in the /Amazon Simple Storage Service Developer Guide/ .
wgcRequesterPaysEnabled :: Lens' WorkGroupConfiguration (Maybe Bool)
wgcRequesterPaysEnabled = lens _wgcRequesterPaysEnabled (\s a -> s {_wgcRequesterPaysEnabled = a})

-- | The engine version that all queries running on the workgroup use. Queries on the @AmazonAthenaPreviewFunctionality@ workgroup run on the preview engine regardless of this setting.
wgcEngineVersion :: Lens' WorkGroupConfiguration (Maybe EngineVersion)
wgcEngineVersion = lens _wgcEngineVersion (\s a -> s {_wgcEngineVersion = a})

-- | The configuration for the workgroup, which includes the location in Amazon S3 where query results are stored and the encryption option, if any, used for query results. To run the query, you must specify the query results location using one of the ways: either in the workgroup using this setting, or for individual queries (client-side), using 'ResultConfiguration$OutputLocation' . If none of them is set, Athena issues an error that no output location is provided. For more information, see <https://docs.aws.amazon.com/athena/latest/ug/querying.html Query Results> .
wgcResultConfiguration :: Lens' WorkGroupConfiguration (Maybe ResultConfiguration)
wgcResultConfiguration = lens _wgcResultConfiguration (\s a -> s {_wgcResultConfiguration = a})

instance FromJSON WorkGroupConfiguration where
  parseJSON =
    withObject
      "WorkGroupConfiguration"
      ( \x ->
          WorkGroupConfiguration'
            <$> (x .:? "BytesScannedCutoffPerQuery")
            <*> (x .:? "PublishCloudWatchMetricsEnabled")
            <*> (x .:? "EnforceWorkGroupConfiguration")
            <*> (x .:? "RequesterPaysEnabled")
            <*> (x .:? "EngineVersion")
            <*> (x .:? "ResultConfiguration")
      )

instance Hashable WorkGroupConfiguration

instance NFData WorkGroupConfiguration

instance ToJSON WorkGroupConfiguration where
  toJSON WorkGroupConfiguration' {..} =
    object
      ( catMaybes
          [ ("BytesScannedCutoffPerQuery" .=)
              <$> _wgcBytesScannedCutoffPerQuery,
            ("PublishCloudWatchMetricsEnabled" .=)
              <$> _wgcPublishCloudWatchMetricsEnabled,
            ("EnforceWorkGroupConfiguration" .=)
              <$> _wgcEnforceWorkGroupConfiguration,
            ("RequesterPaysEnabled" .=)
              <$> _wgcRequesterPaysEnabled,
            ("EngineVersion" .=) <$> _wgcEngineVersion,
            ("ResultConfiguration" .=)
              <$> _wgcResultConfiguration
          ]
      )
