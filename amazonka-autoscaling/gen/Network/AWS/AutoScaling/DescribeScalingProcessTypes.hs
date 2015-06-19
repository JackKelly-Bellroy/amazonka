{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.AutoScaling.DescribeScalingProcessTypes
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

-- | Describes the scaling process types for use with ResumeProcesses and
-- SuspendProcesses.
--
-- <http://docs.aws.amazon.com/AutoScaling/latest/APIReference/API_DescribeScalingProcessTypes.html>
module Network.AWS.AutoScaling.DescribeScalingProcessTypes
    (
    -- * Request
      DescribeScalingProcessTypes
    -- ** Request constructor
    , describeScalingProcessTypes

    -- * Response
    , DescribeScalingProcessTypesResponse
    -- ** Response constructor
    , describeScalingProcessTypesResponse
    -- ** Response lenses
    , dsptrProcesses
    ) where

import Network.AWS.AutoScaling.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'describeScalingProcessTypes' smart constructor.
data DescribeScalingProcessTypes = DescribeScalingProcessTypes' deriving (Eq, Read, Show)

-- | 'DescribeScalingProcessTypes' smart constructor.
describeScalingProcessTypes :: DescribeScalingProcessTypes
describeScalingProcessTypes = DescribeScalingProcessTypes';

instance AWSRequest DescribeScalingProcessTypes where
        type Sv DescribeScalingProcessTypes = AutoScaling
        type Rs DescribeScalingProcessTypes =
             DescribeScalingProcessTypesResponse
        request = post
        response
          = receiveXMLWrapper
              "DescribeScalingProcessTypesResult"
              (\ s h x ->
                 DescribeScalingProcessTypesResponse' <$>
                   (x .@? "Processes" .!@ mempty >>=
                      may (parseXMLList "member")))

instance ToHeaders DescribeScalingProcessTypes where
        toHeaders = const mempty

instance ToPath DescribeScalingProcessTypes where
        toPath = const "/"

instance ToQuery DescribeScalingProcessTypes where
        toQuery
          = const
              (mconcat
                 ["Action" =:
                    ("DescribeScalingProcessTypes" :: ByteString),
                  "Version" =: ("2011-01-01" :: ByteString)])

-- | /See:/ 'describeScalingProcessTypesResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dsptrProcesses'
newtype DescribeScalingProcessTypesResponse = DescribeScalingProcessTypesResponse'{_dsptrProcesses :: Maybe [ProcessType]} deriving (Eq, Read, Show)

-- | 'DescribeScalingProcessTypesResponse' smart constructor.
describeScalingProcessTypesResponse :: DescribeScalingProcessTypesResponse
describeScalingProcessTypesResponse = DescribeScalingProcessTypesResponse'{_dsptrProcesses = Nothing};

-- | The names of the process types.
dsptrProcesses :: Lens' DescribeScalingProcessTypesResponse [ProcessType]
dsptrProcesses = lens _dsptrProcesses (\ s a -> s{_dsptrProcesses = a}) . _Default;
