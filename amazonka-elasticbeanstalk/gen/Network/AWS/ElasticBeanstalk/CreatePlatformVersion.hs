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
-- Module      : Network.AWS.ElasticBeanstalk.CreatePlatformVersion
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Create a new version of your custom platform.
module Network.AWS.ElasticBeanstalk.CreatePlatformVersion
  ( -- * Creating a Request
    createPlatformVersion,
    CreatePlatformVersion,

    -- * Request Lenses
    cpvEnvironmentName,
    cpvTags,
    cpvOptionSettings,
    cpvPlatformName,
    cpvPlatformVersion,
    cpvPlatformDefinitionBundle,

    -- * Destructuring the Response
    createPlatformVersionResponse,
    CreatePlatformVersionResponse,

    -- * Response Lenses
    cpvrrsPlatformSummary,
    cpvrrsBuilder,
    cpvrrsResponseStatus,
  )
where

import Network.AWS.ElasticBeanstalk.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | Request to create a new platform version.
--
--
--
-- /See:/ 'createPlatformVersion' smart constructor.
data CreatePlatformVersion = CreatePlatformVersion'
  { _cpvEnvironmentName ::
      !(Maybe Text),
    _cpvTags :: !(Maybe [Tag]),
    _cpvOptionSettings ::
      !( Maybe
           [ConfigurationOptionSetting]
       ),
    _cpvPlatformName :: !Text,
    _cpvPlatformVersion ::
      !Text,
    _cpvPlatformDefinitionBundle ::
      !S3Location
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'CreatePlatformVersion' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cpvEnvironmentName' - The name of the builder environment.
--
-- * 'cpvTags' - Specifies the tags applied to the new platform version. Elastic Beanstalk applies these tags only to the platform version. Environments that you create using the platform version don't inherit the tags.
--
-- * 'cpvOptionSettings' - The configuration option settings to apply to the builder environment.
--
-- * 'cpvPlatformName' - The name of your custom platform.
--
-- * 'cpvPlatformVersion' - The number, such as 1.0.2, for the new platform version.
--
-- * 'cpvPlatformDefinitionBundle' - The location of the platform definition archive in Amazon S3.
createPlatformVersion ::
  -- | 'cpvPlatformName'
  Text ->
  -- | 'cpvPlatformVersion'
  Text ->
  -- | 'cpvPlatformDefinitionBundle'
  S3Location ->
  CreatePlatformVersion
createPlatformVersion
  pPlatformName_
  pPlatformVersion_
  pPlatformDefinitionBundle_ =
    CreatePlatformVersion'
      { _cpvEnvironmentName =
          Nothing,
        _cpvTags = Nothing,
        _cpvOptionSettings = Nothing,
        _cpvPlatformName = pPlatformName_,
        _cpvPlatformVersion = pPlatformVersion_,
        _cpvPlatformDefinitionBundle =
          pPlatformDefinitionBundle_
      }

-- | The name of the builder environment.
cpvEnvironmentName :: Lens' CreatePlatformVersion (Maybe Text)
cpvEnvironmentName = lens _cpvEnvironmentName (\s a -> s {_cpvEnvironmentName = a})

-- | Specifies the tags applied to the new platform version. Elastic Beanstalk applies these tags only to the platform version. Environments that you create using the platform version don't inherit the tags.
cpvTags :: Lens' CreatePlatformVersion [Tag]
cpvTags = lens _cpvTags (\s a -> s {_cpvTags = a}) . _Default . _Coerce

-- | The configuration option settings to apply to the builder environment.
cpvOptionSettings :: Lens' CreatePlatformVersion [ConfigurationOptionSetting]
cpvOptionSettings = lens _cpvOptionSettings (\s a -> s {_cpvOptionSettings = a}) . _Default . _Coerce

-- | The name of your custom platform.
cpvPlatformName :: Lens' CreatePlatformVersion Text
cpvPlatformName = lens _cpvPlatformName (\s a -> s {_cpvPlatformName = a})

-- | The number, such as 1.0.2, for the new platform version.
cpvPlatformVersion :: Lens' CreatePlatformVersion Text
cpvPlatformVersion = lens _cpvPlatformVersion (\s a -> s {_cpvPlatformVersion = a})

-- | The location of the platform definition archive in Amazon S3.
cpvPlatformDefinitionBundle :: Lens' CreatePlatformVersion S3Location
cpvPlatformDefinitionBundle = lens _cpvPlatformDefinitionBundle (\s a -> s {_cpvPlatformDefinitionBundle = a})

instance AWSRequest CreatePlatformVersion where
  type
    Rs CreatePlatformVersion =
      CreatePlatformVersionResponse
  request = postQuery elasticBeanstalk
  response =
    receiveXMLWrapper
      "CreatePlatformVersionResult"
      ( \s h x ->
          CreatePlatformVersionResponse'
            <$> (x .@? "PlatformSummary")
            <*> (x .@? "Builder")
            <*> (pure (fromEnum s))
      )

instance Hashable CreatePlatformVersion

instance NFData CreatePlatformVersion

instance ToHeaders CreatePlatformVersion where
  toHeaders = const mempty

instance ToPath CreatePlatformVersion where
  toPath = const "/"

instance ToQuery CreatePlatformVersion where
  toQuery CreatePlatformVersion' {..} =
    mconcat
      [ "Action" =: ("CreatePlatformVersion" :: ByteString),
        "Version" =: ("2010-12-01" :: ByteString),
        "EnvironmentName" =: _cpvEnvironmentName,
        "Tags"
          =: toQuery (toQueryList "member" <$> _cpvTags),
        "OptionSettings"
          =: toQuery
            (toQueryList "member" <$> _cpvOptionSettings),
        "PlatformName" =: _cpvPlatformName,
        "PlatformVersion" =: _cpvPlatformVersion,
        "PlatformDefinitionBundle"
          =: _cpvPlatformDefinitionBundle
      ]

-- | /See:/ 'createPlatformVersionResponse' smart constructor.
data CreatePlatformVersionResponse = CreatePlatformVersionResponse'
  { _cpvrrsPlatformSummary ::
      !( Maybe
           PlatformSummary
       ),
    _cpvrrsBuilder ::
      !( Maybe
           Builder
       ),
    _cpvrrsResponseStatus ::
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

-- | Creates a value of 'CreatePlatformVersionResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cpvrrsPlatformSummary' - Detailed information about the new version of the custom platform.
--
-- * 'cpvrrsBuilder' - The builder used to create the custom platform.
--
-- * 'cpvrrsResponseStatus' - -- | The response status code.
createPlatformVersionResponse ::
  -- | 'cpvrrsResponseStatus'
  Int ->
  CreatePlatformVersionResponse
createPlatformVersionResponse pResponseStatus_ =
  CreatePlatformVersionResponse'
    { _cpvrrsPlatformSummary =
        Nothing,
      _cpvrrsBuilder = Nothing,
      _cpvrrsResponseStatus = pResponseStatus_
    }

-- | Detailed information about the new version of the custom platform.
cpvrrsPlatformSummary :: Lens' CreatePlatformVersionResponse (Maybe PlatformSummary)
cpvrrsPlatformSummary = lens _cpvrrsPlatformSummary (\s a -> s {_cpvrrsPlatformSummary = a})

-- | The builder used to create the custom platform.
cpvrrsBuilder :: Lens' CreatePlatformVersionResponse (Maybe Builder)
cpvrrsBuilder = lens _cpvrrsBuilder (\s a -> s {_cpvrrsBuilder = a})

-- | -- | The response status code.
cpvrrsResponseStatus :: Lens' CreatePlatformVersionResponse Int
cpvrrsResponseStatus = lens _cpvrrsResponseStatus (\s a -> s {_cpvrrsResponseStatus = a})

instance NFData CreatePlatformVersionResponse
