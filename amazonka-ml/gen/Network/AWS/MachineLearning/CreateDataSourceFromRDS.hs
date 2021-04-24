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
-- Module      : Network.AWS.MachineLearning.CreateDataSourceFromRDS
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates a @DataSource@ object from an <http://aws.amazon.com/rds/ Amazon Relational Database Service> (Amazon RDS). A @DataSource@ references data that can be used to perform @CreateMLModel@ , @CreateEvaluation@ , or @CreateBatchPrediction@ operations.
--
--
-- @CreateDataSourceFromRDS@ is an asynchronous operation. In response to @CreateDataSourceFromRDS@ , Amazon Machine Learning (Amazon ML) immediately returns and sets the @DataSource@ status to @PENDING@ . After the @DataSource@ is created and ready for use, Amazon ML sets the @Status@ parameter to @COMPLETED@ . @DataSource@ in the @COMPLETED@ or @PENDING@ state can be used only to perform @>CreateMLModel@ >, @CreateEvaluation@ , or @CreateBatchPrediction@ operations.
--
-- If Amazon ML cannot accept the input source, it sets the @Status@ parameter to @FAILED@ and includes an error message in the @Message@ attribute of the @GetDataSource@ operation response.
module Network.AWS.MachineLearning.CreateDataSourceFromRDS
  ( -- * Creating a Request
    createDataSourceFromRDS,
    CreateDataSourceFromRDS,

    -- * Request Lenses
    cdsfrdsComputeStatistics,
    cdsfrdsDataSourceName,
    cdsfrdsDataSourceId,
    cdsfrdsRDSData,
    cdsfrdsRoleARN,

    -- * Destructuring the Response
    createDataSourceFromRDSResponse,
    CreateDataSourceFromRDSResponse,

    -- * Response Lenses
    cdsfrdsrrsDataSourceId,
    cdsfrdsrrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.MachineLearning.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'createDataSourceFromRDS' smart constructor.
data CreateDataSourceFromRDS = CreateDataSourceFromRDS'
  { _cdsfrdsComputeStatistics ::
      !(Maybe Bool),
    _cdsfrdsDataSourceName ::
      !(Maybe Text),
    _cdsfrdsDataSourceId ::
      !Text,
    _cdsfrdsRDSData ::
      !RDSDataSpec,
    _cdsfrdsRoleARN ::
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

-- | Creates a value of 'CreateDataSourceFromRDS' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cdsfrdsComputeStatistics' - The compute statistics for a @DataSource@ . The statistics are generated from the observation data referenced by a @DataSource@ . Amazon ML uses the statistics internally during @MLModel@ training. This parameter must be set to @true@ if the DataSourceneeds to be used for @MLModel@ training.
--
-- * 'cdsfrdsDataSourceName' - A user-supplied name or description of the @DataSource@ .
--
-- * 'cdsfrdsDataSourceId' - A user-supplied ID that uniquely identifies the @DataSource@ . Typically, an Amazon Resource Number (ARN) becomes the ID for a @DataSource@ .
--
-- * 'cdsfrdsRDSData' - The data specification of an Amazon RDS @DataSource@ :     * DatabaseInformation -     * @DatabaseName@ - The name of the Amazon RDS database.    * @InstanceIdentifier @ - A unique identifier for the Amazon RDS database instance.     * DatabaseCredentials - AWS Identity and Access Management (IAM) credentials that are used to connect to the Amazon RDS database.     * ResourceRole - A role (DataPipelineDefaultResourceRole) assumed by an EC2 instance to carry out the copy task from Amazon RDS to Amazon Simple Storage Service (Amazon S3). For more information, see <http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html Role templates> for data pipelines.     * ServiceRole - A role (DataPipelineDefaultRole) assumed by the AWS Data Pipeline service to monitor the progress of the copy task from Amazon RDS to Amazon S3. For more information, see <http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html Role templates> for data pipelines.     * SecurityInfo - The security information to use to access an RDS DB instance. You need to set up appropriate ingress rules for the security entity IDs provided to allow access to the Amazon RDS instance. Specify a [@SubnetId@ , @SecurityGroupIds@ ] pair for a VPC-based RDS DB instance.     * SelectSqlQuery - A query that is used to retrieve the observation data for the @Datasource@ .     * S3StagingLocation - The Amazon S3 location for staging Amazon RDS data. The data retrieved from Amazon RDS using @SelectSqlQuery@ is stored in this location.     * DataSchemaUri - The Amazon S3 location of the @DataSchema@ .     * DataSchema - A JSON string representing the schema. This is not required if @DataSchemaUri@ is specified.      * DataRearrangement - A JSON string that represents the splitting and rearrangement requirements for the @Datasource@ .  Sample - @"{\"splitting\":{\"percentBegin\":10,\"percentEnd\":60}}"@
--
-- * 'cdsfrdsRoleARN' - The role that Amazon ML assumes on behalf of the user to create and activate a data pipeline in the user's account and copy data using the @SelectSqlQuery@ query from Amazon RDS to Amazon S3.
createDataSourceFromRDS ::
  -- | 'cdsfrdsDataSourceId'
  Text ->
  -- | 'cdsfrdsRDSData'
  RDSDataSpec ->
  -- | 'cdsfrdsRoleARN'
  Text ->
  CreateDataSourceFromRDS
createDataSourceFromRDS
  pDataSourceId_
  pRDSData_
  pRoleARN_ =
    CreateDataSourceFromRDS'
      { _cdsfrdsComputeStatistics =
          Nothing,
        _cdsfrdsDataSourceName = Nothing,
        _cdsfrdsDataSourceId = pDataSourceId_,
        _cdsfrdsRDSData = pRDSData_,
        _cdsfrdsRoleARN = pRoleARN_
      }

-- | The compute statistics for a @DataSource@ . The statistics are generated from the observation data referenced by a @DataSource@ . Amazon ML uses the statistics internally during @MLModel@ training. This parameter must be set to @true@ if the DataSourceneeds to be used for @MLModel@ training.
cdsfrdsComputeStatistics :: Lens' CreateDataSourceFromRDS (Maybe Bool)
cdsfrdsComputeStatistics = lens _cdsfrdsComputeStatistics (\s a -> s {_cdsfrdsComputeStatistics = a})

-- | A user-supplied name or description of the @DataSource@ .
cdsfrdsDataSourceName :: Lens' CreateDataSourceFromRDS (Maybe Text)
cdsfrdsDataSourceName = lens _cdsfrdsDataSourceName (\s a -> s {_cdsfrdsDataSourceName = a})

-- | A user-supplied ID that uniquely identifies the @DataSource@ . Typically, an Amazon Resource Number (ARN) becomes the ID for a @DataSource@ .
cdsfrdsDataSourceId :: Lens' CreateDataSourceFromRDS Text
cdsfrdsDataSourceId = lens _cdsfrdsDataSourceId (\s a -> s {_cdsfrdsDataSourceId = a})

-- | The data specification of an Amazon RDS @DataSource@ :     * DatabaseInformation -     * @DatabaseName@ - The name of the Amazon RDS database.    * @InstanceIdentifier @ - A unique identifier for the Amazon RDS database instance.     * DatabaseCredentials - AWS Identity and Access Management (IAM) credentials that are used to connect to the Amazon RDS database.     * ResourceRole - A role (DataPipelineDefaultResourceRole) assumed by an EC2 instance to carry out the copy task from Amazon RDS to Amazon Simple Storage Service (Amazon S3). For more information, see <http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html Role templates> for data pipelines.     * ServiceRole - A role (DataPipelineDefaultRole) assumed by the AWS Data Pipeline service to monitor the progress of the copy task from Amazon RDS to Amazon S3. For more information, see <http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html Role templates> for data pipelines.     * SecurityInfo - The security information to use to access an RDS DB instance. You need to set up appropriate ingress rules for the security entity IDs provided to allow access to the Amazon RDS instance. Specify a [@SubnetId@ , @SecurityGroupIds@ ] pair for a VPC-based RDS DB instance.     * SelectSqlQuery - A query that is used to retrieve the observation data for the @Datasource@ .     * S3StagingLocation - The Amazon S3 location for staging Amazon RDS data. The data retrieved from Amazon RDS using @SelectSqlQuery@ is stored in this location.     * DataSchemaUri - The Amazon S3 location of the @DataSchema@ .     * DataSchema - A JSON string representing the schema. This is not required if @DataSchemaUri@ is specified.      * DataRearrangement - A JSON string that represents the splitting and rearrangement requirements for the @Datasource@ .  Sample - @"{\"splitting\":{\"percentBegin\":10,\"percentEnd\":60}}"@
cdsfrdsRDSData :: Lens' CreateDataSourceFromRDS RDSDataSpec
cdsfrdsRDSData = lens _cdsfrdsRDSData (\s a -> s {_cdsfrdsRDSData = a})

-- | The role that Amazon ML assumes on behalf of the user to create and activate a data pipeline in the user's account and copy data using the @SelectSqlQuery@ query from Amazon RDS to Amazon S3.
cdsfrdsRoleARN :: Lens' CreateDataSourceFromRDS Text
cdsfrdsRoleARN = lens _cdsfrdsRoleARN (\s a -> s {_cdsfrdsRoleARN = a})

instance AWSRequest CreateDataSourceFromRDS where
  type
    Rs CreateDataSourceFromRDS =
      CreateDataSourceFromRDSResponse
  request = postJSON machineLearning
  response =
    receiveJSON
      ( \s h x ->
          CreateDataSourceFromRDSResponse'
            <$> (x .?> "DataSourceId") <*> (pure (fromEnum s))
      )

instance Hashable CreateDataSourceFromRDS

instance NFData CreateDataSourceFromRDS

instance ToHeaders CreateDataSourceFromRDS where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "AmazonML_20141212.CreateDataSourceFromRDS" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON CreateDataSourceFromRDS where
  toJSON CreateDataSourceFromRDS' {..} =
    object
      ( catMaybes
          [ ("ComputeStatistics" .=)
              <$> _cdsfrdsComputeStatistics,
            ("DataSourceName" .=) <$> _cdsfrdsDataSourceName,
            Just ("DataSourceId" .= _cdsfrdsDataSourceId),
            Just ("RDSData" .= _cdsfrdsRDSData),
            Just ("RoleARN" .= _cdsfrdsRoleARN)
          ]
      )

instance ToPath CreateDataSourceFromRDS where
  toPath = const "/"

instance ToQuery CreateDataSourceFromRDS where
  toQuery = const mempty

-- | Represents the output of a @CreateDataSourceFromRDS@ operation, and is an acknowledgement that Amazon ML received the request.
--
--
-- The @CreateDataSourceFromRDS@ > operation is asynchronous. You can poll for updates by using the @GetBatchPrediction@ operation and checking the @Status@ parameter. You can inspect the @Message@ when @Status@ shows up as @FAILED@ . You can also check the progress of the copy operation by going to the @DataPipeline@ console and looking up the pipeline using the @pipelineId @ from the describe call.
--
--
-- /See:/ 'createDataSourceFromRDSResponse' smart constructor.
data CreateDataSourceFromRDSResponse = CreateDataSourceFromRDSResponse'
  { _cdsfrdsrrsDataSourceId ::
      !( Maybe
           Text
       ),
    _cdsfrdsrrsResponseStatus ::
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

-- | Creates a value of 'CreateDataSourceFromRDSResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cdsfrdsrrsDataSourceId' - A user-supplied ID that uniquely identifies the datasource. This value should be identical to the value of the @DataSourceID@ in the request.
--
-- * 'cdsfrdsrrsResponseStatus' - -- | The response status code.
createDataSourceFromRDSResponse ::
  -- | 'cdsfrdsrrsResponseStatus'
  Int ->
  CreateDataSourceFromRDSResponse
createDataSourceFromRDSResponse pResponseStatus_ =
  CreateDataSourceFromRDSResponse'
    { _cdsfrdsrrsDataSourceId =
        Nothing,
      _cdsfrdsrrsResponseStatus =
        pResponseStatus_
    }

-- | A user-supplied ID that uniquely identifies the datasource. This value should be identical to the value of the @DataSourceID@ in the request.
cdsfrdsrrsDataSourceId :: Lens' CreateDataSourceFromRDSResponse (Maybe Text)
cdsfrdsrrsDataSourceId = lens _cdsfrdsrrsDataSourceId (\s a -> s {_cdsfrdsrrsDataSourceId = a})

-- | -- | The response status code.
cdsfrdsrrsResponseStatus :: Lens' CreateDataSourceFromRDSResponse Int
cdsfrdsrrsResponseStatus = lens _cdsfrdsrrsResponseStatus (\s a -> s {_cdsfrdsrrsResponseStatus = a})

instance NFData CreateDataSourceFromRDSResponse
