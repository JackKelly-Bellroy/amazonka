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
-- Module      : Network.AWS.Discovery.DescribeConfigurations
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Retrieves attributes for a list of configuration item IDs.
module Network.AWS.Discovery.DescribeConfigurations
  ( -- * Creating a Request
    describeConfigurations,
    DescribeConfigurations,

    -- * Request Lenses
    dcConfigurationIds,

    -- * Destructuring the Response
    describeConfigurationsResponse,
    DescribeConfigurationsResponse,

    -- * Response Lenses
    dcrrsConfigurations,
    dcrrsResponseStatus,
  )
where

import Network.AWS.Discovery.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'describeConfigurations' smart constructor.
newtype DescribeConfigurations = DescribeConfigurations'
  { _dcConfigurationIds ::
      [Text]
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'DescribeConfigurations' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dcConfigurationIds' - One or more configuration IDs.
describeConfigurations ::
  DescribeConfigurations
describeConfigurations =
  DescribeConfigurations'
    { _dcConfigurationIds =
        mempty
    }

-- | One or more configuration IDs.
dcConfigurationIds :: Lens' DescribeConfigurations [Text]
dcConfigurationIds = lens _dcConfigurationIds (\s a -> s {_dcConfigurationIds = a}) . _Coerce

instance AWSRequest DescribeConfigurations where
  type
    Rs DescribeConfigurations =
      DescribeConfigurationsResponse
  request = postJSON discovery
  response =
    receiveJSON
      ( \s h x ->
          DescribeConfigurationsResponse'
            <$> (x .?> "configurations" .!@ mempty)
            <*> (pure (fromEnum s))
      )

instance Hashable DescribeConfigurations

instance NFData DescribeConfigurations

instance ToHeaders DescribeConfigurations where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "AWSPoseidonService_V2015_11_01.DescribeConfigurations" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON DescribeConfigurations where
  toJSON DescribeConfigurations' {..} =
    object
      ( catMaybes
          [Just ("configurationIds" .= _dcConfigurationIds)]
      )

instance ToPath DescribeConfigurations where
  toPath = const "/"

instance ToQuery DescribeConfigurations where
  toQuery = const mempty

-- | /See:/ 'describeConfigurationsResponse' smart constructor.
data DescribeConfigurationsResponse = DescribeConfigurationsResponse'
  { _dcrrsConfigurations ::
      !( Maybe
           [ Map
               Text
               Text
           ]
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

-- | Creates a value of 'DescribeConfigurationsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dcrrsConfigurations' - A key in the response map. The value is an array of data.
--
-- * 'dcrrsResponseStatus' - -- | The response status code.
describeConfigurationsResponse ::
  -- | 'dcrrsResponseStatus'
  Int ->
  DescribeConfigurationsResponse
describeConfigurationsResponse pResponseStatus_ =
  DescribeConfigurationsResponse'
    { _dcrrsConfigurations =
        Nothing,
      _dcrrsResponseStatus = pResponseStatus_
    }

-- | A key in the response map. The value is an array of data.
dcrrsConfigurations :: Lens' DescribeConfigurationsResponse [HashMap Text Text]
dcrrsConfigurations = lens _dcrrsConfigurations (\s a -> s {_dcrrsConfigurations = a}) . _Default . _Coerce

-- | -- | The response status code.
dcrrsResponseStatus :: Lens' DescribeConfigurationsResponse Int
dcrrsResponseStatus = lens _dcrrsResponseStatus (\s a -> s {_dcrrsResponseStatus = a})

instance NFData DescribeConfigurationsResponse
