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
-- Module      : Network.AWS.CloudSearch.IndexDocuments
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Tells the search domain to start indexing its documents using the latest indexing options. This operation must be invoked to activate options whose 'OptionStatus' is @RequiresIndexDocuments@ .
module Network.AWS.CloudSearch.IndexDocuments
  ( -- * Creating a Request
    indexDocuments,
    IndexDocuments,

    -- * Request Lenses
    idDomainName,

    -- * Destructuring the Response
    indexDocumentsResponse,
    IndexDocumentsResponse,

    -- * Response Lenses
    idrrsFieldNames,
    idrrsResponseStatus,
  )
where

import Network.AWS.CloudSearch.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | Container for the parameters to the @'IndexDocuments' @ operation. Specifies the name of the domain you want to re-index.
--
--
--
-- /See:/ 'indexDocuments' smart constructor.
newtype IndexDocuments = IndexDocuments'
  { _idDomainName ::
      Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'IndexDocuments' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'idDomainName' - Undocumented member.
indexDocuments ::
  -- | 'idDomainName'
  Text ->
  IndexDocuments
indexDocuments pDomainName_ =
  IndexDocuments' {_idDomainName = pDomainName_}

-- | Undocumented member.
idDomainName :: Lens' IndexDocuments Text
idDomainName = lens _idDomainName (\s a -> s {_idDomainName = a})

instance AWSRequest IndexDocuments where
  type Rs IndexDocuments = IndexDocumentsResponse
  request = postQuery cloudSearch
  response =
    receiveXMLWrapper
      "IndexDocumentsResult"
      ( \s h x ->
          IndexDocumentsResponse'
            <$> ( x .@? "FieldNames" .!@ mempty
                    >>= may (parseXMLList "member")
                )
            <*> (pure (fromEnum s))
      )

instance Hashable IndexDocuments

instance NFData IndexDocuments

instance ToHeaders IndexDocuments where
  toHeaders = const mempty

instance ToPath IndexDocuments where
  toPath = const "/"

instance ToQuery IndexDocuments where
  toQuery IndexDocuments' {..} =
    mconcat
      [ "Action" =: ("IndexDocuments" :: ByteString),
        "Version" =: ("2013-01-01" :: ByteString),
        "DomainName" =: _idDomainName
      ]

-- | The result of an @IndexDocuments@ request. Contains the status of the indexing operation, including the fields being indexed.
--
--
--
-- /See:/ 'indexDocumentsResponse' smart constructor.
data IndexDocumentsResponse = IndexDocumentsResponse'
  { _idrrsFieldNames ::
      !(Maybe [Text]),
    _idrrsResponseStatus ::
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

-- | Creates a value of 'IndexDocumentsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'idrrsFieldNames' - The names of the fields that are currently being indexed.
--
-- * 'idrrsResponseStatus' - -- | The response status code.
indexDocumentsResponse ::
  -- | 'idrrsResponseStatus'
  Int ->
  IndexDocumentsResponse
indexDocumentsResponse pResponseStatus_ =
  IndexDocumentsResponse'
    { _idrrsFieldNames = Nothing,
      _idrrsResponseStatus = pResponseStatus_
    }

-- | The names of the fields that are currently being indexed.
idrrsFieldNames :: Lens' IndexDocumentsResponse [Text]
idrrsFieldNames = lens _idrrsFieldNames (\s a -> s {_idrrsFieldNames = a}) . _Default . _Coerce

-- | -- | The response status code.
idrrsResponseStatus :: Lens' IndexDocumentsResponse Int
idrrsResponseStatus = lens _idrrsResponseStatus (\s a -> s {_idrrsResponseStatus = a})

instance NFData IndexDocumentsResponse
