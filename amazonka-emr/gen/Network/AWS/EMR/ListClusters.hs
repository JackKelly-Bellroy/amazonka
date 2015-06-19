{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.EMR.ListClusters
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

-- | Provides the status of all clusters visible to this AWS account. Allows
-- you to filter the list of clusters based on certain criteria; for
-- example, filtering by cluster creation date and time or by status. This
-- call returns a maximum of 50 clusters per call, but returns a marker to
-- track the paging of the cluster list across multiple ListClusters calls.
--
-- <http://docs.aws.amazon.com/ElasticMapReduce/latest/API/API_ListClusters.html>
module Network.AWS.EMR.ListClusters
    (
    -- * Request
      ListClusters
    -- ** Request constructor
    , listClusters
    -- ** Request lenses
    , lcCreatedAfter
    , lcMarker
    , lcClusterStates
    , lcCreatedBefore

    -- * Response
    , ListClustersResponse
    -- ** Response constructor
    , listClustersResponse
    -- ** Response lenses
    , lcrMarker
    , lcrClusters
    ) where

import Network.AWS.EMR.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'listClusters' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'lcCreatedAfter'
--
-- * 'lcMarker'
--
-- * 'lcClusterStates'
--
-- * 'lcCreatedBefore'
data ListClusters = ListClusters'{_lcCreatedAfter :: Maybe POSIX, _lcMarker :: Maybe Text, _lcClusterStates :: Maybe [ClusterState], _lcCreatedBefore :: Maybe POSIX} deriving (Eq, Read, Show)

-- | 'ListClusters' smart constructor.
listClusters :: ListClusters
listClusters = ListClusters'{_lcCreatedAfter = Nothing, _lcMarker = Nothing, _lcClusterStates = Nothing, _lcCreatedBefore = Nothing};

-- | The creation date and time beginning value filter for listing clusters .
lcCreatedAfter :: Lens' ListClusters (Maybe UTCTime)
lcCreatedAfter = lens _lcCreatedAfter (\ s a -> s{_lcCreatedAfter = a}) . mapping _Time;

-- | The pagination token that indicates the next set of results to retrieve.
lcMarker :: Lens' ListClusters (Maybe Text)
lcMarker = lens _lcMarker (\ s a -> s{_lcMarker = a});

-- | The cluster state filters to apply when listing clusters.
lcClusterStates :: Lens' ListClusters [ClusterState]
lcClusterStates = lens _lcClusterStates (\ s a -> s{_lcClusterStates = a}) . _Default;

-- | The creation date and time end value filter for listing clusters .
lcCreatedBefore :: Lens' ListClusters (Maybe UTCTime)
lcCreatedBefore = lens _lcCreatedBefore (\ s a -> s{_lcCreatedBefore = a}) . mapping _Time;

instance AWSRequest ListClusters where
        type Sv ListClusters = EMR
        type Rs ListClusters = ListClustersResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 ListClustersResponse' <$>
                   (x .?> "Marker") <*> (x .?> "Clusters" .!@ mempty))

instance ToHeaders ListClusters where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("ElasticMapReduce.ListClusters" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON ListClusters where
        toJSON ListClusters'{..}
          = object
              ["CreatedAfter" .= _lcCreatedAfter,
               "Marker" .= _lcMarker,
               "ClusterStates" .= _lcClusterStates,
               "CreatedBefore" .= _lcCreatedBefore]

instance ToPath ListClusters where
        toPath = const "/"

instance ToQuery ListClusters where
        toQuery = const mempty

-- | /See:/ 'listClustersResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'lcrMarker'
--
-- * 'lcrClusters'
data ListClustersResponse = ListClustersResponse'{_lcrMarker :: Maybe Text, _lcrClusters :: Maybe [ClusterSummary]} deriving (Eq, Read, Show)

-- | 'ListClustersResponse' smart constructor.
listClustersResponse :: ListClustersResponse
listClustersResponse = ListClustersResponse'{_lcrMarker = Nothing, _lcrClusters = Nothing};

-- | The pagination token that indicates the next set of results to retrieve.
lcrMarker :: Lens' ListClustersResponse (Maybe Text)
lcrMarker = lens _lcrMarker (\ s a -> s{_lcrMarker = a});

-- | The list of clusters for the account based on the given filters.
lcrClusters :: Lens' ListClustersResponse [ClusterSummary]
lcrClusters = lens _lcrClusters (\ s a -> s{_lcrClusters = a}) . _Default;
