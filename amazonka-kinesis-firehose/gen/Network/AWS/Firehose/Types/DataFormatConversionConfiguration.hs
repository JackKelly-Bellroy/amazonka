{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Firehose.Types.DataFormatConversionConfiguration
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.Firehose.Types.DataFormatConversionConfiguration where

import Network.AWS.Firehose.Types.InputFormatConfiguration
import Network.AWS.Firehose.Types.OutputFormatConfiguration
import Network.AWS.Firehose.Types.SchemaConfiguration
import Network.AWS.Lens
import Network.AWS.Prelude

-- | Specifies that you want Kinesis Data Firehose to convert data from the JSON format to the Parquet or ORC format before writing it to Amazon S3. Kinesis Data Firehose uses the serializer and deserializer that you specify, in addition to the column information from the AWS Glue table, to deserialize your input data from JSON and then serialize it to the Parquet or ORC format. For more information, see <https://docs.aws.amazon.com/firehose/latest/dev/record-format-conversion.html Kinesis Data Firehose Record Format Conversion> .
--
--
--
-- /See:/ 'dataFormatConversionConfiguration' smart constructor.
data DataFormatConversionConfiguration = DataFormatConversionConfiguration'
  { _dfccEnabled ::
      !( Maybe
           Bool
       ),
    _dfccInputFormatConfiguration ::
      !( Maybe
           InputFormatConfiguration
       ),
    _dfccOutputFormatConfiguration ::
      !( Maybe
           OutputFormatConfiguration
       ),
    _dfccSchemaConfiguration ::
      !( Maybe
           SchemaConfiguration
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

-- | Creates a value of 'DataFormatConversionConfiguration' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dfccEnabled' - Defaults to @true@ . Set it to @false@ if you want to disable format conversion while preserving the configuration details.
--
-- * 'dfccInputFormatConfiguration' - Specifies the deserializer that you want Kinesis Data Firehose to use to convert the format of your data from JSON. This parameter is required if @Enabled@ is set to true.
--
-- * 'dfccOutputFormatConfiguration' - Specifies the serializer that you want Kinesis Data Firehose to use to convert the format of your data to the Parquet or ORC format. This parameter is required if @Enabled@ is set to true.
--
-- * 'dfccSchemaConfiguration' - Specifies the AWS Glue Data Catalog table that contains the column information. This parameter is required if @Enabled@ is set to true.
dataFormatConversionConfiguration ::
  DataFormatConversionConfiguration
dataFormatConversionConfiguration =
  DataFormatConversionConfiguration'
    { _dfccEnabled =
        Nothing,
      _dfccInputFormatConfiguration = Nothing,
      _dfccOutputFormatConfiguration = Nothing,
      _dfccSchemaConfiguration = Nothing
    }

-- | Defaults to @true@ . Set it to @false@ if you want to disable format conversion while preserving the configuration details.
dfccEnabled :: Lens' DataFormatConversionConfiguration (Maybe Bool)
dfccEnabled = lens _dfccEnabled (\s a -> s {_dfccEnabled = a})

-- | Specifies the deserializer that you want Kinesis Data Firehose to use to convert the format of your data from JSON. This parameter is required if @Enabled@ is set to true.
dfccInputFormatConfiguration :: Lens' DataFormatConversionConfiguration (Maybe InputFormatConfiguration)
dfccInputFormatConfiguration = lens _dfccInputFormatConfiguration (\s a -> s {_dfccInputFormatConfiguration = a})

-- | Specifies the serializer that you want Kinesis Data Firehose to use to convert the format of your data to the Parquet or ORC format. This parameter is required if @Enabled@ is set to true.
dfccOutputFormatConfiguration :: Lens' DataFormatConversionConfiguration (Maybe OutputFormatConfiguration)
dfccOutputFormatConfiguration = lens _dfccOutputFormatConfiguration (\s a -> s {_dfccOutputFormatConfiguration = a})

-- | Specifies the AWS Glue Data Catalog table that contains the column information. This parameter is required if @Enabled@ is set to true.
dfccSchemaConfiguration :: Lens' DataFormatConversionConfiguration (Maybe SchemaConfiguration)
dfccSchemaConfiguration = lens _dfccSchemaConfiguration (\s a -> s {_dfccSchemaConfiguration = a})

instance FromJSON DataFormatConversionConfiguration where
  parseJSON =
    withObject
      "DataFormatConversionConfiguration"
      ( \x ->
          DataFormatConversionConfiguration'
            <$> (x .:? "Enabled")
            <*> (x .:? "InputFormatConfiguration")
            <*> (x .:? "OutputFormatConfiguration")
            <*> (x .:? "SchemaConfiguration")
      )

instance Hashable DataFormatConversionConfiguration

instance NFData DataFormatConversionConfiguration

instance ToJSON DataFormatConversionConfiguration where
  toJSON DataFormatConversionConfiguration' {..} =
    object
      ( catMaybes
          [ ("Enabled" .=) <$> _dfccEnabled,
            ("InputFormatConfiguration" .=)
              <$> _dfccInputFormatConfiguration,
            ("OutputFormatConfiguration" .=)
              <$> _dfccOutputFormatConfiguration,
            ("SchemaConfiguration" .=)
              <$> _dfccSchemaConfiguration
          ]
      )
