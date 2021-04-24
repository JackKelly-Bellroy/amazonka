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
-- Module      : Network.AWS.IoT.ListProvisioningTemplateVersions
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- A list of fleet provisioning template versions.
--
--
--
-- This operation returns paginated results.
module Network.AWS.IoT.ListProvisioningTemplateVersions
  ( -- * Creating a Request
    listProvisioningTemplateVersions,
    ListProvisioningTemplateVersions,

    -- * Request Lenses
    lptvNextToken,
    lptvMaxResults,
    lptvTemplateName,

    -- * Destructuring the Response
    listProvisioningTemplateVersionsResponse,
    ListProvisioningTemplateVersionsResponse,

    -- * Response Lenses
    lptvrrsNextToken,
    lptvrrsVersions,
    lptvrrsResponseStatus,
  )
where

import Network.AWS.IoT.Types
import Network.AWS.Lens
import Network.AWS.Pager
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'listProvisioningTemplateVersions' smart constructor.
data ListProvisioningTemplateVersions = ListProvisioningTemplateVersions'
  { _lptvNextToken ::
      !( Maybe
           Text
       ),
    _lptvMaxResults ::
      !( Maybe
           Nat
       ),
    _lptvTemplateName ::
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

-- | Creates a value of 'ListProvisioningTemplateVersions' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lptvNextToken' - A token to retrieve the next set of results.
--
-- * 'lptvMaxResults' - The maximum number of results to return at one time.
--
-- * 'lptvTemplateName' - The name of the fleet provisioning template.
listProvisioningTemplateVersions ::
  -- | 'lptvTemplateName'
  Text ->
  ListProvisioningTemplateVersions
listProvisioningTemplateVersions pTemplateName_ =
  ListProvisioningTemplateVersions'
    { _lptvNextToken =
        Nothing,
      _lptvMaxResults = Nothing,
      _lptvTemplateName = pTemplateName_
    }

-- | A token to retrieve the next set of results.
lptvNextToken :: Lens' ListProvisioningTemplateVersions (Maybe Text)
lptvNextToken = lens _lptvNextToken (\s a -> s {_lptvNextToken = a})

-- | The maximum number of results to return at one time.
lptvMaxResults :: Lens' ListProvisioningTemplateVersions (Maybe Natural)
lptvMaxResults = lens _lptvMaxResults (\s a -> s {_lptvMaxResults = a}) . mapping _Nat

-- | The name of the fleet provisioning template.
lptvTemplateName :: Lens' ListProvisioningTemplateVersions Text
lptvTemplateName = lens _lptvTemplateName (\s a -> s {_lptvTemplateName = a})

instance AWSPager ListProvisioningTemplateVersions where
  page rq rs
    | stop (rs ^. lptvrrsNextToken) = Nothing
    | stop (rs ^. lptvrrsVersions) = Nothing
    | otherwise =
      Just $ rq & lptvNextToken .~ rs ^. lptvrrsNextToken

instance AWSRequest ListProvisioningTemplateVersions where
  type
    Rs ListProvisioningTemplateVersions =
      ListProvisioningTemplateVersionsResponse
  request = get ioT
  response =
    receiveJSON
      ( \s h x ->
          ListProvisioningTemplateVersionsResponse'
            <$> (x .?> "nextToken")
            <*> (x .?> "versions" .!@ mempty)
            <*> (pure (fromEnum s))
      )

instance Hashable ListProvisioningTemplateVersions

instance NFData ListProvisioningTemplateVersions

instance ToHeaders ListProvisioningTemplateVersions where
  toHeaders = const mempty

instance ToPath ListProvisioningTemplateVersions where
  toPath ListProvisioningTemplateVersions' {..} =
    mconcat
      [ "/provisioning-templates/",
        toBS _lptvTemplateName,
        "/versions"
      ]

instance ToQuery ListProvisioningTemplateVersions where
  toQuery ListProvisioningTemplateVersions' {..} =
    mconcat
      [ "nextToken" =: _lptvNextToken,
        "maxResults" =: _lptvMaxResults
      ]

-- | /See:/ 'listProvisioningTemplateVersionsResponse' smart constructor.
data ListProvisioningTemplateVersionsResponse = ListProvisioningTemplateVersionsResponse'
  { _lptvrrsNextToken ::
      !( Maybe
           Text
       ),
    _lptvrrsVersions ::
      !( Maybe
           [ProvisioningTemplateVersionSummary]
       ),
    _lptvrrsResponseStatus ::
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

-- | Creates a value of 'ListProvisioningTemplateVersionsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lptvrrsNextToken' - A token to retrieve the next set of results.
--
-- * 'lptvrrsVersions' - The list of fleet provisioning template versions.
--
-- * 'lptvrrsResponseStatus' - -- | The response status code.
listProvisioningTemplateVersionsResponse ::
  -- | 'lptvrrsResponseStatus'
  Int ->
  ListProvisioningTemplateVersionsResponse
listProvisioningTemplateVersionsResponse
  pResponseStatus_ =
    ListProvisioningTemplateVersionsResponse'
      { _lptvrrsNextToken =
          Nothing,
        _lptvrrsVersions = Nothing,
        _lptvrrsResponseStatus =
          pResponseStatus_
      }

-- | A token to retrieve the next set of results.
lptvrrsNextToken :: Lens' ListProvisioningTemplateVersionsResponse (Maybe Text)
lptvrrsNextToken = lens _lptvrrsNextToken (\s a -> s {_lptvrrsNextToken = a})

-- | The list of fleet provisioning template versions.
lptvrrsVersions :: Lens' ListProvisioningTemplateVersionsResponse [ProvisioningTemplateVersionSummary]
lptvrrsVersions = lens _lptvrrsVersions (\s a -> s {_lptvrrsVersions = a}) . _Default . _Coerce

-- | -- | The response status code.
lptvrrsResponseStatus :: Lens' ListProvisioningTemplateVersionsResponse Int
lptvrrsResponseStatus = lens _lptvrrsResponseStatus (\s a -> s {_lptvrrsResponseStatus = a})

instance
  NFData
    ListProvisioningTemplateVersionsResponse
