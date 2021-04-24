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
-- Module      : Network.AWS.Kinesis.ListStreamConsumers
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Lists the consumers registered to receive data from a stream using enhanced fan-out, and provides information about each consumer.
--
--
-- This operation has a limit of 5 transactions per second per stream.
--
--
-- This operation returns paginated results.
module Network.AWS.Kinesis.ListStreamConsumers
  ( -- * Creating a Request
    listStreamConsumers,
    ListStreamConsumers,

    -- * Request Lenses
    lscNextToken,
    lscMaxResults,
    lscStreamCreationTimestamp,
    lscStreamARN,

    -- * Destructuring the Response
    listStreamConsumersResponse,
    ListStreamConsumersResponse,

    -- * Response Lenses
    lscrrsNextToken,
    lscrrsConsumers,
    lscrrsResponseStatus,
  )
where

import Network.AWS.Kinesis.Types
import Network.AWS.Lens
import Network.AWS.Pager
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'listStreamConsumers' smart constructor.
data ListStreamConsumers = ListStreamConsumers'
  { _lscNextToken ::
      !(Maybe Text),
    _lscMaxResults :: !(Maybe Nat),
    _lscStreamCreationTimestamp ::
      !(Maybe POSIX),
    _lscStreamARN :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'ListStreamConsumers' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lscNextToken' - When the number of consumers that are registered with the data stream is greater than the default value for the @MaxResults@ parameter, or if you explicitly specify a value for @MaxResults@ that is less than the number of consumers that are registered with the data stream, the response includes a pagination token named @NextToken@ . You can specify this @NextToken@ value in a subsequent call to @ListStreamConsumers@ to list the next set of registered consumers. Don't specify @StreamName@ or @StreamCreationTimestamp@ if you specify @NextToken@ because the latter unambiguously identifies the stream. You can optionally specify a value for the @MaxResults@ parameter when you specify @NextToken@ . If you specify a @MaxResults@ value that is less than the number of consumers that the operation returns if you don't specify @MaxResults@ , the response will contain a new @NextToken@ value. You can use the new @NextToken@ value in a subsequent call to the @ListStreamConsumers@ operation to list the next set of consumers. /Important:/ Tokens expire after 300 seconds. When you obtain a value for @NextToken@ in the response to a call to @ListStreamConsumers@ , you have 300 seconds to use that value. If you specify an expired token in a call to @ListStreamConsumers@ , you get @ExpiredNextTokenException@ .
--
-- * 'lscMaxResults' - The maximum number of consumers that you want a single call of @ListStreamConsumers@ to return.
--
-- * 'lscStreamCreationTimestamp' - Specify this input parameter to distinguish data streams that have the same name. For example, if you create a data stream and then delete it, and you later create another data stream with the same name, you can use this input parameter to specify which of the two streams you want to list the consumers for.  You can't specify this parameter if you specify the NextToken parameter.
--
-- * 'lscStreamARN' - The ARN of the Kinesis data stream for which you want to list the registered consumers. For more information, see <https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams Amazon Resource Names (ARNs) and AWS Service Namespaces> .
listStreamConsumers ::
  -- | 'lscStreamARN'
  Text ->
  ListStreamConsumers
listStreamConsumers pStreamARN_ =
  ListStreamConsumers'
    { _lscNextToken = Nothing,
      _lscMaxResults = Nothing,
      _lscStreamCreationTimestamp = Nothing,
      _lscStreamARN = pStreamARN_
    }

-- | When the number of consumers that are registered with the data stream is greater than the default value for the @MaxResults@ parameter, or if you explicitly specify a value for @MaxResults@ that is less than the number of consumers that are registered with the data stream, the response includes a pagination token named @NextToken@ . You can specify this @NextToken@ value in a subsequent call to @ListStreamConsumers@ to list the next set of registered consumers. Don't specify @StreamName@ or @StreamCreationTimestamp@ if you specify @NextToken@ because the latter unambiguously identifies the stream. You can optionally specify a value for the @MaxResults@ parameter when you specify @NextToken@ . If you specify a @MaxResults@ value that is less than the number of consumers that the operation returns if you don't specify @MaxResults@ , the response will contain a new @NextToken@ value. You can use the new @NextToken@ value in a subsequent call to the @ListStreamConsumers@ operation to list the next set of consumers. /Important:/ Tokens expire after 300 seconds. When you obtain a value for @NextToken@ in the response to a call to @ListStreamConsumers@ , you have 300 seconds to use that value. If you specify an expired token in a call to @ListStreamConsumers@ , you get @ExpiredNextTokenException@ .
lscNextToken :: Lens' ListStreamConsumers (Maybe Text)
lscNextToken = lens _lscNextToken (\s a -> s {_lscNextToken = a})

-- | The maximum number of consumers that you want a single call of @ListStreamConsumers@ to return.
lscMaxResults :: Lens' ListStreamConsumers (Maybe Natural)
lscMaxResults = lens _lscMaxResults (\s a -> s {_lscMaxResults = a}) . mapping _Nat

-- | Specify this input parameter to distinguish data streams that have the same name. For example, if you create a data stream and then delete it, and you later create another data stream with the same name, you can use this input parameter to specify which of the two streams you want to list the consumers for.  You can't specify this parameter if you specify the NextToken parameter.
lscStreamCreationTimestamp :: Lens' ListStreamConsumers (Maybe UTCTime)
lscStreamCreationTimestamp = lens _lscStreamCreationTimestamp (\s a -> s {_lscStreamCreationTimestamp = a}) . mapping _Time

-- | The ARN of the Kinesis data stream for which you want to list the registered consumers. For more information, see <https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams Amazon Resource Names (ARNs) and AWS Service Namespaces> .
lscStreamARN :: Lens' ListStreamConsumers Text
lscStreamARN = lens _lscStreamARN (\s a -> s {_lscStreamARN = a})

instance AWSPager ListStreamConsumers where
  page rq rs
    | stop (rs ^. lscrrsNextToken) = Nothing
    | stop (rs ^. lscrrsConsumers) = Nothing
    | otherwise =
      Just $ rq & lscNextToken .~ rs ^. lscrrsNextToken

instance AWSRequest ListStreamConsumers where
  type
    Rs ListStreamConsumers =
      ListStreamConsumersResponse
  request = postJSON kinesis
  response =
    receiveJSON
      ( \s h x ->
          ListStreamConsumersResponse'
            <$> (x .?> "NextToken")
            <*> (x .?> "Consumers" .!@ mempty)
            <*> (pure (fromEnum s))
      )

instance Hashable ListStreamConsumers

instance NFData ListStreamConsumers

instance ToHeaders ListStreamConsumers where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "Kinesis_20131202.ListStreamConsumers" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON ListStreamConsumers where
  toJSON ListStreamConsumers' {..} =
    object
      ( catMaybes
          [ ("NextToken" .=) <$> _lscNextToken,
            ("MaxResults" .=) <$> _lscMaxResults,
            ("StreamCreationTimestamp" .=)
              <$> _lscStreamCreationTimestamp,
            Just ("StreamARN" .= _lscStreamARN)
          ]
      )

instance ToPath ListStreamConsumers where
  toPath = const "/"

instance ToQuery ListStreamConsumers where
  toQuery = const mempty

-- | /See:/ 'listStreamConsumersResponse' smart constructor.
data ListStreamConsumersResponse = ListStreamConsumersResponse'
  { _lscrrsNextToken ::
      !(Maybe Text),
    _lscrrsConsumers ::
      !( Maybe
           [Consumer]
       ),
    _lscrrsResponseStatus ::
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

-- | Creates a value of 'ListStreamConsumersResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lscrrsNextToken' - When the number of consumers that are registered with the data stream is greater than the default value for the @MaxResults@ parameter, or if you explicitly specify a value for @MaxResults@ that is less than the number of registered consumers, the response includes a pagination token named @NextToken@ . You can specify this @NextToken@ value in a subsequent call to @ListStreamConsumers@ to list the next set of registered consumers. For more information about the use of this pagination token when calling the @ListStreamConsumers@ operation, see 'ListStreamConsumersInput$NextToken' . /Important:/ Tokens expire after 300 seconds. When you obtain a value for @NextToken@ in the response to a call to @ListStreamConsumers@ , you have 300 seconds to use that value. If you specify an expired token in a call to @ListStreamConsumers@ , you get @ExpiredNextTokenException@ .
--
-- * 'lscrrsConsumers' - An array of JSON objects. Each object represents one registered consumer.
--
-- * 'lscrrsResponseStatus' - -- | The response status code.
listStreamConsumersResponse ::
  -- | 'lscrrsResponseStatus'
  Int ->
  ListStreamConsumersResponse
listStreamConsumersResponse pResponseStatus_ =
  ListStreamConsumersResponse'
    { _lscrrsNextToken =
        Nothing,
      _lscrrsConsumers = Nothing,
      _lscrrsResponseStatus = pResponseStatus_
    }

-- | When the number of consumers that are registered with the data stream is greater than the default value for the @MaxResults@ parameter, or if you explicitly specify a value for @MaxResults@ that is less than the number of registered consumers, the response includes a pagination token named @NextToken@ . You can specify this @NextToken@ value in a subsequent call to @ListStreamConsumers@ to list the next set of registered consumers. For more information about the use of this pagination token when calling the @ListStreamConsumers@ operation, see 'ListStreamConsumersInput$NextToken' . /Important:/ Tokens expire after 300 seconds. When you obtain a value for @NextToken@ in the response to a call to @ListStreamConsumers@ , you have 300 seconds to use that value. If you specify an expired token in a call to @ListStreamConsumers@ , you get @ExpiredNextTokenException@ .
lscrrsNextToken :: Lens' ListStreamConsumersResponse (Maybe Text)
lscrrsNextToken = lens _lscrrsNextToken (\s a -> s {_lscrrsNextToken = a})

-- | An array of JSON objects. Each object represents one registered consumer.
lscrrsConsumers :: Lens' ListStreamConsumersResponse [Consumer]
lscrrsConsumers = lens _lscrrsConsumers (\s a -> s {_lscrrsConsumers = a}) . _Default . _Coerce

-- | -- | The response status code.
lscrrsResponseStatus :: Lens' ListStreamConsumersResponse Int
lscrrsResponseStatus = lens _lscrrsResponseStatus (\s a -> s {_lscrrsResponseStatus = a})

instance NFData ListStreamConsumersResponse
