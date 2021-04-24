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
-- Module      : Network.AWS.Discovery.ListConfigurations
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Retrieves a list of configuration items as specified by the value passed to the required parameter @configurationType@ . Optional filtering may be applied to refine search results.
--
--
--
-- This operation returns paginated results.
module Network.AWS.Discovery.ListConfigurations
  ( -- * Creating a Request
    listConfigurations,
    ListConfigurations,

    -- * Request Lenses
    lcNextToken,
    lcMaxResults,
    lcOrderBy,
    lcFilters,
    lcConfigurationType,

    -- * Destructuring the Response
    listConfigurationsResponse,
    ListConfigurationsResponse,

    -- * Response Lenses
    lcrrsNextToken,
    lcrrsConfigurations,
    lcrrsResponseStatus,
  )
where

import Network.AWS.Discovery.Types
import Network.AWS.Lens
import Network.AWS.Pager
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'listConfigurations' smart constructor.
data ListConfigurations = ListConfigurations'
  { _lcNextToken ::
      !(Maybe Text),
    _lcMaxResults :: !(Maybe Int),
    _lcOrderBy ::
      !(Maybe [OrderByElement]),
    _lcFilters :: !(Maybe [Filter]),
    _lcConfigurationType ::
      !ConfigurationItemType
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'ListConfigurations' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lcNextToken' - Token to retrieve the next set of results. For example, if a previous call to ListConfigurations returned 100 items, but you set @ListConfigurationsRequest$maxResults@ to 10, you received a set of 10 results along with a token. Use that token in this query to get the next set of 10.
--
-- * 'lcMaxResults' - The total number of items to return. The maximum value is 100.
--
-- * 'lcOrderBy' - Certain filter criteria return output that can be sorted in ascending or descending order. For a list of output characteristics for each filter, see <https://docs.aws.amazon.com/application-discovery/latest/userguide/discovery-api-queries.html#ListConfigurations Using the ListConfigurations Action> in the /AWS Application Discovery Service User Guide/ .
--
-- * 'lcFilters' - You can filter the request using various logical operators and a /key/ -/value/ format. For example:  @{"key": "serverType", "value": "webServer"}@  For a complete list of filter options and guidance about using them with this action, see <https://docs.aws.amazon.com/application-discovery/latest/userguide/discovery-api-queries.html#ListConfigurations Using the ListConfigurations Action> in the /AWS Application Discovery Service User Guide/ .
--
-- * 'lcConfigurationType' - A valid configuration identified by Application Discovery Service.
listConfigurations ::
  -- | 'lcConfigurationType'
  ConfigurationItemType ->
  ListConfigurations
listConfigurations pConfigurationType_ =
  ListConfigurations'
    { _lcNextToken = Nothing,
      _lcMaxResults = Nothing,
      _lcOrderBy = Nothing,
      _lcFilters = Nothing,
      _lcConfigurationType = pConfigurationType_
    }

-- | Token to retrieve the next set of results. For example, if a previous call to ListConfigurations returned 100 items, but you set @ListConfigurationsRequest$maxResults@ to 10, you received a set of 10 results along with a token. Use that token in this query to get the next set of 10.
lcNextToken :: Lens' ListConfigurations (Maybe Text)
lcNextToken = lens _lcNextToken (\s a -> s {_lcNextToken = a})

-- | The total number of items to return. The maximum value is 100.
lcMaxResults :: Lens' ListConfigurations (Maybe Int)
lcMaxResults = lens _lcMaxResults (\s a -> s {_lcMaxResults = a})

-- | Certain filter criteria return output that can be sorted in ascending or descending order. For a list of output characteristics for each filter, see <https://docs.aws.amazon.com/application-discovery/latest/userguide/discovery-api-queries.html#ListConfigurations Using the ListConfigurations Action> in the /AWS Application Discovery Service User Guide/ .
lcOrderBy :: Lens' ListConfigurations [OrderByElement]
lcOrderBy = lens _lcOrderBy (\s a -> s {_lcOrderBy = a}) . _Default . _Coerce

-- | You can filter the request using various logical operators and a /key/ -/value/ format. For example:  @{"key": "serverType", "value": "webServer"}@  For a complete list of filter options and guidance about using them with this action, see <https://docs.aws.amazon.com/application-discovery/latest/userguide/discovery-api-queries.html#ListConfigurations Using the ListConfigurations Action> in the /AWS Application Discovery Service User Guide/ .
lcFilters :: Lens' ListConfigurations [Filter]
lcFilters = lens _lcFilters (\s a -> s {_lcFilters = a}) . _Default . _Coerce

-- | A valid configuration identified by Application Discovery Service.
lcConfigurationType :: Lens' ListConfigurations ConfigurationItemType
lcConfigurationType = lens _lcConfigurationType (\s a -> s {_lcConfigurationType = a})

instance AWSPager ListConfigurations where
  page rq rs
    | stop (rs ^. lcrrsNextToken) = Nothing
    | stop (rs ^. lcrrsConfigurations) = Nothing
    | otherwise =
      Just $ rq & lcNextToken .~ rs ^. lcrrsNextToken

instance AWSRequest ListConfigurations where
  type
    Rs ListConfigurations =
      ListConfigurationsResponse
  request = postJSON discovery
  response =
    receiveJSON
      ( \s h x ->
          ListConfigurationsResponse'
            <$> (x .?> "nextToken")
            <*> (x .?> "configurations" .!@ mempty)
            <*> (pure (fromEnum s))
      )

instance Hashable ListConfigurations

instance NFData ListConfigurations

instance ToHeaders ListConfigurations where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "AWSPoseidonService_V2015_11_01.ListConfigurations" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON ListConfigurations where
  toJSON ListConfigurations' {..} =
    object
      ( catMaybes
          [ ("nextToken" .=) <$> _lcNextToken,
            ("maxResults" .=) <$> _lcMaxResults,
            ("orderBy" .=) <$> _lcOrderBy,
            ("filters" .=) <$> _lcFilters,
            Just ("configurationType" .= _lcConfigurationType)
          ]
      )

instance ToPath ListConfigurations where
  toPath = const "/"

instance ToQuery ListConfigurations where
  toQuery = const mempty

-- | /See:/ 'listConfigurationsResponse' smart constructor.
data ListConfigurationsResponse = ListConfigurationsResponse'
  { _lcrrsNextToken ::
      !(Maybe Text),
    _lcrrsConfigurations ::
      !( Maybe
           [ Map
               Text
               Text
           ]
       ),
    _lcrrsResponseStatus ::
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

-- | Creates a value of 'ListConfigurationsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lcrrsNextToken' - Token to retrieve the next set of results. For example, if your call to ListConfigurations returned 100 items, but you set @ListConfigurationsRequest$maxResults@ to 10, you received a set of 10 results along with this token. Use this token in the next query to retrieve the next set of 10.
--
-- * 'lcrrsConfigurations' - Returns configuration details, including the configuration ID, attribute names, and attribute values.
--
-- * 'lcrrsResponseStatus' - -- | The response status code.
listConfigurationsResponse ::
  -- | 'lcrrsResponseStatus'
  Int ->
  ListConfigurationsResponse
listConfigurationsResponse pResponseStatus_ =
  ListConfigurationsResponse'
    { _lcrrsNextToken =
        Nothing,
      _lcrrsConfigurations = Nothing,
      _lcrrsResponseStatus = pResponseStatus_
    }

-- | Token to retrieve the next set of results. For example, if your call to ListConfigurations returned 100 items, but you set @ListConfigurationsRequest$maxResults@ to 10, you received a set of 10 results along with this token. Use this token in the next query to retrieve the next set of 10.
lcrrsNextToken :: Lens' ListConfigurationsResponse (Maybe Text)
lcrrsNextToken = lens _lcrrsNextToken (\s a -> s {_lcrrsNextToken = a})

-- | Returns configuration details, including the configuration ID, attribute names, and attribute values.
lcrrsConfigurations :: Lens' ListConfigurationsResponse [HashMap Text Text]
lcrrsConfigurations = lens _lcrrsConfigurations (\s a -> s {_lcrrsConfigurations = a}) . _Default . _Coerce

-- | -- | The response status code.
lcrrsResponseStatus :: Lens' ListConfigurationsResponse Int
lcrrsResponseStatus = lens _lcrrsResponseStatus (\s a -> s {_lcrrsResponseStatus = a})

instance NFData ListConfigurationsResponse
