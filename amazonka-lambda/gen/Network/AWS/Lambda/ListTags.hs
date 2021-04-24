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
-- Module      : Network.AWS.Lambda.ListTags
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns a function's <https://docs.aws.amazon.com/lambda/latest/dg/tagging.html tags> . You can also view tags with 'GetFunction' .
module Network.AWS.Lambda.ListTags
  ( -- * Creating a Request
    listTags,
    ListTags,

    -- * Request Lenses
    ltResource,

    -- * Destructuring the Response
    listTagsResponse,
    ListTagsResponse,

    -- * Response Lenses
    ltrrsTags,
    ltrrsResponseStatus,
  )
where

import Network.AWS.Lambda.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'listTags' smart constructor.
newtype ListTags = ListTags' {_ltResource :: Text}
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'ListTags' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ltResource' - The function's Amazon Resource Name (ARN).
listTags ::
  -- | 'ltResource'
  Text ->
  ListTags
listTags pResource_ =
  ListTags' {_ltResource = pResource_}

-- | The function's Amazon Resource Name (ARN).
ltResource :: Lens' ListTags Text
ltResource = lens _ltResource (\s a -> s {_ltResource = a})

instance AWSRequest ListTags where
  type Rs ListTags = ListTagsResponse
  request = get lambda
  response =
    receiveJSON
      ( \s h x ->
          ListTagsResponse'
            <$> (x .?> "Tags" .!@ mempty) <*> (pure (fromEnum s))
      )

instance Hashable ListTags

instance NFData ListTags

instance ToHeaders ListTags where
  toHeaders = const mempty

instance ToPath ListTags where
  toPath ListTags' {..} =
    mconcat ["/2017-03-31/tags/", toBS _ltResource]

instance ToQuery ListTags where
  toQuery = const mempty

-- | /See:/ 'listTagsResponse' smart constructor.
data ListTagsResponse = ListTagsResponse'
  { _ltrrsTags ::
      !(Maybe (Map Text Text)),
    _ltrrsResponseStatus :: !Int
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'ListTagsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ltrrsTags' - The function's tags.
--
-- * 'ltrrsResponseStatus' - -- | The response status code.
listTagsResponse ::
  -- | 'ltrrsResponseStatus'
  Int ->
  ListTagsResponse
listTagsResponse pResponseStatus_ =
  ListTagsResponse'
    { _ltrrsTags = Nothing,
      _ltrrsResponseStatus = pResponseStatus_
    }

-- | The function's tags.
ltrrsTags :: Lens' ListTagsResponse (HashMap Text Text)
ltrrsTags = lens _ltrrsTags (\s a -> s {_ltrrsTags = a}) . _Default . _Map

-- | -- | The response status code.
ltrrsResponseStatus :: Lens' ListTagsResponse Int
ltrrsResponseStatus = lens _ltrrsResponseStatus (\s a -> s {_ltrrsResponseStatus = a})

instance NFData ListTagsResponse
