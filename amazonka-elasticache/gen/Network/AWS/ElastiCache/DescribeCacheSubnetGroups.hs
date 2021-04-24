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
-- Module      : Network.AWS.ElastiCache.DescribeCacheSubnetGroups
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns a list of cache subnet group descriptions. If a subnet group name is specified, the list contains only the description of that group. This is applicable only when you have ElastiCache in VPC setup. All ElastiCache clusters now launch in VPC by default.
--
--
--
-- This operation returns paginated results.
module Network.AWS.ElastiCache.DescribeCacheSubnetGroups
  ( -- * Creating a Request
    describeCacheSubnetGroups,
    DescribeCacheSubnetGroups,

    -- * Request Lenses
    dcsgCacheSubnetGroupName,
    dcsgMarker,
    dcsgMaxRecords,

    -- * Destructuring the Response
    describeCacheSubnetGroupsResponse,
    DescribeCacheSubnetGroupsResponse,

    -- * Response Lenses
    dcsgrcrsCacheSubnetGroups,
    dcsgrcrsMarker,
    dcsgrcrsResponseStatus,
  )
where

import Network.AWS.ElastiCache.Types
import Network.AWS.Lens
import Network.AWS.Pager
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | Represents the input of a @DescribeCacheSubnetGroups@ operation.
--
--
--
-- /See:/ 'describeCacheSubnetGroups' smart constructor.
data DescribeCacheSubnetGroups = DescribeCacheSubnetGroups'
  { _dcsgCacheSubnetGroupName ::
      !(Maybe Text),
    _dcsgMarker ::
      !(Maybe Text),
    _dcsgMaxRecords ::
      !(Maybe Int)
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'DescribeCacheSubnetGroups' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dcsgCacheSubnetGroupName' - The name of the cache subnet group to return details for.
--
-- * 'dcsgMarker' - An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by @MaxRecords@ .
--
-- * 'dcsgMaxRecords' - The maximum number of records to include in the response. If more records exist than the specified @MaxRecords@ value, a marker is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: minimum 20; maximum 100.
describeCacheSubnetGroups ::
  DescribeCacheSubnetGroups
describeCacheSubnetGroups =
  DescribeCacheSubnetGroups'
    { _dcsgCacheSubnetGroupName =
        Nothing,
      _dcsgMarker = Nothing,
      _dcsgMaxRecords = Nothing
    }

-- | The name of the cache subnet group to return details for.
dcsgCacheSubnetGroupName :: Lens' DescribeCacheSubnetGroups (Maybe Text)
dcsgCacheSubnetGroupName = lens _dcsgCacheSubnetGroupName (\s a -> s {_dcsgCacheSubnetGroupName = a})

-- | An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by @MaxRecords@ .
dcsgMarker :: Lens' DescribeCacheSubnetGroups (Maybe Text)
dcsgMarker = lens _dcsgMarker (\s a -> s {_dcsgMarker = a})

-- | The maximum number of records to include in the response. If more records exist than the specified @MaxRecords@ value, a marker is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: minimum 20; maximum 100.
dcsgMaxRecords :: Lens' DescribeCacheSubnetGroups (Maybe Int)
dcsgMaxRecords = lens _dcsgMaxRecords (\s a -> s {_dcsgMaxRecords = a})

instance AWSPager DescribeCacheSubnetGroups where
  page rq rs
    | stop (rs ^. dcsgrcrsMarker) = Nothing
    | stop (rs ^. dcsgrcrsCacheSubnetGroups) = Nothing
    | otherwise =
      Just $ rq & dcsgMarker .~ rs ^. dcsgrcrsMarker

instance AWSRequest DescribeCacheSubnetGroups where
  type
    Rs DescribeCacheSubnetGroups =
      DescribeCacheSubnetGroupsResponse
  request = postQuery elastiCache
  response =
    receiveXMLWrapper
      "DescribeCacheSubnetGroupsResult"
      ( \s h x ->
          DescribeCacheSubnetGroupsResponse'
            <$> ( x .@? "CacheSubnetGroups" .!@ mempty
                    >>= may (parseXMLList "CacheSubnetGroup")
                )
            <*> (x .@? "Marker")
            <*> (pure (fromEnum s))
      )

instance Hashable DescribeCacheSubnetGroups

instance NFData DescribeCacheSubnetGroups

instance ToHeaders DescribeCacheSubnetGroups where
  toHeaders = const mempty

instance ToPath DescribeCacheSubnetGroups where
  toPath = const "/"

instance ToQuery DescribeCacheSubnetGroups where
  toQuery DescribeCacheSubnetGroups' {..} =
    mconcat
      [ "Action"
          =: ("DescribeCacheSubnetGroups" :: ByteString),
        "Version" =: ("2015-02-02" :: ByteString),
        "CacheSubnetGroupName" =: _dcsgCacheSubnetGroupName,
        "Marker" =: _dcsgMarker,
        "MaxRecords" =: _dcsgMaxRecords
      ]

-- | Represents the output of a @DescribeCacheSubnetGroups@ operation.
--
--
--
-- /See:/ 'describeCacheSubnetGroupsResponse' smart constructor.
data DescribeCacheSubnetGroupsResponse = DescribeCacheSubnetGroupsResponse'
  { _dcsgrcrsCacheSubnetGroups ::
      !( Maybe
           [CacheSubnetGroup]
       ),
    _dcsgrcrsMarker ::
      !( Maybe
           Text
       ),
    _dcsgrcrsResponseStatus ::
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

-- | Creates a value of 'DescribeCacheSubnetGroupsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dcsgrcrsCacheSubnetGroups' - A list of cache subnet groups. Each element in the list contains detailed information about one group.
--
-- * 'dcsgrcrsMarker' - Provides an identifier to allow retrieval of paginated results.
--
-- * 'dcsgrcrsResponseStatus' - -- | The response status code.
describeCacheSubnetGroupsResponse ::
  -- | 'dcsgrcrsResponseStatus'
  Int ->
  DescribeCacheSubnetGroupsResponse
describeCacheSubnetGroupsResponse pResponseStatus_ =
  DescribeCacheSubnetGroupsResponse'
    { _dcsgrcrsCacheSubnetGroups =
        Nothing,
      _dcsgrcrsMarker = Nothing,
      _dcsgrcrsResponseStatus =
        pResponseStatus_
    }

-- | A list of cache subnet groups. Each element in the list contains detailed information about one group.
dcsgrcrsCacheSubnetGroups :: Lens' DescribeCacheSubnetGroupsResponse [CacheSubnetGroup]
dcsgrcrsCacheSubnetGroups = lens _dcsgrcrsCacheSubnetGroups (\s a -> s {_dcsgrcrsCacheSubnetGroups = a}) . _Default . _Coerce

-- | Provides an identifier to allow retrieval of paginated results.
dcsgrcrsMarker :: Lens' DescribeCacheSubnetGroupsResponse (Maybe Text)
dcsgrcrsMarker = lens _dcsgrcrsMarker (\s a -> s {_dcsgrcrsMarker = a})

-- | -- | The response status code.
dcsgrcrsResponseStatus :: Lens' DescribeCacheSubnetGroupsResponse Int
dcsgrcrsResponseStatus = lens _dcsgrcrsResponseStatus (\s a -> s {_dcsgrcrsResponseStatus = a})

instance NFData DescribeCacheSubnetGroupsResponse
