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
-- Module      : Network.AWS.IoT.ListTagsForResource
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Lists the tags (metadata) you have assigned to the resource.
--
--
--
-- This operation returns paginated results.
module Network.AWS.IoT.ListTagsForResource
  ( -- * Creating a Request
    listTagsForResource,
    ListTagsForResource,

    -- * Request Lenses
    ltfrNextToken,
    ltfrResourceARN,

    -- * Destructuring the Response
    listTagsForResourceResponse,
    ListTagsForResourceResponse,

    -- * Response Lenses
    ltfrrrsNextToken,
    ltfrrrsTags,
    ltfrrrsResponseStatus,
  )
where

import Network.AWS.IoT.Types
import Network.AWS.Lens
import Network.AWS.Pager
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'listTagsForResource' smart constructor.
data ListTagsForResource = ListTagsForResource'
  { _ltfrNextToken ::
      !(Maybe Text),
    _ltfrResourceARN :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'ListTagsForResource' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ltfrNextToken' - To retrieve the next set of results, the @nextToken@ value from a previous response; otherwise __null__ to receive the first set of results.
--
-- * 'ltfrResourceARN' - The ARN of the resource.
listTagsForResource ::
  -- | 'ltfrResourceARN'
  Text ->
  ListTagsForResource
listTagsForResource pResourceARN_ =
  ListTagsForResource'
    { _ltfrNextToken = Nothing,
      _ltfrResourceARN = pResourceARN_
    }

-- | To retrieve the next set of results, the @nextToken@ value from a previous response; otherwise __null__ to receive the first set of results.
ltfrNextToken :: Lens' ListTagsForResource (Maybe Text)
ltfrNextToken = lens _ltfrNextToken (\s a -> s {_ltfrNextToken = a})

-- | The ARN of the resource.
ltfrResourceARN :: Lens' ListTagsForResource Text
ltfrResourceARN = lens _ltfrResourceARN (\s a -> s {_ltfrResourceARN = a})

instance AWSPager ListTagsForResource where
  page rq rs
    | stop (rs ^. ltfrrrsNextToken) = Nothing
    | stop (rs ^. ltfrrrsTags) = Nothing
    | otherwise =
      Just $ rq & ltfrNextToken .~ rs ^. ltfrrrsNextToken

instance AWSRequest ListTagsForResource where
  type
    Rs ListTagsForResource =
      ListTagsForResourceResponse
  request = get ioT
  response =
    receiveJSON
      ( \s h x ->
          ListTagsForResourceResponse'
            <$> (x .?> "nextToken")
            <*> (x .?> "tags" .!@ mempty)
            <*> (pure (fromEnum s))
      )

instance Hashable ListTagsForResource

instance NFData ListTagsForResource

instance ToHeaders ListTagsForResource where
  toHeaders = const mempty

instance ToPath ListTagsForResource where
  toPath = const "/tags"

instance ToQuery ListTagsForResource where
  toQuery ListTagsForResource' {..} =
    mconcat
      [ "nextToken" =: _ltfrNextToken,
        "resourceArn" =: _ltfrResourceARN
      ]

-- | /See:/ 'listTagsForResourceResponse' smart constructor.
data ListTagsForResourceResponse = ListTagsForResourceResponse'
  { _ltfrrrsNextToken ::
      !(Maybe Text),
    _ltfrrrsTags ::
      !(Maybe [Tag]),
    _ltfrrrsResponseStatus ::
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

-- | Creates a value of 'ListTagsForResourceResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ltfrrrsNextToken' - The token to use to get the next set of results, or __null__ if there are no additional results.
--
-- * 'ltfrrrsTags' - The list of tags assigned to the resource.
--
-- * 'ltfrrrsResponseStatus' - -- | The response status code.
listTagsForResourceResponse ::
  -- | 'ltfrrrsResponseStatus'
  Int ->
  ListTagsForResourceResponse
listTagsForResourceResponse pResponseStatus_ =
  ListTagsForResourceResponse'
    { _ltfrrrsNextToken =
        Nothing,
      _ltfrrrsTags = Nothing,
      _ltfrrrsResponseStatus = pResponseStatus_
    }

-- | The token to use to get the next set of results, or __null__ if there are no additional results.
ltfrrrsNextToken :: Lens' ListTagsForResourceResponse (Maybe Text)
ltfrrrsNextToken = lens _ltfrrrsNextToken (\s a -> s {_ltfrrrsNextToken = a})

-- | The list of tags assigned to the resource.
ltfrrrsTags :: Lens' ListTagsForResourceResponse [Tag]
ltfrrrsTags = lens _ltfrrrsTags (\s a -> s {_ltfrrrsTags = a}) . _Default . _Coerce

-- | -- | The response status code.
ltfrrrsResponseStatus :: Lens' ListTagsForResourceResponse Int
ltfrrrsResponseStatus = lens _ltfrrrsResponseStatus (\s a -> s {_ltfrrrsResponseStatus = a})

instance NFData ListTagsForResourceResponse
