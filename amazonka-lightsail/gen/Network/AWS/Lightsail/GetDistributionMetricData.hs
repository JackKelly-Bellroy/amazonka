{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Lightsail.GetDistributionMetricData
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns the data points of a specific metric for an Amazon Lightsail
-- content delivery network (CDN) distribution.
--
-- Metrics report the utilization of your resources, and the error counts
-- generated by them. Monitor and collect metric data regularly to maintain
-- the reliability, availability, and performance of your resources.
module Network.AWS.Lightsail.GetDistributionMetricData
  ( -- * Creating a Request
    GetDistributionMetricData (..),
    newGetDistributionMetricData,

    -- * Request Lenses
    getDistributionMetricData_distributionName,
    getDistributionMetricData_metricName,
    getDistributionMetricData_startTime,
    getDistributionMetricData_endTime,
    getDistributionMetricData_period,
    getDistributionMetricData_unit,
    getDistributionMetricData_statistics,

    -- * Destructuring the Response
    GetDistributionMetricDataResponse (..),
    newGetDistributionMetricDataResponse,

    -- * Response Lenses
    getDistributionMetricDataResponse_metricName,
    getDistributionMetricDataResponse_metricData,
    getDistributionMetricDataResponse_httpStatus,
  )
where

import qualified Network.AWS.Lens as Lens
import Network.AWS.Lightsail.Types
import Network.AWS.Lightsail.Types.DistributionMetricName
import Network.AWS.Lightsail.Types.MetricDatapoint
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response

-- | /See:/ 'newGetDistributionMetricData' smart constructor.
data GetDistributionMetricData = GetDistributionMetricData'
  { -- | The name of the distribution for which to get metric data.
    --
    -- Use the @GetDistributions@ action to get a list of distribution names
    -- that you can specify.
    distributionName :: Prelude.Text,
    -- | The metric for which you want to return information.
    --
    -- Valid distribution metric names are listed below, along with the most
    -- useful @statistics@ to include in your request, and the published @unit@
    -- value.
    --
    -- -   __@Requests@__ - The total number of viewer requests received by
    --     your Lightsail distribution, for all HTTP methods, and for both HTTP
    --     and HTTPS requests.
    --
    --     @Statistics@: The most useful statistic is @Sum@.
    --
    --     @Unit@: The published unit is @None@.
    --
    -- -   __@BytesDownloaded@__ - The number of bytes downloaded by viewers
    --     for GET, HEAD, and OPTIONS requests.
    --
    --     @Statistics@: The most useful statistic is @Sum@.
    --
    --     @Unit@: The published unit is @None@.
    --
    -- -   __@BytesUploaded @__ - The number of bytes uploaded to your origin
    --     by your Lightsail distribution, using POST and PUT requests.
    --
    --     @Statistics@: The most useful statistic is @Sum@.
    --
    --     @Unit@: The published unit is @None@.
    --
    -- -   __@TotalErrorRate@__ - The percentage of all viewer requests for
    --     which the response\'s HTTP status code was 4xx or 5xx.
    --
    --     @Statistics@: The most useful statistic is @Average@.
    --
    --     @Unit@: The published unit is @Percent@.
    --
    -- -   __@4xxErrorRate@__ - The percentage of all viewer requests for which
    --     the response\'s HTTP status cod was 4xx. In these cases, the client
    --     or client viewer may have made an error. For example, a status code
    --     of 404 (Not Found) means that the client requested an object that
    --     could not be found.
    --
    --     @Statistics@: The most useful statistic is @Average@.
    --
    --     @Unit@: The published unit is @Percent@.
    --
    -- -   __@5xxErrorRate@__ - The percentage of all viewer requests for which
    --     the response\'s HTTP status code was 5xx. In these cases, the origin
    --     server did not satisfy the requests. For example, a status code of
    --     503 (Service Unavailable) means that the origin server is currently
    --     unavailable.
    --
    --     @Statistics@: The most useful statistic is @Average@.
    --
    --     @Unit@: The published unit is @Percent@.
    metricName :: DistributionMetricName,
    -- | The start of the time interval for which to get metric data.
    --
    -- Constraints:
    --
    -- -   Specified in Coordinated Universal Time (UTC).
    --
    -- -   Specified in the Unix time format.
    --
    --     For example, if you wish to use a start time of October 1, 2018, at
    --     8 PM UTC, specify @1538424000@ as the start time.
    --
    -- You can convert a human-friendly time to Unix time format using a
    -- converter like <https://www.epochconverter.com/ Epoch converter>.
    startTime :: Prelude.POSIX,
    -- | The end of the time interval for which to get metric data.
    --
    -- Constraints:
    --
    -- -   Specified in Coordinated Universal Time (UTC).
    --
    -- -   Specified in the Unix time format.
    --
    --     For example, if you wish to use an end time of October 1, 2018, at 9
    --     PM UTC, specify @1538427600@ as the end time.
    --
    -- You can convert a human-friendly time to Unix time format using a
    -- converter like <https://www.epochconverter.com/ Epoch converter>.
    endTime :: Prelude.POSIX,
    -- | The granularity, in seconds, for the metric data points that will be
    -- returned.
    period :: Prelude.Nat,
    -- | The unit for the metric data request.
    --
    -- Valid units depend on the metric data being requested. For the valid
    -- units with each available metric, see the @metricName@ parameter.
    unit :: MetricUnit,
    -- | The statistic for the metric.
    --
    -- The following statistics are available:
    --
    -- -   @Minimum@ - The lowest value observed during the specified period.
    --     Use this value to determine low volumes of activity for your
    --     application.
    --
    -- -   @Maximum@ - The highest value observed during the specified period.
    --     Use this value to determine high volumes of activity for your
    --     application.
    --
    -- -   @Sum@ - All values submitted for the matching metric added together.
    --     You can use this statistic to determine the total volume of a
    --     metric.
    --
    -- -   @Average@ - The value of Sum \/ SampleCount during the specified
    --     period. By comparing this statistic with the Minimum and Maximum
    --     values, you can determine the full scope of a metric and how close
    --     the average use is to the Minimum and Maximum values. This
    --     comparison helps you to know when to increase or decrease your
    --     resources.
    --
    -- -   @SampleCount@ - The count, or number, of data points used for the
    --     statistical calculation.
    statistics :: [MetricStatistic]
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Data, Prelude.Typeable, Prelude.Generic)

-- |
-- Create a value of 'GetDistributionMetricData' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'distributionName', 'getDistributionMetricData_distributionName' - The name of the distribution for which to get metric data.
--
-- Use the @GetDistributions@ action to get a list of distribution names
-- that you can specify.
--
-- 'metricName', 'getDistributionMetricData_metricName' - The metric for which you want to return information.
--
-- Valid distribution metric names are listed below, along with the most
-- useful @statistics@ to include in your request, and the published @unit@
-- value.
--
-- -   __@Requests@__ - The total number of viewer requests received by
--     your Lightsail distribution, for all HTTP methods, and for both HTTP
--     and HTTPS requests.
--
--     @Statistics@: The most useful statistic is @Sum@.
--
--     @Unit@: The published unit is @None@.
--
-- -   __@BytesDownloaded@__ - The number of bytes downloaded by viewers
--     for GET, HEAD, and OPTIONS requests.
--
--     @Statistics@: The most useful statistic is @Sum@.
--
--     @Unit@: The published unit is @None@.
--
-- -   __@BytesUploaded @__ - The number of bytes uploaded to your origin
--     by your Lightsail distribution, using POST and PUT requests.
--
--     @Statistics@: The most useful statistic is @Sum@.
--
--     @Unit@: The published unit is @None@.
--
-- -   __@TotalErrorRate@__ - The percentage of all viewer requests for
--     which the response\'s HTTP status code was 4xx or 5xx.
--
--     @Statistics@: The most useful statistic is @Average@.
--
--     @Unit@: The published unit is @Percent@.
--
-- -   __@4xxErrorRate@__ - The percentage of all viewer requests for which
--     the response\'s HTTP status cod was 4xx. In these cases, the client
--     or client viewer may have made an error. For example, a status code
--     of 404 (Not Found) means that the client requested an object that
--     could not be found.
--
--     @Statistics@: The most useful statistic is @Average@.
--
--     @Unit@: The published unit is @Percent@.
--
-- -   __@5xxErrorRate@__ - The percentage of all viewer requests for which
--     the response\'s HTTP status code was 5xx. In these cases, the origin
--     server did not satisfy the requests. For example, a status code of
--     503 (Service Unavailable) means that the origin server is currently
--     unavailable.
--
--     @Statistics@: The most useful statistic is @Average@.
--
--     @Unit@: The published unit is @Percent@.
--
-- 'startTime', 'getDistributionMetricData_startTime' - The start of the time interval for which to get metric data.
--
-- Constraints:
--
-- -   Specified in Coordinated Universal Time (UTC).
--
-- -   Specified in the Unix time format.
--
--     For example, if you wish to use a start time of October 1, 2018, at
--     8 PM UTC, specify @1538424000@ as the start time.
--
-- You can convert a human-friendly time to Unix time format using a
-- converter like <https://www.epochconverter.com/ Epoch converter>.
--
-- 'endTime', 'getDistributionMetricData_endTime' - The end of the time interval for which to get metric data.
--
-- Constraints:
--
-- -   Specified in Coordinated Universal Time (UTC).
--
-- -   Specified in the Unix time format.
--
--     For example, if you wish to use an end time of October 1, 2018, at 9
--     PM UTC, specify @1538427600@ as the end time.
--
-- You can convert a human-friendly time to Unix time format using a
-- converter like <https://www.epochconverter.com/ Epoch converter>.
--
-- 'period', 'getDistributionMetricData_period' - The granularity, in seconds, for the metric data points that will be
-- returned.
--
-- 'unit', 'getDistributionMetricData_unit' - The unit for the metric data request.
--
-- Valid units depend on the metric data being requested. For the valid
-- units with each available metric, see the @metricName@ parameter.
--
-- 'statistics', 'getDistributionMetricData_statistics' - The statistic for the metric.
--
-- The following statistics are available:
--
-- -   @Minimum@ - The lowest value observed during the specified period.
--     Use this value to determine low volumes of activity for your
--     application.
--
-- -   @Maximum@ - The highest value observed during the specified period.
--     Use this value to determine high volumes of activity for your
--     application.
--
-- -   @Sum@ - All values submitted for the matching metric added together.
--     You can use this statistic to determine the total volume of a
--     metric.
--
-- -   @Average@ - The value of Sum \/ SampleCount during the specified
--     period. By comparing this statistic with the Minimum and Maximum
--     values, you can determine the full scope of a metric and how close
--     the average use is to the Minimum and Maximum values. This
--     comparison helps you to know when to increase or decrease your
--     resources.
--
-- -   @SampleCount@ - The count, or number, of data points used for the
--     statistical calculation.
newGetDistributionMetricData ::
  -- | 'distributionName'
  Prelude.Text ->
  -- | 'metricName'
  DistributionMetricName ->
  -- | 'startTime'
  Prelude.UTCTime ->
  -- | 'endTime'
  Prelude.UTCTime ->
  -- | 'period'
  Prelude.Natural ->
  -- | 'unit'
  MetricUnit ->
  GetDistributionMetricData
newGetDistributionMetricData
  pDistributionName_
  pMetricName_
  pStartTime_
  pEndTime_
  pPeriod_
  pUnit_ =
    GetDistributionMetricData'
      { distributionName =
          pDistributionName_,
        metricName = pMetricName_,
        startTime = Prelude._Time Lens.# pStartTime_,
        endTime = Prelude._Time Lens.# pEndTime_,
        period = Prelude._Nat Lens.# pPeriod_,
        unit = pUnit_,
        statistics = Prelude.mempty
      }

-- | The name of the distribution for which to get metric data.
--
-- Use the @GetDistributions@ action to get a list of distribution names
-- that you can specify.
getDistributionMetricData_distributionName :: Lens.Lens' GetDistributionMetricData Prelude.Text
getDistributionMetricData_distributionName = Lens.lens (\GetDistributionMetricData' {distributionName} -> distributionName) (\s@GetDistributionMetricData' {} a -> s {distributionName = a} :: GetDistributionMetricData)

-- | The metric for which you want to return information.
--
-- Valid distribution metric names are listed below, along with the most
-- useful @statistics@ to include in your request, and the published @unit@
-- value.
--
-- -   __@Requests@__ - The total number of viewer requests received by
--     your Lightsail distribution, for all HTTP methods, and for both HTTP
--     and HTTPS requests.
--
--     @Statistics@: The most useful statistic is @Sum@.
--
--     @Unit@: The published unit is @None@.
--
-- -   __@BytesDownloaded@__ - The number of bytes downloaded by viewers
--     for GET, HEAD, and OPTIONS requests.
--
--     @Statistics@: The most useful statistic is @Sum@.
--
--     @Unit@: The published unit is @None@.
--
-- -   __@BytesUploaded @__ - The number of bytes uploaded to your origin
--     by your Lightsail distribution, using POST and PUT requests.
--
--     @Statistics@: The most useful statistic is @Sum@.
--
--     @Unit@: The published unit is @None@.
--
-- -   __@TotalErrorRate@__ - The percentage of all viewer requests for
--     which the response\'s HTTP status code was 4xx or 5xx.
--
--     @Statistics@: The most useful statistic is @Average@.
--
--     @Unit@: The published unit is @Percent@.
--
-- -   __@4xxErrorRate@__ - The percentage of all viewer requests for which
--     the response\'s HTTP status cod was 4xx. In these cases, the client
--     or client viewer may have made an error. For example, a status code
--     of 404 (Not Found) means that the client requested an object that
--     could not be found.
--
--     @Statistics@: The most useful statistic is @Average@.
--
--     @Unit@: The published unit is @Percent@.
--
-- -   __@5xxErrorRate@__ - The percentage of all viewer requests for which
--     the response\'s HTTP status code was 5xx. In these cases, the origin
--     server did not satisfy the requests. For example, a status code of
--     503 (Service Unavailable) means that the origin server is currently
--     unavailable.
--
--     @Statistics@: The most useful statistic is @Average@.
--
--     @Unit@: The published unit is @Percent@.
getDistributionMetricData_metricName :: Lens.Lens' GetDistributionMetricData DistributionMetricName
getDistributionMetricData_metricName = Lens.lens (\GetDistributionMetricData' {metricName} -> metricName) (\s@GetDistributionMetricData' {} a -> s {metricName = a} :: GetDistributionMetricData)

-- | The start of the time interval for which to get metric data.
--
-- Constraints:
--
-- -   Specified in Coordinated Universal Time (UTC).
--
-- -   Specified in the Unix time format.
--
--     For example, if you wish to use a start time of October 1, 2018, at
--     8 PM UTC, specify @1538424000@ as the start time.
--
-- You can convert a human-friendly time to Unix time format using a
-- converter like <https://www.epochconverter.com/ Epoch converter>.
getDistributionMetricData_startTime :: Lens.Lens' GetDistributionMetricData Prelude.UTCTime
getDistributionMetricData_startTime = Lens.lens (\GetDistributionMetricData' {startTime} -> startTime) (\s@GetDistributionMetricData' {} a -> s {startTime = a} :: GetDistributionMetricData) Prelude.. Prelude._Time

-- | The end of the time interval for which to get metric data.
--
-- Constraints:
--
-- -   Specified in Coordinated Universal Time (UTC).
--
-- -   Specified in the Unix time format.
--
--     For example, if you wish to use an end time of October 1, 2018, at 9
--     PM UTC, specify @1538427600@ as the end time.
--
-- You can convert a human-friendly time to Unix time format using a
-- converter like <https://www.epochconverter.com/ Epoch converter>.
getDistributionMetricData_endTime :: Lens.Lens' GetDistributionMetricData Prelude.UTCTime
getDistributionMetricData_endTime = Lens.lens (\GetDistributionMetricData' {endTime} -> endTime) (\s@GetDistributionMetricData' {} a -> s {endTime = a} :: GetDistributionMetricData) Prelude.. Prelude._Time

-- | The granularity, in seconds, for the metric data points that will be
-- returned.
getDistributionMetricData_period :: Lens.Lens' GetDistributionMetricData Prelude.Natural
getDistributionMetricData_period = Lens.lens (\GetDistributionMetricData' {period} -> period) (\s@GetDistributionMetricData' {} a -> s {period = a} :: GetDistributionMetricData) Prelude.. Prelude._Nat

-- | The unit for the metric data request.
--
-- Valid units depend on the metric data being requested. For the valid
-- units with each available metric, see the @metricName@ parameter.
getDistributionMetricData_unit :: Lens.Lens' GetDistributionMetricData MetricUnit
getDistributionMetricData_unit = Lens.lens (\GetDistributionMetricData' {unit} -> unit) (\s@GetDistributionMetricData' {} a -> s {unit = a} :: GetDistributionMetricData)

-- | The statistic for the metric.
--
-- The following statistics are available:
--
-- -   @Minimum@ - The lowest value observed during the specified period.
--     Use this value to determine low volumes of activity for your
--     application.
--
-- -   @Maximum@ - The highest value observed during the specified period.
--     Use this value to determine high volumes of activity for your
--     application.
--
-- -   @Sum@ - All values submitted for the matching metric added together.
--     You can use this statistic to determine the total volume of a
--     metric.
--
-- -   @Average@ - The value of Sum \/ SampleCount during the specified
--     period. By comparing this statistic with the Minimum and Maximum
--     values, you can determine the full scope of a metric and how close
--     the average use is to the Minimum and Maximum values. This
--     comparison helps you to know when to increase or decrease your
--     resources.
--
-- -   @SampleCount@ - The count, or number, of data points used for the
--     statistical calculation.
getDistributionMetricData_statistics :: Lens.Lens' GetDistributionMetricData [MetricStatistic]
getDistributionMetricData_statistics = Lens.lens (\GetDistributionMetricData' {statistics} -> statistics) (\s@GetDistributionMetricData' {} a -> s {statistics = a} :: GetDistributionMetricData) Prelude.. Prelude._Coerce

instance Prelude.AWSRequest GetDistributionMetricData where
  type
    Rs GetDistributionMetricData =
      GetDistributionMetricDataResponse
  request = Request.postJSON defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          GetDistributionMetricDataResponse'
            Prelude.<$> (x Prelude..?> "metricName")
            Prelude.<*> ( x Prelude..?> "metricData"
                            Prelude..!@ Prelude.mempty
                        )
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable GetDistributionMetricData

instance Prelude.NFData GetDistributionMetricData

instance Prelude.ToHeaders GetDistributionMetricData where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "X-Amz-Target"
              Prelude.=# ( "Lightsail_20161128.GetDistributionMetricData" ::
                             Prelude.ByteString
                         ),
            "Content-Type"
              Prelude.=# ( "application/x-amz-json-1.1" ::
                             Prelude.ByteString
                         )
          ]
      )

instance Prelude.ToJSON GetDistributionMetricData where
  toJSON GetDistributionMetricData' {..} =
    Prelude.object
      ( Prelude.catMaybes
          [ Prelude.Just
              ("distributionName" Prelude..= distributionName),
            Prelude.Just ("metricName" Prelude..= metricName),
            Prelude.Just ("startTime" Prelude..= startTime),
            Prelude.Just ("endTime" Prelude..= endTime),
            Prelude.Just ("period" Prelude..= period),
            Prelude.Just ("unit" Prelude..= unit),
            Prelude.Just ("statistics" Prelude..= statistics)
          ]
      )

instance Prelude.ToPath GetDistributionMetricData where
  toPath = Prelude.const "/"

instance Prelude.ToQuery GetDistributionMetricData where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newGetDistributionMetricDataResponse' smart constructor.
data GetDistributionMetricDataResponse = GetDistributionMetricDataResponse'
  { -- | The name of the metric returned.
    metricName :: Prelude.Maybe DistributionMetricName,
    -- | An array of objects that describe the metric data returned.
    metricData :: Prelude.Maybe [MetricDatapoint],
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Data, Prelude.Typeable, Prelude.Generic)

-- |
-- Create a value of 'GetDistributionMetricDataResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'metricName', 'getDistributionMetricDataResponse_metricName' - The name of the metric returned.
--
-- 'metricData', 'getDistributionMetricDataResponse_metricData' - An array of objects that describe the metric data returned.
--
-- 'httpStatus', 'getDistributionMetricDataResponse_httpStatus' - The response's http status code.
newGetDistributionMetricDataResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  GetDistributionMetricDataResponse
newGetDistributionMetricDataResponse pHttpStatus_ =
  GetDistributionMetricDataResponse'
    { metricName =
        Prelude.Nothing,
      metricData = Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | The name of the metric returned.
getDistributionMetricDataResponse_metricName :: Lens.Lens' GetDistributionMetricDataResponse (Prelude.Maybe DistributionMetricName)
getDistributionMetricDataResponse_metricName = Lens.lens (\GetDistributionMetricDataResponse' {metricName} -> metricName) (\s@GetDistributionMetricDataResponse' {} a -> s {metricName = a} :: GetDistributionMetricDataResponse)

-- | An array of objects that describe the metric data returned.
getDistributionMetricDataResponse_metricData :: Lens.Lens' GetDistributionMetricDataResponse (Prelude.Maybe [MetricDatapoint])
getDistributionMetricDataResponse_metricData = Lens.lens (\GetDistributionMetricDataResponse' {metricData} -> metricData) (\s@GetDistributionMetricDataResponse' {} a -> s {metricData = a} :: GetDistributionMetricDataResponse) Prelude.. Lens.mapping Prelude._Coerce

-- | The response's http status code.
getDistributionMetricDataResponse_httpStatus :: Lens.Lens' GetDistributionMetricDataResponse Prelude.Int
getDistributionMetricDataResponse_httpStatus = Lens.lens (\GetDistributionMetricDataResponse' {httpStatus} -> httpStatus) (\s@GetDistributionMetricDataResponse' {} a -> s {httpStatus = a} :: GetDistributionMetricDataResponse)

instance
  Prelude.NFData
    GetDistributionMetricDataResponse
