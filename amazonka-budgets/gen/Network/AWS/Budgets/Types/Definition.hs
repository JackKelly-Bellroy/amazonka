{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Budgets.Types.Definition
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.Budgets.Types.Definition where

import Network.AWS.Budgets.Types.IAMActionDefinition
import Network.AWS.Budgets.Types.ScpActionDefinition
import Network.AWS.Budgets.Types.SsmActionDefinition
import Network.AWS.Lens
import Network.AWS.Prelude

-- | Specifies all of the type-specific parameters.
--
--
--
-- /See:/ 'definition' smart constructor.
data Definition = Definition'
  { _dIAMActionDefinition ::
      !(Maybe IAMActionDefinition),
    _dSsmActionDefinition ::
      !(Maybe SsmActionDefinition),
    _dScpActionDefinition ::
      !(Maybe ScpActionDefinition)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'Definition' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dIAMActionDefinition' - The AWS Identity and Access Management (IAM) action definition details.
--
-- * 'dSsmActionDefinition' - The AWS Systems Manager (SSM) action definition details.
--
-- * 'dScpActionDefinition' - The service control policies (SCPs) action definition details.
definition ::
  Definition
definition =
  Definition'
    { _dIAMActionDefinition = Nothing,
      _dSsmActionDefinition = Nothing,
      _dScpActionDefinition = Nothing
    }

-- | The AWS Identity and Access Management (IAM) action definition details.
dIAMActionDefinition :: Lens' Definition (Maybe IAMActionDefinition)
dIAMActionDefinition = lens _dIAMActionDefinition (\s a -> s {_dIAMActionDefinition = a})

-- | The AWS Systems Manager (SSM) action definition details.
dSsmActionDefinition :: Lens' Definition (Maybe SsmActionDefinition)
dSsmActionDefinition = lens _dSsmActionDefinition (\s a -> s {_dSsmActionDefinition = a})

-- | The service control policies (SCPs) action definition details.
dScpActionDefinition :: Lens' Definition (Maybe ScpActionDefinition)
dScpActionDefinition = lens _dScpActionDefinition (\s a -> s {_dScpActionDefinition = a})

instance FromJSON Definition where
  parseJSON =
    withObject
      "Definition"
      ( \x ->
          Definition'
            <$> (x .:? "IamActionDefinition")
            <*> (x .:? "SsmActionDefinition")
            <*> (x .:? "ScpActionDefinition")
      )

instance Hashable Definition

instance NFData Definition

instance ToJSON Definition where
  toJSON Definition' {..} =
    object
      ( catMaybes
          [ ("IamActionDefinition" .=)
              <$> _dIAMActionDefinition,
            ("SsmActionDefinition" .=) <$> _dSsmActionDefinition,
            ("ScpActionDefinition" .=)
              <$> _dScpActionDefinition
          ]
      )
