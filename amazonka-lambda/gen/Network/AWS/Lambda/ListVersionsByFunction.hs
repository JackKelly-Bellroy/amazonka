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
-- Module      : Network.AWS.Lambda.ListVersionsByFunction
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns a list of <https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html versions> , with the version-specific configuration of each. Lambda returns up to 50 versions per call.
--
--
--
-- This operation returns paginated results.
module Network.AWS.Lambda.ListVersionsByFunction
  ( -- * Creating a Request
    listVersionsByFunction,
    ListVersionsByFunction,

    -- * Request Lenses
    lvbfMaxItems,
    lvbfMarker,
    lvbfFunctionName,

    -- * Destructuring the Response
    listVersionsByFunctionResponse,
    ListVersionsByFunctionResponse,

    -- * Response Lenses
    lvbfrrsVersions,
    lvbfrrsNextMarker,
    lvbfrrsResponseStatus,
  )
where

import Network.AWS.Lambda.Types
import Network.AWS.Lens
import Network.AWS.Pager
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'listVersionsByFunction' smart constructor.
data ListVersionsByFunction = ListVersionsByFunction'
  { _lvbfMaxItems ::
      !(Maybe Nat),
    _lvbfMarker ::
      !(Maybe Text),
    _lvbfFunctionName ::
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

-- | Creates a value of 'ListVersionsByFunction' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lvbfMaxItems' - The maximum number of versions to return.
--
-- * 'lvbfMarker' - Specify the pagination token that's returned by a previous request to retrieve the next page of results.
--
-- * 'lvbfFunctionName' - The name of the Lambda function. __Name formats__      * __Function name__ - @MyFunction@ .     * __Function ARN__ - @arn:aws:lambda:us-west-2:123456789012:function:MyFunction@ .     * __Partial ARN__ - @123456789012:function:MyFunction@ . The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.
listVersionsByFunction ::
  -- | 'lvbfFunctionName'
  Text ->
  ListVersionsByFunction
listVersionsByFunction pFunctionName_ =
  ListVersionsByFunction'
    { _lvbfMaxItems = Nothing,
      _lvbfMarker = Nothing,
      _lvbfFunctionName = pFunctionName_
    }

-- | The maximum number of versions to return.
lvbfMaxItems :: Lens' ListVersionsByFunction (Maybe Natural)
lvbfMaxItems = lens _lvbfMaxItems (\s a -> s {_lvbfMaxItems = a}) . mapping _Nat

-- | Specify the pagination token that's returned by a previous request to retrieve the next page of results.
lvbfMarker :: Lens' ListVersionsByFunction (Maybe Text)
lvbfMarker = lens _lvbfMarker (\s a -> s {_lvbfMarker = a})

-- | The name of the Lambda function. __Name formats__      * __Function name__ - @MyFunction@ .     * __Function ARN__ - @arn:aws:lambda:us-west-2:123456789012:function:MyFunction@ .     * __Partial ARN__ - @123456789012:function:MyFunction@ . The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.
lvbfFunctionName :: Lens' ListVersionsByFunction Text
lvbfFunctionName = lens _lvbfFunctionName (\s a -> s {_lvbfFunctionName = a})

instance AWSPager ListVersionsByFunction where
  page rq rs
    | stop (rs ^. lvbfrrsNextMarker) = Nothing
    | stop (rs ^. lvbfrrsVersions) = Nothing
    | otherwise =
      Just $ rq & lvbfMarker .~ rs ^. lvbfrrsNextMarker

instance AWSRequest ListVersionsByFunction where
  type
    Rs ListVersionsByFunction =
      ListVersionsByFunctionResponse
  request = get lambda
  response =
    receiveJSON
      ( \s h x ->
          ListVersionsByFunctionResponse'
            <$> (x .?> "Versions" .!@ mempty)
            <*> (x .?> "NextMarker")
            <*> (pure (fromEnum s))
      )

instance Hashable ListVersionsByFunction

instance NFData ListVersionsByFunction

instance ToHeaders ListVersionsByFunction where
  toHeaders = const mempty

instance ToPath ListVersionsByFunction where
  toPath ListVersionsByFunction' {..} =
    mconcat
      [ "/2015-03-31/functions/",
        toBS _lvbfFunctionName,
        "/versions"
      ]

instance ToQuery ListVersionsByFunction where
  toQuery ListVersionsByFunction' {..} =
    mconcat
      [ "MaxItems" =: _lvbfMaxItems,
        "Marker" =: _lvbfMarker
      ]

-- | /See:/ 'listVersionsByFunctionResponse' smart constructor.
data ListVersionsByFunctionResponse = ListVersionsByFunctionResponse'
  { _lvbfrrsVersions ::
      !( Maybe
           [FunctionConfiguration]
       ),
    _lvbfrrsNextMarker ::
      !( Maybe
           Text
       ),
    _lvbfrrsResponseStatus ::
      !Int
  }
  deriving
    ( Eq,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'ListVersionsByFunctionResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lvbfrrsVersions' - A list of Lambda function versions.
--
-- * 'lvbfrrsNextMarker' - The pagination token that's included if more results are available.
--
-- * 'lvbfrrsResponseStatus' - -- | The response status code.
listVersionsByFunctionResponse ::
  -- | 'lvbfrrsResponseStatus'
  Int ->
  ListVersionsByFunctionResponse
listVersionsByFunctionResponse pResponseStatus_ =
  ListVersionsByFunctionResponse'
    { _lvbfrrsVersions =
        Nothing,
      _lvbfrrsNextMarker = Nothing,
      _lvbfrrsResponseStatus = pResponseStatus_
    }

-- | A list of Lambda function versions.
lvbfrrsVersions :: Lens' ListVersionsByFunctionResponse [FunctionConfiguration]
lvbfrrsVersions = lens _lvbfrrsVersions (\s a -> s {_lvbfrrsVersions = a}) . _Default . _Coerce

-- | The pagination token that's included if more results are available.
lvbfrrsNextMarker :: Lens' ListVersionsByFunctionResponse (Maybe Text)
lvbfrrsNextMarker = lens _lvbfrrsNextMarker (\s a -> s {_lvbfrrsNextMarker = a})

-- | -- | The response status code.
lvbfrrsResponseStatus :: Lens' ListVersionsByFunctionResponse Int
lvbfrrsResponseStatus = lens _lvbfrrsResponseStatus (\s a -> s {_lvbfrrsResponseStatus = a})

instance NFData ListVersionsByFunctionResponse
