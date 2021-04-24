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
-- Module      : Network.AWS.IAM.ListAttachedRolePolicies
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Lists all managed policies that are attached to the specified IAM role.
--
--
-- An IAM role can also have inline policies embedded with it. To list the inline policies for a role, use 'ListRolePolicies' . For information about policies, see <https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html Managed policies and inline policies> in the /IAM User Guide/ .
--
-- You can paginate the results using the @MaxItems@ and @Marker@ parameters. You can use the @PathPrefix@ parameter to limit the list of policies to only those matching the specified path prefix. If there are no policies attached to the specified role (or none that match the specified path prefix), the operation returns an empty list.
--
--
-- This operation returns paginated results.
module Network.AWS.IAM.ListAttachedRolePolicies
  ( -- * Creating a Request
    listAttachedRolePolicies,
    ListAttachedRolePolicies,

    -- * Request Lenses
    larpPathPrefix,
    larpMaxItems,
    larpMarker,
    larpRoleName,

    -- * Destructuring the Response
    listAttachedRolePoliciesResponse,
    ListAttachedRolePoliciesResponse,

    -- * Response Lenses
    larprrsIsTruncated,
    larprrsAttachedPolicies,
    larprrsMarker,
    larprrsResponseStatus,
  )
where

import Network.AWS.IAM.Types
import Network.AWS.Lens
import Network.AWS.Pager
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'listAttachedRolePolicies' smart constructor.
data ListAttachedRolePolicies = ListAttachedRolePolicies'
  { _larpPathPrefix ::
      !(Maybe Text),
    _larpMaxItems ::
      !(Maybe Nat),
    _larpMarker ::
      !(Maybe Text),
    _larpRoleName ::
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

-- | Creates a value of 'ListAttachedRolePolicies' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'larpPathPrefix' - The path prefix for filtering the results. This parameter is optional. If it is not included, it defaults to a slash (/), listing all policies. This parameter allows (through its <http://wikipedia.org/wiki/regex regex pattern> ) a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can contain any ASCII character from the ! (@\u0021@ ) through the DEL character (@\u007F@ ), including most punctuation characters, digits, and upper and lowercased letters.
--
-- * 'larpMaxItems' - Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the @IsTruncated@ response element is @true@ . If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the @IsTruncated@ response element returns @true@ , and @Marker@ contains a value to include in the subsequent call that tells the service where to continue from.
--
-- * 'larpMarker' - Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the @Marker@ element in the response that you received to indicate where the next call should start.
--
-- * 'larpRoleName' - The name (friendly name, not ARN) of the role to list attached policies for. This parameter allows (through its <http://wikipedia.org/wiki/regex regex pattern> ) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-
listAttachedRolePolicies ::
  -- | 'larpRoleName'
  Text ->
  ListAttachedRolePolicies
listAttachedRolePolicies pRoleName_ =
  ListAttachedRolePolicies'
    { _larpPathPrefix =
        Nothing,
      _larpMaxItems = Nothing,
      _larpMarker = Nothing,
      _larpRoleName = pRoleName_
    }

-- | The path prefix for filtering the results. This parameter is optional. If it is not included, it defaults to a slash (/), listing all policies. This parameter allows (through its <http://wikipedia.org/wiki/regex regex pattern> ) a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can contain any ASCII character from the ! (@\u0021@ ) through the DEL character (@\u007F@ ), including most punctuation characters, digits, and upper and lowercased letters.
larpPathPrefix :: Lens' ListAttachedRolePolicies (Maybe Text)
larpPathPrefix = lens _larpPathPrefix (\s a -> s {_larpPathPrefix = a})

-- | Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the @IsTruncated@ response element is @true@ . If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the @IsTruncated@ response element returns @true@ , and @Marker@ contains a value to include in the subsequent call that tells the service where to continue from.
larpMaxItems :: Lens' ListAttachedRolePolicies (Maybe Natural)
larpMaxItems = lens _larpMaxItems (\s a -> s {_larpMaxItems = a}) . mapping _Nat

-- | Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the @Marker@ element in the response that you received to indicate where the next call should start.
larpMarker :: Lens' ListAttachedRolePolicies (Maybe Text)
larpMarker = lens _larpMarker (\s a -> s {_larpMarker = a})

-- | The name (friendly name, not ARN) of the role to list attached policies for. This parameter allows (through its <http://wikipedia.org/wiki/regex regex pattern> ) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-
larpRoleName :: Lens' ListAttachedRolePolicies Text
larpRoleName = lens _larpRoleName (\s a -> s {_larpRoleName = a})

instance AWSPager ListAttachedRolePolicies where
  page rq rs
    | stop (rs ^. larprrsIsTruncated) = Nothing
    | isNothing (rs ^. larprrsMarker) = Nothing
    | otherwise =
      Just $ rq & larpMarker .~ rs ^. larprrsMarker

instance AWSRequest ListAttachedRolePolicies where
  type
    Rs ListAttachedRolePolicies =
      ListAttachedRolePoliciesResponse
  request = postQuery iam
  response =
    receiveXMLWrapper
      "ListAttachedRolePoliciesResult"
      ( \s h x ->
          ListAttachedRolePoliciesResponse'
            <$> (x .@? "IsTruncated")
            <*> ( x .@? "AttachedPolicies" .!@ mempty
                    >>= may (parseXMLList "member")
                )
            <*> (x .@? "Marker")
            <*> (pure (fromEnum s))
      )

instance Hashable ListAttachedRolePolicies

instance NFData ListAttachedRolePolicies

instance ToHeaders ListAttachedRolePolicies where
  toHeaders = const mempty

instance ToPath ListAttachedRolePolicies where
  toPath = const "/"

instance ToQuery ListAttachedRolePolicies where
  toQuery ListAttachedRolePolicies' {..} =
    mconcat
      [ "Action"
          =: ("ListAttachedRolePolicies" :: ByteString),
        "Version" =: ("2010-05-08" :: ByteString),
        "PathPrefix" =: _larpPathPrefix,
        "MaxItems" =: _larpMaxItems,
        "Marker" =: _larpMarker,
        "RoleName" =: _larpRoleName
      ]

-- | Contains the response to a successful 'ListAttachedRolePolicies' request.
--
--
--
-- /See:/ 'listAttachedRolePoliciesResponse' smart constructor.
data ListAttachedRolePoliciesResponse = ListAttachedRolePoliciesResponse'
  { _larprrsIsTruncated ::
      !( Maybe
           Bool
       ),
    _larprrsAttachedPolicies ::
      !( Maybe
           [AttachedPolicy]
       ),
    _larprrsMarker ::
      !( Maybe
           Text
       ),
    _larprrsResponseStatus ::
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

-- | Creates a value of 'ListAttachedRolePoliciesResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'larprrsIsTruncated' - A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the @Marker@ request parameter to retrieve more items. Note that IAM might return fewer than the @MaxItems@ number of results even when there are more results available. We recommend that you check @IsTruncated@ after every call to ensure that you receive all your results.
--
-- * 'larprrsAttachedPolicies' - A list of the attached policies.
--
-- * 'larprrsMarker' - When @IsTruncated@ is @true@ , this element is present and contains the value to use for the @Marker@ parameter in a subsequent pagination request.
--
-- * 'larprrsResponseStatus' - -- | The response status code.
listAttachedRolePoliciesResponse ::
  -- | 'larprrsResponseStatus'
  Int ->
  ListAttachedRolePoliciesResponse
listAttachedRolePoliciesResponse pResponseStatus_ =
  ListAttachedRolePoliciesResponse'
    { _larprrsIsTruncated =
        Nothing,
      _larprrsAttachedPolicies = Nothing,
      _larprrsMarker = Nothing,
      _larprrsResponseStatus = pResponseStatus_
    }

-- | A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the @Marker@ request parameter to retrieve more items. Note that IAM might return fewer than the @MaxItems@ number of results even when there are more results available. We recommend that you check @IsTruncated@ after every call to ensure that you receive all your results.
larprrsIsTruncated :: Lens' ListAttachedRolePoliciesResponse (Maybe Bool)
larprrsIsTruncated = lens _larprrsIsTruncated (\s a -> s {_larprrsIsTruncated = a})

-- | A list of the attached policies.
larprrsAttachedPolicies :: Lens' ListAttachedRolePoliciesResponse [AttachedPolicy]
larprrsAttachedPolicies = lens _larprrsAttachedPolicies (\s a -> s {_larprrsAttachedPolicies = a}) . _Default . _Coerce

-- | When @IsTruncated@ is @true@ , this element is present and contains the value to use for the @Marker@ parameter in a subsequent pagination request.
larprrsMarker :: Lens' ListAttachedRolePoliciesResponse (Maybe Text)
larprrsMarker = lens _larprrsMarker (\s a -> s {_larprrsMarker = a})

-- | -- | The response status code.
larprrsResponseStatus :: Lens' ListAttachedRolePoliciesResponse Int
larprrsResponseStatus = lens _larprrsResponseStatus (\s a -> s {_larprrsResponseStatus = a})

instance NFData ListAttachedRolePoliciesResponse
