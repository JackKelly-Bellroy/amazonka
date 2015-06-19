{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.Route53.GetChange
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

-- | This action returns the current status of a change batch request. The
-- status is one of the following values:
--
-- - @PENDING@ indicates that the changes in this request have not
-- replicated to all Route 53 DNS servers. This is the initial status of
-- all change batch requests.
--
-- - @INSYNC@ indicates that the changes have replicated to all Amazon
-- Route 53 DNS servers.
--
-- <http://docs.aws.amazon.com/Route53/latest/APIReference/API_GetChange.html>
module Network.AWS.Route53.GetChange
    (
    -- * Request
      GetChange
    -- ** Request constructor
    , getChange
    -- ** Request lenses
    , gcId

    -- * Response
    , GetChangeResponse
    -- ** Response constructor
    , getChangeResponse
    -- ** Response lenses
    , gcrChangeInfo
    ) where

import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Route53.Types

-- | /See:/ 'getChange' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'gcId'
newtype GetChange = GetChange'{_gcId :: Text} deriving (Eq, Read, Show)

-- | 'GetChange' smart constructor.
getChange :: Text -> GetChange
getChange pId = GetChange'{_gcId = pId};

-- | The ID of the change batch request. The value that you specify here is
-- the value that @ChangeResourceRecordSets@ returned in the Id element
-- when you submitted the request.
gcId :: Lens' GetChange Text
gcId = lens _gcId (\ s a -> s{_gcId = a});

instance AWSRequest GetChange where
        type Sv GetChange = Route53
        type Rs GetChange = GetChangeResponse
        request = get
        response
          = receiveXML
              (\ s h x ->
                 GetChangeResponse' <$> (x .@ "ChangeInfo"))

instance ToHeaders GetChange where
        toHeaders = const mempty

instance ToPath GetChange where
        toPath GetChange'{..}
          = mconcat ["/2013-04-01/change/", toText _gcId]

instance ToQuery GetChange where
        toQuery = const mempty

-- | /See:/ 'getChangeResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'gcrChangeInfo'
newtype GetChangeResponse = GetChangeResponse'{_gcrChangeInfo :: ChangeInfo} deriving (Eq, Read, Show)

-- | 'GetChangeResponse' smart constructor.
getChangeResponse :: ChangeInfo -> GetChangeResponse
getChangeResponse pChangeInfo = GetChangeResponse'{_gcrChangeInfo = pChangeInfo};

-- | A complex type that contains information about the specified change
-- batch, including the change batch ID, the status of the change, and the
-- date and time of the request.
gcrChangeInfo :: Lens' GetChangeResponse ChangeInfo
gcrChangeInfo = lens _gcrChangeInfo (\ s a -> s{_gcrChangeInfo = a});
