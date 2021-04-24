{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.IAM.Types.AttachedPermissionsBoundary
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.IAM.Types.AttachedPermissionsBoundary where

import Network.AWS.IAM.Types.PermissionsBoundaryAttachmentType
import Network.AWS.Lens
import Network.AWS.Prelude

-- | Contains information about an attached permissions boundary.
--
--
-- An attached permissions boundary is a managed policy that has been attached to a user or role to set the permissions boundary.
--
-- For more information about permissions boundaries, see <https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html Permissions boundaries for IAM identities > in the /IAM User Guide/ .
--
--
-- /See:/ 'attachedPermissionsBoundary' smart constructor.
data AttachedPermissionsBoundary = AttachedPermissionsBoundary'
  { _apbPermissionsBoundaryARN ::
      !(Maybe Text),
    _apbPermissionsBoundaryType ::
      !( Maybe
           PermissionsBoundaryAttachmentType
       )
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'AttachedPermissionsBoundary' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'apbPermissionsBoundaryARN' - The ARN of the policy used to set the permissions boundary for the user or role.
--
-- * 'apbPermissionsBoundaryType' - The permissions boundary usage type that indicates what type of IAM resource is used as the permissions boundary for an entity. This data type can only have a value of @Policy@ .
attachedPermissionsBoundary ::
  AttachedPermissionsBoundary
attachedPermissionsBoundary =
  AttachedPermissionsBoundary'
    { _apbPermissionsBoundaryARN =
        Nothing,
      _apbPermissionsBoundaryType = Nothing
    }

-- | The ARN of the policy used to set the permissions boundary for the user or role.
apbPermissionsBoundaryARN :: Lens' AttachedPermissionsBoundary (Maybe Text)
apbPermissionsBoundaryARN = lens _apbPermissionsBoundaryARN (\s a -> s {_apbPermissionsBoundaryARN = a})

-- | The permissions boundary usage type that indicates what type of IAM resource is used as the permissions boundary for an entity. This data type can only have a value of @Policy@ .
apbPermissionsBoundaryType :: Lens' AttachedPermissionsBoundary (Maybe PermissionsBoundaryAttachmentType)
apbPermissionsBoundaryType = lens _apbPermissionsBoundaryType (\s a -> s {_apbPermissionsBoundaryType = a})

instance FromXML AttachedPermissionsBoundary where
  parseXML x =
    AttachedPermissionsBoundary'
      <$> (x .@? "PermissionsBoundaryArn")
      <*> (x .@? "PermissionsBoundaryType")

instance Hashable AttachedPermissionsBoundary

instance NFData AttachedPermissionsBoundary
