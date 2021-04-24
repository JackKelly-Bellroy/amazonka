{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Transcribe.Types.MedicalTranscriptionSetting
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.Transcribe.Types.MedicalTranscriptionSetting where

import Network.AWS.Lens
import Network.AWS.Prelude

-- | Optional settings for the 'StartMedicalTranscriptionJob' operation.
--
--
--
-- /See:/ 'medicalTranscriptionSetting' smart constructor.
data MedicalTranscriptionSetting = MedicalTranscriptionSetting'
  { _mtsShowAlternatives ::
      !(Maybe Bool),
    _mtsChannelIdentification ::
      !(Maybe Bool),
    _mtsMaxAlternatives ::
      !(Maybe Nat),
    _mtsShowSpeakerLabels ::
      !(Maybe Bool),
    _mtsVocabularyName ::
      !(Maybe Text),
    _mtsMaxSpeakerLabels ::
      !(Maybe Nat)
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'MedicalTranscriptionSetting' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'mtsShowAlternatives' - Determines whether alternative transcripts are generated along with the transcript that has the highest confidence. If you set @ShowAlternatives@ field to true, you must also set the maximum number of alternatives to return in the @MaxAlternatives@ field.
--
-- * 'mtsChannelIdentification' - Instructs Amazon Transcribe Medical to process each audio channel separately and then merge the transcription output of each channel into a single transcription. Amazon Transcribe Medical also produces a transcription of each item detected on an audio channel, including the start time and end time of the item and alternative transcriptions of item. The alternative transcriptions also come with confidence scores provided by Amazon Transcribe Medical. You can't set both @ShowSpeakerLabels@ and @ChannelIdentification@ in the same request. If you set both, your request returns a @BadRequestException@
--
-- * 'mtsMaxAlternatives' - The maximum number of alternatives that you tell the service to return. If you specify the @MaxAlternatives@ field, you must set the @ShowAlternatives@ field to true.
--
-- * 'mtsShowSpeakerLabels' - Determines whether the transcription job uses speaker recognition to identify different speakers in the input audio. Speaker recognition labels individual speakers in the audio file. If you set the @ShowSpeakerLabels@ field to true, you must also set the maximum number of speaker labels in the @MaxSpeakerLabels@ field. You can't set both @ShowSpeakerLabels@ and @ChannelIdentification@ in the same request. If you set both, your request returns a @BadRequestException@ .
--
-- * 'mtsVocabularyName' - The name of the vocabulary to use when processing a medical transcription job.
--
-- * 'mtsMaxSpeakerLabels' - The maximum number of speakers to identify in the input audio. If there are more speakers in the audio than this number, multiple speakers are identified as a single speaker. If you specify the @MaxSpeakerLabels@ field, you must set the @ShowSpeakerLabels@ field to true.
medicalTranscriptionSetting ::
  MedicalTranscriptionSetting
medicalTranscriptionSetting =
  MedicalTranscriptionSetting'
    { _mtsShowAlternatives =
        Nothing,
      _mtsChannelIdentification = Nothing,
      _mtsMaxAlternatives = Nothing,
      _mtsShowSpeakerLabels = Nothing,
      _mtsVocabularyName = Nothing,
      _mtsMaxSpeakerLabels = Nothing
    }

-- | Determines whether alternative transcripts are generated along with the transcript that has the highest confidence. If you set @ShowAlternatives@ field to true, you must also set the maximum number of alternatives to return in the @MaxAlternatives@ field.
mtsShowAlternatives :: Lens' MedicalTranscriptionSetting (Maybe Bool)
mtsShowAlternatives = lens _mtsShowAlternatives (\s a -> s {_mtsShowAlternatives = a})

-- | Instructs Amazon Transcribe Medical to process each audio channel separately and then merge the transcription output of each channel into a single transcription. Amazon Transcribe Medical also produces a transcription of each item detected on an audio channel, including the start time and end time of the item and alternative transcriptions of item. The alternative transcriptions also come with confidence scores provided by Amazon Transcribe Medical. You can't set both @ShowSpeakerLabels@ and @ChannelIdentification@ in the same request. If you set both, your request returns a @BadRequestException@
mtsChannelIdentification :: Lens' MedicalTranscriptionSetting (Maybe Bool)
mtsChannelIdentification = lens _mtsChannelIdentification (\s a -> s {_mtsChannelIdentification = a})

-- | The maximum number of alternatives that you tell the service to return. If you specify the @MaxAlternatives@ field, you must set the @ShowAlternatives@ field to true.
mtsMaxAlternatives :: Lens' MedicalTranscriptionSetting (Maybe Natural)
mtsMaxAlternatives = lens _mtsMaxAlternatives (\s a -> s {_mtsMaxAlternatives = a}) . mapping _Nat

-- | Determines whether the transcription job uses speaker recognition to identify different speakers in the input audio. Speaker recognition labels individual speakers in the audio file. If you set the @ShowSpeakerLabels@ field to true, you must also set the maximum number of speaker labels in the @MaxSpeakerLabels@ field. You can't set both @ShowSpeakerLabels@ and @ChannelIdentification@ in the same request. If you set both, your request returns a @BadRequestException@ .
mtsShowSpeakerLabels :: Lens' MedicalTranscriptionSetting (Maybe Bool)
mtsShowSpeakerLabels = lens _mtsShowSpeakerLabels (\s a -> s {_mtsShowSpeakerLabels = a})

-- | The name of the vocabulary to use when processing a medical transcription job.
mtsVocabularyName :: Lens' MedicalTranscriptionSetting (Maybe Text)
mtsVocabularyName = lens _mtsVocabularyName (\s a -> s {_mtsVocabularyName = a})

-- | The maximum number of speakers to identify in the input audio. If there are more speakers in the audio than this number, multiple speakers are identified as a single speaker. If you specify the @MaxSpeakerLabels@ field, you must set the @ShowSpeakerLabels@ field to true.
mtsMaxSpeakerLabels :: Lens' MedicalTranscriptionSetting (Maybe Natural)
mtsMaxSpeakerLabels = lens _mtsMaxSpeakerLabels (\s a -> s {_mtsMaxSpeakerLabels = a}) . mapping _Nat

instance FromJSON MedicalTranscriptionSetting where
  parseJSON =
    withObject
      "MedicalTranscriptionSetting"
      ( \x ->
          MedicalTranscriptionSetting'
            <$> (x .:? "ShowAlternatives")
            <*> (x .:? "ChannelIdentification")
            <*> (x .:? "MaxAlternatives")
            <*> (x .:? "ShowSpeakerLabels")
            <*> (x .:? "VocabularyName")
            <*> (x .:? "MaxSpeakerLabels")
      )

instance Hashable MedicalTranscriptionSetting

instance NFData MedicalTranscriptionSetting

instance ToJSON MedicalTranscriptionSetting where
  toJSON MedicalTranscriptionSetting' {..} =
    object
      ( catMaybes
          [ ("ShowAlternatives" .=) <$> _mtsShowAlternatives,
            ("ChannelIdentification" .=)
              <$> _mtsChannelIdentification,
            ("MaxAlternatives" .=) <$> _mtsMaxAlternatives,
            ("ShowSpeakerLabels" .=) <$> _mtsShowSpeakerLabels,
            ("VocabularyName" .=) <$> _mtsVocabularyName,
            ("MaxSpeakerLabels" .=) <$> _mtsMaxSpeakerLabels
          ]
      )
