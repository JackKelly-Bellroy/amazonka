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
-- Module      : Network.AWS.RDS.DownloadDBLogFilePortion
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Downloads all or a portion of the specified log file, up to 1 MB in size.
--
--
--
-- This operation returns paginated results.
module Network.AWS.RDS.DownloadDBLogFilePortion
  ( -- * Creating a Request
    downloadDBLogFilePortion,
    DownloadDBLogFilePortion,

    -- * Request Lenses
    ddlfpNumberOfLines,
    ddlfpMarker,
    ddlfpDBInstanceIdentifier,
    ddlfpLogFileName,

    -- * Destructuring the Response
    downloadDBLogFilePortionResponse,
    DownloadDBLogFilePortionResponse,

    -- * Response Lenses
    ddlfprrsAdditionalDataPending,
    ddlfprrsLogFileData,
    ddlfprrsMarker,
    ddlfprrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Pager
import Network.AWS.Prelude
import Network.AWS.RDS.Types
import Network.AWS.Request
import Network.AWS.Response

-- |
--
--
--
-- /See:/ 'downloadDBLogFilePortion' smart constructor.
data DownloadDBLogFilePortion = DownloadDBLogFilePortion'
  { _ddlfpNumberOfLines ::
      !(Maybe Int),
    _ddlfpMarker ::
      !(Maybe Text),
    _ddlfpDBInstanceIdentifier ::
      !Text,
    _ddlfpLogFileName ::
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

-- | Creates a value of 'DownloadDBLogFilePortion' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ddlfpNumberOfLines' - The number of lines to download. If the number of lines specified results in a file over 1 MB in size, the file is truncated at 1 MB in size. If the NumberOfLines parameter is specified, then the block of lines returned can be from the beginning or the end of the log file, depending on the value of the Marker parameter.     * If neither Marker or NumberOfLines are specified, the entire log file is returned up to a maximum of 10000 lines, starting with the most recent log entries first.     * If NumberOfLines is specified and Marker isn't specified, then the most recent lines from the end of the log file are returned.     * If Marker is specified as "0", then the specified number of lines from the beginning of the log file are returned.     * You can download the log file in blocks of lines by specifying the size of the block using the NumberOfLines parameter, and by specifying a value of "0" for the Marker parameter in your first request. Include the Marker value returned in the response as the Marker value for the next request, continuing until the AdditionalDataPending response element returns false.
--
-- * 'ddlfpMarker' - The pagination token provided in the previous request or "0". If the Marker parameter is specified the response includes only records beyond the marker until the end of the file or up to NumberOfLines.
--
-- * 'ddlfpDBInstanceIdentifier' - The customer-assigned name of the DB instance that contains the log files you want to list. Constraints:     * Must match the identifier of an existing DBInstance.
--
-- * 'ddlfpLogFileName' - The name of the log file to be downloaded.
downloadDBLogFilePortion ::
  -- | 'ddlfpDBInstanceIdentifier'
  Text ->
  -- | 'ddlfpLogFileName'
  Text ->
  DownloadDBLogFilePortion
downloadDBLogFilePortion
  pDBInstanceIdentifier_
  pLogFileName_ =
    DownloadDBLogFilePortion'
      { _ddlfpNumberOfLines =
          Nothing,
        _ddlfpMarker = Nothing,
        _ddlfpDBInstanceIdentifier =
          pDBInstanceIdentifier_,
        _ddlfpLogFileName = pLogFileName_
      }

-- | The number of lines to download. If the number of lines specified results in a file over 1 MB in size, the file is truncated at 1 MB in size. If the NumberOfLines parameter is specified, then the block of lines returned can be from the beginning or the end of the log file, depending on the value of the Marker parameter.     * If neither Marker or NumberOfLines are specified, the entire log file is returned up to a maximum of 10000 lines, starting with the most recent log entries first.     * If NumberOfLines is specified and Marker isn't specified, then the most recent lines from the end of the log file are returned.     * If Marker is specified as "0", then the specified number of lines from the beginning of the log file are returned.     * You can download the log file in blocks of lines by specifying the size of the block using the NumberOfLines parameter, and by specifying a value of "0" for the Marker parameter in your first request. Include the Marker value returned in the response as the Marker value for the next request, continuing until the AdditionalDataPending response element returns false.
ddlfpNumberOfLines :: Lens' DownloadDBLogFilePortion (Maybe Int)
ddlfpNumberOfLines = lens _ddlfpNumberOfLines (\s a -> s {_ddlfpNumberOfLines = a})

-- | The pagination token provided in the previous request or "0". If the Marker parameter is specified the response includes only records beyond the marker until the end of the file or up to NumberOfLines.
ddlfpMarker :: Lens' DownloadDBLogFilePortion (Maybe Text)
ddlfpMarker = lens _ddlfpMarker (\s a -> s {_ddlfpMarker = a})

-- | The customer-assigned name of the DB instance that contains the log files you want to list. Constraints:     * Must match the identifier of an existing DBInstance.
ddlfpDBInstanceIdentifier :: Lens' DownloadDBLogFilePortion Text
ddlfpDBInstanceIdentifier = lens _ddlfpDBInstanceIdentifier (\s a -> s {_ddlfpDBInstanceIdentifier = a})

-- | The name of the log file to be downloaded.
ddlfpLogFileName :: Lens' DownloadDBLogFilePortion Text
ddlfpLogFileName = lens _ddlfpLogFileName (\s a -> s {_ddlfpLogFileName = a})

instance AWSPager DownloadDBLogFilePortion where
  page rq rs
    | stop (rs ^. ddlfprrsAdditionalDataPending) =
      Nothing
    | isNothing (rs ^. ddlfprrsMarker) = Nothing
    | otherwise =
      Just $ rq & ddlfpMarker .~ rs ^. ddlfprrsMarker

instance AWSRequest DownloadDBLogFilePortion where
  type
    Rs DownloadDBLogFilePortion =
      DownloadDBLogFilePortionResponse
  request = postQuery rds
  response =
    receiveXMLWrapper
      "DownloadDBLogFilePortionResult"
      ( \s h x ->
          DownloadDBLogFilePortionResponse'
            <$> (x .@? "AdditionalDataPending")
            <*> (x .@? "LogFileData")
            <*> (x .@? "Marker")
            <*> (pure (fromEnum s))
      )

instance Hashable DownloadDBLogFilePortion

instance NFData DownloadDBLogFilePortion

instance ToHeaders DownloadDBLogFilePortion where
  toHeaders = const mempty

instance ToPath DownloadDBLogFilePortion where
  toPath = const "/"

instance ToQuery DownloadDBLogFilePortion where
  toQuery DownloadDBLogFilePortion' {..} =
    mconcat
      [ "Action"
          =: ("DownloadDBLogFilePortion" :: ByteString),
        "Version" =: ("2014-10-31" :: ByteString),
        "NumberOfLines" =: _ddlfpNumberOfLines,
        "Marker" =: _ddlfpMarker,
        "DBInstanceIdentifier" =: _ddlfpDBInstanceIdentifier,
        "LogFileName" =: _ddlfpLogFileName
      ]

-- | This data type is used as a response element to @DownloadDBLogFilePortion@ .
--
--
--
-- /See:/ 'downloadDBLogFilePortionResponse' smart constructor.
data DownloadDBLogFilePortionResponse = DownloadDBLogFilePortionResponse'
  { _ddlfprrsAdditionalDataPending ::
      !( Maybe
           Bool
       ),
    _ddlfprrsLogFileData ::
      !( Maybe
           Text
       ),
    _ddlfprrsMarker ::
      !( Maybe
           Text
       ),
    _ddlfprrsResponseStatus ::
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

-- | Creates a value of 'DownloadDBLogFilePortionResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ddlfprrsAdditionalDataPending' - Boolean value that if true, indicates there is more data to be downloaded.
--
-- * 'ddlfprrsLogFileData' - Entries from the specified log file.
--
-- * 'ddlfprrsMarker' - A pagination token that can be used in a later DownloadDBLogFilePortion request.
--
-- * 'ddlfprrsResponseStatus' - -- | The response status code.
downloadDBLogFilePortionResponse ::
  -- | 'ddlfprrsResponseStatus'
  Int ->
  DownloadDBLogFilePortionResponse
downloadDBLogFilePortionResponse pResponseStatus_ =
  DownloadDBLogFilePortionResponse'
    { _ddlfprrsAdditionalDataPending =
        Nothing,
      _ddlfprrsLogFileData = Nothing,
      _ddlfprrsMarker = Nothing,
      _ddlfprrsResponseStatus =
        pResponseStatus_
    }

-- | Boolean value that if true, indicates there is more data to be downloaded.
ddlfprrsAdditionalDataPending :: Lens' DownloadDBLogFilePortionResponse (Maybe Bool)
ddlfprrsAdditionalDataPending = lens _ddlfprrsAdditionalDataPending (\s a -> s {_ddlfprrsAdditionalDataPending = a})

-- | Entries from the specified log file.
ddlfprrsLogFileData :: Lens' DownloadDBLogFilePortionResponse (Maybe Text)
ddlfprrsLogFileData = lens _ddlfprrsLogFileData (\s a -> s {_ddlfprrsLogFileData = a})

-- | A pagination token that can be used in a later DownloadDBLogFilePortion request.
ddlfprrsMarker :: Lens' DownloadDBLogFilePortionResponse (Maybe Text)
ddlfprrsMarker = lens _ddlfprrsMarker (\s a -> s {_ddlfprrsMarker = a})

-- | -- | The response status code.
ddlfprrsResponseStatus :: Lens' DownloadDBLogFilePortionResponse Int
ddlfprrsResponseStatus = lens _ddlfprrsResponseStatus (\s a -> s {_ddlfprrsResponseStatus = a})

instance NFData DownloadDBLogFilePortionResponse
