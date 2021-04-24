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
-- Module      : Network.AWS.CloudSearch.CreateDomain
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates a new search domain. For more information, see <http://docs.aws.amazon.com/cloudsearch/latest/developerguide/creating-domains.html Creating a Search Domain> in the /Amazon CloudSearch Developer Guide/ .
module Network.AWS.CloudSearch.CreateDomain
  ( -- * Creating a Request
    createDomain,
    CreateDomain,

    -- * Request Lenses
    cdDomainName,

    -- * Destructuring the Response
    createDomainResponse,
    CreateDomainResponse,

    -- * Response Lenses
    cdrrsDomainStatus,
    cdrrsResponseStatus,
  )
where

import Network.AWS.CloudSearch.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | Container for the parameters to the @'CreateDomain' @ operation. Specifies a name for the new search domain.
--
--
--
-- /See:/ 'createDomain' smart constructor.
newtype CreateDomain = CreateDomain'
  { _cdDomainName ::
      Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'CreateDomain' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cdDomainName' - A name for the domain you are creating. Allowed characters are a-z (lower-case letters), 0-9, and hyphen (-). Domain names must start with a letter or number and be at least 3 and no more than 28 characters long.
createDomain ::
  -- | 'cdDomainName'
  Text ->
  CreateDomain
createDomain pDomainName_ =
  CreateDomain' {_cdDomainName = pDomainName_}

-- | A name for the domain you are creating. Allowed characters are a-z (lower-case letters), 0-9, and hyphen (-). Domain names must start with a letter or number and be at least 3 and no more than 28 characters long.
cdDomainName :: Lens' CreateDomain Text
cdDomainName = lens _cdDomainName (\s a -> s {_cdDomainName = a})

instance AWSRequest CreateDomain where
  type Rs CreateDomain = CreateDomainResponse
  request = postQuery cloudSearch
  response =
    receiveXMLWrapper
      "CreateDomainResult"
      ( \s h x ->
          CreateDomainResponse'
            <$> (x .@? "DomainStatus") <*> (pure (fromEnum s))
      )

instance Hashable CreateDomain

instance NFData CreateDomain

instance ToHeaders CreateDomain where
  toHeaders = const mempty

instance ToPath CreateDomain where
  toPath = const "/"

instance ToQuery CreateDomain where
  toQuery CreateDomain' {..} =
    mconcat
      [ "Action" =: ("CreateDomain" :: ByteString),
        "Version" =: ("2013-01-01" :: ByteString),
        "DomainName" =: _cdDomainName
      ]

-- | The result of a @CreateDomainRequest@ . Contains the status of a newly created domain.
--
--
--
-- /See:/ 'createDomainResponse' smart constructor.
data CreateDomainResponse = CreateDomainResponse'
  { _cdrrsDomainStatus ::
      !(Maybe DomainStatus),
    _cdrrsResponseStatus :: !Int
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'CreateDomainResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cdrrsDomainStatus' - Undocumented member.
--
-- * 'cdrrsResponseStatus' - -- | The response status code.
createDomainResponse ::
  -- | 'cdrrsResponseStatus'
  Int ->
  CreateDomainResponse
createDomainResponse pResponseStatus_ =
  CreateDomainResponse'
    { _cdrrsDomainStatus = Nothing,
      _cdrrsResponseStatus = pResponseStatus_
    }

-- | Undocumented member.
cdrrsDomainStatus :: Lens' CreateDomainResponse (Maybe DomainStatus)
cdrrsDomainStatus = lens _cdrrsDomainStatus (\s a -> s {_cdrrsDomainStatus = a})

-- | -- | The response status code.
cdrrsResponseStatus :: Lens' CreateDomainResponse Int
cdrrsResponseStatus = lens _cdrrsResponseStatus (\s a -> s {_cdrrsResponseStatus = a})

instance NFData CreateDomainResponse
