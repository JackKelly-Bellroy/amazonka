{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Lambda.Types.AccountUsage
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.Lambda.Types.AccountUsage where

import Network.AWS.Lens
import Network.AWS.Prelude

-- | The number of functions and amount of storage in use.
--
--
--
-- /See:/ 'accountUsage' smart constructor.
data AccountUsage = AccountUsage'
  { _auFunctionCount ::
      !(Maybe Integer),
    _auTotalCodeSize :: !(Maybe Integer)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'AccountUsage' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'auFunctionCount' - The number of Lambda functions.
--
-- * 'auTotalCodeSize' - The amount of storage space, in bytes, that's being used by deployment packages and layer archives.
accountUsage ::
  AccountUsage
accountUsage =
  AccountUsage'
    { _auFunctionCount = Nothing,
      _auTotalCodeSize = Nothing
    }

-- | The number of Lambda functions.
auFunctionCount :: Lens' AccountUsage (Maybe Integer)
auFunctionCount = lens _auFunctionCount (\s a -> s {_auFunctionCount = a})

-- | The amount of storage space, in bytes, that's being used by deployment packages and layer archives.
auTotalCodeSize :: Lens' AccountUsage (Maybe Integer)
auTotalCodeSize = lens _auTotalCodeSize (\s a -> s {_auTotalCodeSize = a})

instance FromJSON AccountUsage where
  parseJSON =
    withObject
      "AccountUsage"
      ( \x ->
          AccountUsage'
            <$> (x .:? "FunctionCount") <*> (x .:? "TotalCodeSize")
      )

instance Hashable AccountUsage

instance NFData AccountUsage
