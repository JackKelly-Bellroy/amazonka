{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.IoT.Types.MitigationActionIdentifier
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.IoT.Types.MitigationActionIdentifier where

import Network.AWS.Lens
import Network.AWS.Prelude

-- | Information that identifies a mitigation action. This information is returned by ListMitigationActions.
--
--
--
-- /See:/ 'mitigationActionIdentifier' smart constructor.
data MitigationActionIdentifier = MitigationActionIdentifier'
  { _maiActionName ::
      !(Maybe Text),
    _maiActionARN ::
      !(Maybe Text),
    _maiCreationDate ::
      !(Maybe POSIX)
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'MitigationActionIdentifier' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'maiActionName' - The friendly name of the mitigation action.
--
-- * 'maiActionARN' - The IAM role ARN used to apply this mitigation action.
--
-- * 'maiCreationDate' - The date when this mitigation action was created.
mitigationActionIdentifier ::
  MitigationActionIdentifier
mitigationActionIdentifier =
  MitigationActionIdentifier'
    { _maiActionName =
        Nothing,
      _maiActionARN = Nothing,
      _maiCreationDate = Nothing
    }

-- | The friendly name of the mitigation action.
maiActionName :: Lens' MitigationActionIdentifier (Maybe Text)
maiActionName = lens _maiActionName (\s a -> s {_maiActionName = a})

-- | The IAM role ARN used to apply this mitigation action.
maiActionARN :: Lens' MitigationActionIdentifier (Maybe Text)
maiActionARN = lens _maiActionARN (\s a -> s {_maiActionARN = a})

-- | The date when this mitigation action was created.
maiCreationDate :: Lens' MitigationActionIdentifier (Maybe UTCTime)
maiCreationDate = lens _maiCreationDate (\s a -> s {_maiCreationDate = a}) . mapping _Time

instance FromJSON MitigationActionIdentifier where
  parseJSON =
    withObject
      "MitigationActionIdentifier"
      ( \x ->
          MitigationActionIdentifier'
            <$> (x .:? "actionName")
            <*> (x .:? "actionArn")
            <*> (x .:? "creationDate")
      )

instance Hashable MitigationActionIdentifier

instance NFData MitigationActionIdentifier
