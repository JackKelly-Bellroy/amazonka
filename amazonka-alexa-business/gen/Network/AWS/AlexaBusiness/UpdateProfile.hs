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
-- Module      : Network.AWS.AlexaBusiness.UpdateProfile
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Updates an existing room profile by room profile ARN.
module Network.AWS.AlexaBusiness.UpdateProfile
  ( -- * Creating a Request
    updateProfile,
    UpdateProfile,

    -- * Request Lenses
    upProfileName,
    upIsDefault,
    upAddress,
    upLocale,
    upTemperatureUnit,
    upSetupModeDisabled,
    upPSTNEnabled,
    upMaxVolumeLimit,
    upMeetingRoomConfiguration,
    upWakeWord,
    upProfileARN,
    upTimezone,
    upDistanceUnit,

    -- * Destructuring the Response
    updateProfileResponse,
    UpdateProfileResponse,

    -- * Response Lenses
    uprrsResponseStatus,
  )
where

import Network.AWS.AlexaBusiness.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'updateProfile' smart constructor.
data UpdateProfile = UpdateProfile'
  { _upProfileName ::
      !(Maybe Text),
    _upIsDefault :: !(Maybe Bool),
    _upAddress :: !(Maybe Text),
    _upLocale :: !(Maybe Text),
    _upTemperatureUnit ::
      !(Maybe TemperatureUnit),
    _upSetupModeDisabled :: !(Maybe Bool),
    _upPSTNEnabled :: !(Maybe Bool),
    _upMaxVolumeLimit :: !(Maybe Int),
    _upMeetingRoomConfiguration ::
      !(Maybe UpdateMeetingRoomConfiguration),
    _upWakeWord :: !(Maybe WakeWord),
    _upProfileARN :: !(Maybe Text),
    _upTimezone :: !(Maybe Text),
    _upDistanceUnit :: !(Maybe DistanceUnit)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'UpdateProfile' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'upProfileName' - The updated name for the room profile.
--
-- * 'upIsDefault' - Sets the profile as default if selected. If this is missing, no update is done to the default status.
--
-- * 'upAddress' - The updated address for the room profile.
--
-- * 'upLocale' - The updated locale for the room profile. (This is currently only available to a limited preview audience.)
--
-- * 'upTemperatureUnit' - The updated temperature unit for the room profile.
--
-- * 'upSetupModeDisabled' - Whether the setup mode of the profile is enabled.
--
-- * 'upPSTNEnabled' - Whether the PSTN setting of the room profile is enabled.
--
-- * 'upMaxVolumeLimit' - The updated maximum volume limit for the room profile.
--
-- * 'upMeetingRoomConfiguration' - The updated meeting room settings of a room profile.
--
-- * 'upWakeWord' - The updated wake word for the room profile.
--
-- * 'upProfileARN' - The ARN of the room profile to update. Required.
--
-- * 'upTimezone' - The updated timezone for the room profile.
--
-- * 'upDistanceUnit' - The updated distance unit for the room profile.
updateProfile ::
  UpdateProfile
updateProfile =
  UpdateProfile'
    { _upProfileName = Nothing,
      _upIsDefault = Nothing,
      _upAddress = Nothing,
      _upLocale = Nothing,
      _upTemperatureUnit = Nothing,
      _upSetupModeDisabled = Nothing,
      _upPSTNEnabled = Nothing,
      _upMaxVolumeLimit = Nothing,
      _upMeetingRoomConfiguration = Nothing,
      _upWakeWord = Nothing,
      _upProfileARN = Nothing,
      _upTimezone = Nothing,
      _upDistanceUnit = Nothing
    }

-- | The updated name for the room profile.
upProfileName :: Lens' UpdateProfile (Maybe Text)
upProfileName = lens _upProfileName (\s a -> s {_upProfileName = a})

-- | Sets the profile as default if selected. If this is missing, no update is done to the default status.
upIsDefault :: Lens' UpdateProfile (Maybe Bool)
upIsDefault = lens _upIsDefault (\s a -> s {_upIsDefault = a})

-- | The updated address for the room profile.
upAddress :: Lens' UpdateProfile (Maybe Text)
upAddress = lens _upAddress (\s a -> s {_upAddress = a})

-- | The updated locale for the room profile. (This is currently only available to a limited preview audience.)
upLocale :: Lens' UpdateProfile (Maybe Text)
upLocale = lens _upLocale (\s a -> s {_upLocale = a})

-- | The updated temperature unit for the room profile.
upTemperatureUnit :: Lens' UpdateProfile (Maybe TemperatureUnit)
upTemperatureUnit = lens _upTemperatureUnit (\s a -> s {_upTemperatureUnit = a})

-- | Whether the setup mode of the profile is enabled.
upSetupModeDisabled :: Lens' UpdateProfile (Maybe Bool)
upSetupModeDisabled = lens _upSetupModeDisabled (\s a -> s {_upSetupModeDisabled = a})

-- | Whether the PSTN setting of the room profile is enabled.
upPSTNEnabled :: Lens' UpdateProfile (Maybe Bool)
upPSTNEnabled = lens _upPSTNEnabled (\s a -> s {_upPSTNEnabled = a})

-- | The updated maximum volume limit for the room profile.
upMaxVolumeLimit :: Lens' UpdateProfile (Maybe Int)
upMaxVolumeLimit = lens _upMaxVolumeLimit (\s a -> s {_upMaxVolumeLimit = a})

-- | The updated meeting room settings of a room profile.
upMeetingRoomConfiguration :: Lens' UpdateProfile (Maybe UpdateMeetingRoomConfiguration)
upMeetingRoomConfiguration = lens _upMeetingRoomConfiguration (\s a -> s {_upMeetingRoomConfiguration = a})

-- | The updated wake word for the room profile.
upWakeWord :: Lens' UpdateProfile (Maybe WakeWord)
upWakeWord = lens _upWakeWord (\s a -> s {_upWakeWord = a})

-- | The ARN of the room profile to update. Required.
upProfileARN :: Lens' UpdateProfile (Maybe Text)
upProfileARN = lens _upProfileARN (\s a -> s {_upProfileARN = a})

-- | The updated timezone for the room profile.
upTimezone :: Lens' UpdateProfile (Maybe Text)
upTimezone = lens _upTimezone (\s a -> s {_upTimezone = a})

-- | The updated distance unit for the room profile.
upDistanceUnit :: Lens' UpdateProfile (Maybe DistanceUnit)
upDistanceUnit = lens _upDistanceUnit (\s a -> s {_upDistanceUnit = a})

instance AWSRequest UpdateProfile where
  type Rs UpdateProfile = UpdateProfileResponse
  request = postJSON alexaBusiness
  response =
    receiveEmpty
      ( \s h x ->
          UpdateProfileResponse' <$> (pure (fromEnum s))
      )

instance Hashable UpdateProfile

instance NFData UpdateProfile

instance ToHeaders UpdateProfile where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ("AlexaForBusiness.UpdateProfile" :: ByteString),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON UpdateProfile where
  toJSON UpdateProfile' {..} =
    object
      ( catMaybes
          [ ("ProfileName" .=) <$> _upProfileName,
            ("IsDefault" .=) <$> _upIsDefault,
            ("Address" .=) <$> _upAddress,
            ("Locale" .=) <$> _upLocale,
            ("TemperatureUnit" .=) <$> _upTemperatureUnit,
            ("SetupModeDisabled" .=) <$> _upSetupModeDisabled,
            ("PSTNEnabled" .=) <$> _upPSTNEnabled,
            ("MaxVolumeLimit" .=) <$> _upMaxVolumeLimit,
            ("MeetingRoomConfiguration" .=)
              <$> _upMeetingRoomConfiguration,
            ("WakeWord" .=) <$> _upWakeWord,
            ("ProfileArn" .=) <$> _upProfileARN,
            ("Timezone" .=) <$> _upTimezone,
            ("DistanceUnit" .=) <$> _upDistanceUnit
          ]
      )

instance ToPath UpdateProfile where
  toPath = const "/"

instance ToQuery UpdateProfile where
  toQuery = const mempty

-- | /See:/ 'updateProfileResponse' smart constructor.
newtype UpdateProfileResponse = UpdateProfileResponse'
  { _uprrsResponseStatus ::
      Int
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'UpdateProfileResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'uprrsResponseStatus' - -- | The response status code.
updateProfileResponse ::
  -- | 'uprrsResponseStatus'
  Int ->
  UpdateProfileResponse
updateProfileResponse pResponseStatus_ =
  UpdateProfileResponse'
    { _uprrsResponseStatus =
        pResponseStatus_
    }

-- | -- | The response status code.
uprrsResponseStatus :: Lens' UpdateProfileResponse Int
uprrsResponseStatus = lens _uprrsResponseStatus (\s a -> s {_uprrsResponseStatus = a})

instance NFData UpdateProfileResponse
