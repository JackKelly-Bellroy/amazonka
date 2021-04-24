{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.IoTAnalytics.Types.DatasetEntry
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.IoTAnalytics.Types.DatasetEntry where

import Network.AWS.Lens
import Network.AWS.Prelude

-- | The reference to a data set entry.
--
--
--
-- /See:/ 'datasetEntry' smart constructor.
data DatasetEntry = DatasetEntry'
  { _deDataURI ::
      !(Maybe Text),
    _deEntryName :: !(Maybe Text)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'DatasetEntry' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'deDataURI' - The presigned URI of the data set item.
--
-- * 'deEntryName' - The name of the data set item.
datasetEntry ::
  DatasetEntry
datasetEntry =
  DatasetEntry'
    { _deDataURI = Nothing,
      _deEntryName = Nothing
    }

-- | The presigned URI of the data set item.
deDataURI :: Lens' DatasetEntry (Maybe Text)
deDataURI = lens _deDataURI (\s a -> s {_deDataURI = a})

-- | The name of the data set item.
deEntryName :: Lens' DatasetEntry (Maybe Text)
deEntryName = lens _deEntryName (\s a -> s {_deEntryName = a})

instance FromJSON DatasetEntry where
  parseJSON =
    withObject
      "DatasetEntry"
      ( \x ->
          DatasetEntry'
            <$> (x .:? "dataURI") <*> (x .:? "entryName")
      )

instance Hashable DatasetEntry

instance NFData DatasetEntry
