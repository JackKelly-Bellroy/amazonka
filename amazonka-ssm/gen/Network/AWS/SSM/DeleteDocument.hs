{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.SSM.DeleteDocument
-- Copyright   : (c) 2013-2015 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- | Deletes the specified configuration document.
--
-- You must use DeleteAssociation to disassociate all instances that are
-- associated with the configuration document before you can delete it.
--
-- <http://docs.aws.amazon.com/ssm/latest/APIReference/API_DeleteDocument.html>
module Network.AWS.SSM.DeleteDocument
    (
    -- * Request
      DeleteDocument
    -- ** Request constructor
    , deleteDocument
    -- ** Request lenses
    , dName

    -- * Response
    , DeleteDocumentResponse
    -- ** Response constructor
    , deleteDocumentResponse
    ) where

import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.SSM.Types

-- | /See:/ 'deleteDocument' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dName'
newtype DeleteDocument = DeleteDocument'{_dName :: Text} deriving (Eq, Read, Show)

-- | 'DeleteDocument' smart constructor.
deleteDocument :: Text -> DeleteDocument
deleteDocument pName = DeleteDocument'{_dName = pName};

-- | The name of the configuration document.
dName :: Lens' DeleteDocument Text
dName = lens _dName (\ s a -> s{_dName = a});

instance AWSRequest DeleteDocument where
        type Sv DeleteDocument = SSM
        type Rs DeleteDocument = DeleteDocumentResponse
        request = postJSON
        response = receiveNull DeleteDocumentResponse'

instance ToHeaders DeleteDocument where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("AmazonSSM.DeleteDocument" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DeleteDocument where
        toJSON DeleteDocument'{..}
          = object ["Name" .= _dName]

instance ToPath DeleteDocument where
        toPath = const "/"

instance ToQuery DeleteDocument where
        toQuery = const mempty

-- | /See:/ 'deleteDocumentResponse' smart constructor.
data DeleteDocumentResponse = DeleteDocumentResponse' deriving (Eq, Read, Show)

-- | 'DeleteDocumentResponse' smart constructor.
deleteDocumentResponse :: DeleteDocumentResponse
deleteDocumentResponse = DeleteDocumentResponse';
