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
-- Module      : Network.AWS.CloudFormation.ListStacks
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns the summary information for stacks whose status matches the specified StackStatusFilter. Summary information for stacks that have been deleted is kept for 90 days after the stack is deleted. If no StackStatusFilter is specified, summary information for all stacks is returned (including existing stacks and stacks that have been deleted).
--
--
--
-- This operation returns paginated results.
module Network.AWS.CloudFormation.ListStacks
  ( -- * Creating a Request
    listStacks,
    ListStacks,

    -- * Request Lenses
    lsNextToken,
    lsStackStatusFilter,

    -- * Destructuring the Response
    listStacksResponse,
    ListStacksResponse,

    -- * Response Lenses
    lsrrsNextToken,
    lsrrsStackSummaries,
    lsrrsResponseStatus,
  )
where

import Network.AWS.CloudFormation.Types
import Network.AWS.Lens
import Network.AWS.Pager
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | The input for 'ListStacks' action.
--
--
--
-- /See:/ 'listStacks' smart constructor.
data ListStacks = ListStacks'
  { _lsNextToken ::
      !(Maybe Text),
    _lsStackStatusFilter :: !(Maybe [StackStatus])
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'ListStacks' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lsNextToken' - A string that identifies the next page of stacks that you want to retrieve.
--
-- * 'lsStackStatusFilter' - Stack status to use as a filter. Specify one or more stack status codes to list only stacks with the specified status codes. For a complete list of stack status codes, see the @StackStatus@ parameter of the 'Stack' data type.
listStacks ::
  ListStacks
listStacks =
  ListStacks'
    { _lsNextToken = Nothing,
      _lsStackStatusFilter = Nothing
    }

-- | A string that identifies the next page of stacks that you want to retrieve.
lsNextToken :: Lens' ListStacks (Maybe Text)
lsNextToken = lens _lsNextToken (\s a -> s {_lsNextToken = a})

-- | Stack status to use as a filter. Specify one or more stack status codes to list only stacks with the specified status codes. For a complete list of stack status codes, see the @StackStatus@ parameter of the 'Stack' data type.
lsStackStatusFilter :: Lens' ListStacks [StackStatus]
lsStackStatusFilter = lens _lsStackStatusFilter (\s a -> s {_lsStackStatusFilter = a}) . _Default . _Coerce

instance AWSPager ListStacks where
  page rq rs
    | stop (rs ^. lsrrsNextToken) = Nothing
    | stop (rs ^. lsrrsStackSummaries) = Nothing
    | otherwise =
      Just $ rq & lsNextToken .~ rs ^. lsrrsNextToken

instance AWSRequest ListStacks where
  type Rs ListStacks = ListStacksResponse
  request = postQuery cloudFormation
  response =
    receiveXMLWrapper
      "ListStacksResult"
      ( \s h x ->
          ListStacksResponse'
            <$> (x .@? "NextToken")
            <*> ( x .@? "StackSummaries" .!@ mempty
                    >>= may (parseXMLList "member")
                )
            <*> (pure (fromEnum s))
      )

instance Hashable ListStacks

instance NFData ListStacks

instance ToHeaders ListStacks where
  toHeaders = const mempty

instance ToPath ListStacks where
  toPath = const "/"

instance ToQuery ListStacks where
  toQuery ListStacks' {..} =
    mconcat
      [ "Action" =: ("ListStacks" :: ByteString),
        "Version" =: ("2010-05-15" :: ByteString),
        "NextToken" =: _lsNextToken,
        "StackStatusFilter"
          =: toQuery
            (toQueryList "member" <$> _lsStackStatusFilter)
      ]

-- | The output for 'ListStacks' action.
--
--
--
-- /See:/ 'listStacksResponse' smart constructor.
data ListStacksResponse = ListStacksResponse'
  { _lsrrsNextToken ::
      !(Maybe Text),
    _lsrrsStackSummaries ::
      !(Maybe [StackSummary]),
    _lsrrsResponseStatus :: !Int
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'ListStacksResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lsrrsNextToken' - If the output exceeds 1 MB in size, a string that identifies the next page of stacks. If no additional page exists, this value is null.
--
-- * 'lsrrsStackSummaries' - A list of @StackSummary@ structures containing information about the specified stacks.
--
-- * 'lsrrsResponseStatus' - -- | The response status code.
listStacksResponse ::
  -- | 'lsrrsResponseStatus'
  Int ->
  ListStacksResponse
listStacksResponse pResponseStatus_ =
  ListStacksResponse'
    { _lsrrsNextToken = Nothing,
      _lsrrsStackSummaries = Nothing,
      _lsrrsResponseStatus = pResponseStatus_
    }

-- | If the output exceeds 1 MB in size, a string that identifies the next page of stacks. If no additional page exists, this value is null.
lsrrsNextToken :: Lens' ListStacksResponse (Maybe Text)
lsrrsNextToken = lens _lsrrsNextToken (\s a -> s {_lsrrsNextToken = a})

-- | A list of @StackSummary@ structures containing information about the specified stacks.
lsrrsStackSummaries :: Lens' ListStacksResponse [StackSummary]
lsrrsStackSummaries = lens _lsrrsStackSummaries (\s a -> s {_lsrrsStackSummaries = a}) . _Default . _Coerce

-- | -- | The response status code.
lsrrsResponseStatus :: Lens' ListStacksResponse Int
lsrrsResponseStatus = lens _lsrrsResponseStatus (\s a -> s {_lsrrsResponseStatus = a})

instance NFData ListStacksResponse
