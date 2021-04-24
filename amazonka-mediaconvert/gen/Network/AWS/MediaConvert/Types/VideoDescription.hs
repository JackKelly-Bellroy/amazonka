{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.MediaConvert.Types.VideoDescription
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.MediaConvert.Types.VideoDescription where

import Network.AWS.Lens
import Network.AWS.MediaConvert.Types.AfdSignaling
import Network.AWS.MediaConvert.Types.AntiAlias
import Network.AWS.MediaConvert.Types.ColorMetadata
import Network.AWS.MediaConvert.Types.DropFrameTimecode
import Network.AWS.MediaConvert.Types.Rectangle
import Network.AWS.MediaConvert.Types.RespondToAfd
import Network.AWS.MediaConvert.Types.ScalingBehavior
import Network.AWS.MediaConvert.Types.VideoCodecSettings
import Network.AWS.MediaConvert.Types.VideoPreprocessor
import Network.AWS.MediaConvert.Types.VideoTimecodeInsertion
import Network.AWS.Prelude

-- | Settings for video outputs
--
-- /See:/ 'videoDescription' smart constructor.
data VideoDescription = VideoDescription'
  { _vdHeight ::
      !(Maybe Nat),
    _vdAntiAlias :: !(Maybe AntiAlias),
    _vdDropFrameTimecode ::
      !(Maybe DropFrameTimecode),
    _vdRespondToAfd ::
      !(Maybe RespondToAfd),
    _vdWidth :: !(Maybe Nat),
    _vdCodecSettings ::
      !(Maybe VideoCodecSettings),
    _vdColorMetadata ::
      !(Maybe ColorMetadata),
    _vdFixedAfd :: !(Maybe Nat),
    _vdTimecodeInsertion ::
      !(Maybe VideoTimecodeInsertion),
    _vdScalingBehavior ::
      !(Maybe ScalingBehavior),
    _vdPosition :: !(Maybe Rectangle),
    _vdCrop :: !(Maybe Rectangle),
    _vdVideoPreprocessors ::
      !(Maybe VideoPreprocessor),
    _vdSharpness :: !(Maybe Nat),
    _vdAfdSignaling ::
      !(Maybe AfdSignaling)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'VideoDescription' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'vdHeight' - Use the Height (Height) setting to define the video resolution height for this output. Specify in pixels. If you don't provide a value here, the service will use the input height.
--
-- * 'vdAntiAlias' - The anti-alias filter is automatically applied to all outputs. The service no longer accepts the value DISABLED for AntiAlias. If you specify that in your job, the service will ignore the setting.
--
-- * 'vdDropFrameTimecode' - Applies only to 29.97 fps outputs. When this feature is enabled, the service will use drop-frame timecode on outputs. If it is not possible to use drop-frame timecode, the system will fall back to non-drop-frame. This setting is enabled by default when Timecode insertion (TimecodeInsertion) is enabled.
--
-- * 'vdRespondToAfd' - Use Respond to AFD (RespondToAfd) to specify how the service changes the video itself in response to AFD values in the input. * Choose Respond to clip the input video frame according to the AFD value, input display aspect ratio, and output display aspect ratio. * Choose Passthrough to include the input AFD values. Do not choose this when AfdSignaling is set to (NONE). A preferred implementation of this workflow is to set RespondToAfd to (NONE) and set AfdSignaling to (AUTO). * Choose None to remove all input AFD values from this output.
--
-- * 'vdWidth' - Use Width (Width) to define the video resolution width, in pixels, for this output. If you don't provide a value here, the service will use the input width.
--
-- * 'vdCodecSettings' - Video codec settings, (CodecSettings) under (VideoDescription), contains the group of settings related to video encoding. The settings in this group vary depending on the value that you choose for Video codec (Codec). For each codec enum that you choose, define the corresponding settings object. The following lists the codec enum, settings object pairs. * AV1, Av1Settings * AVC_INTRA, AvcIntraSettings * FRAME_CAPTURE, FrameCaptureSettings * H_264, H264Settings * H_265, H265Settings * MPEG2, Mpeg2Settings * PRORES, ProresSettings * VC3, Vc3Settings * VP8, Vp8Settings * VP9, Vp9Settings
--
-- * 'vdColorMetadata' - Choose Insert (INSERT) for this setting to include color metadata in this output. Choose Ignore (IGNORE) to exclude color metadata from this output. If you don't specify a value, the service sets this to Insert by default.
--
-- * 'vdFixedAfd' - Applies only if you set AFD Signaling(AfdSignaling) to Fixed (FIXED). Use Fixed (FixedAfd) to specify a four-bit AFD value which the service will write on all  frames of this video output.
--
-- * 'vdTimecodeInsertion' - Applies only to H.264, H.265, MPEG2, and ProRes outputs. Only enable Timecode insertion when the input frame rate is identical to the output frame rate. To include timecodes in this output, set Timecode insertion (VideoTimecodeInsertion) to PIC_TIMING_SEI. To leave them out, set it to DISABLED. Default is DISABLED. When the service inserts timecodes in an output, by default, it uses any embedded timecodes from the input. If none are present, the service will set the timecode for the first output frame to zero. To change this default behavior, adjust the settings under Timecode configuration (TimecodeConfig). In the console, these settings are located under Job > Job settings > Timecode configuration. Note - Timecode source under input settings (InputTimecodeSource) does not affect the timecodes that are inserted in the output. Source under Job settings > Timecode configuration (TimecodeSource) does.
--
-- * 'vdScalingBehavior' - Specify how the service handles outputs that have a different aspect ratio from the input aspect ratio. Choose Stretch to output (STRETCH_TO_OUTPUT) to have the service stretch your video image to fit. Keep the setting Default (DEFAULT) to have the service letterbox your video instead. This setting overrides any value that you specify for the setting Selection placement (position) in this output.
--
-- * 'vdPosition' - Use Selection placement (position) to define the video area in your output frame. The area outside of the rectangle that you specify here is black.
--
-- * 'vdCrop' - Use Cropping selection (crop) to specify the video area that the service will include in the output video frame.
--
-- * 'vdVideoPreprocessors' - Find additional transcoding features under Preprocessors (VideoPreprocessors). Enable the features at each output individually. These features are disabled by default.
--
-- * 'vdSharpness' - Use Sharpness (Sharpness) setting to specify the strength of anti-aliasing. This setting changes the width of the anti-alias filter kernel used for scaling. Sharpness only applies if your output resolution is different from your input resolution. 0 is the softest setting, 100 the sharpest, and 50 recommended for most content.
--
-- * 'vdAfdSignaling' - This setting only applies to H.264, H.265, and MPEG2 outputs. Use Insert AFD signaling (AfdSignaling) to specify whether the service includes AFD values in the output video data and what those values are. * Choose None to remove all AFD values from this output. * Choose Fixed to ignore input AFD values and instead encode the value specified in the job. * Choose Auto to calculate output AFD values based on the input AFD scaler data.
videoDescription ::
  VideoDescription
videoDescription =
  VideoDescription'
    { _vdHeight = Nothing,
      _vdAntiAlias = Nothing,
      _vdDropFrameTimecode = Nothing,
      _vdRespondToAfd = Nothing,
      _vdWidth = Nothing,
      _vdCodecSettings = Nothing,
      _vdColorMetadata = Nothing,
      _vdFixedAfd = Nothing,
      _vdTimecodeInsertion = Nothing,
      _vdScalingBehavior = Nothing,
      _vdPosition = Nothing,
      _vdCrop = Nothing,
      _vdVideoPreprocessors = Nothing,
      _vdSharpness = Nothing,
      _vdAfdSignaling = Nothing
    }

-- | Use the Height (Height) setting to define the video resolution height for this output. Specify in pixels. If you don't provide a value here, the service will use the input height.
vdHeight :: Lens' VideoDescription (Maybe Natural)
vdHeight = lens _vdHeight (\s a -> s {_vdHeight = a}) . mapping _Nat

-- | The anti-alias filter is automatically applied to all outputs. The service no longer accepts the value DISABLED for AntiAlias. If you specify that in your job, the service will ignore the setting.
vdAntiAlias :: Lens' VideoDescription (Maybe AntiAlias)
vdAntiAlias = lens _vdAntiAlias (\s a -> s {_vdAntiAlias = a})

-- | Applies only to 29.97 fps outputs. When this feature is enabled, the service will use drop-frame timecode on outputs. If it is not possible to use drop-frame timecode, the system will fall back to non-drop-frame. This setting is enabled by default when Timecode insertion (TimecodeInsertion) is enabled.
vdDropFrameTimecode :: Lens' VideoDescription (Maybe DropFrameTimecode)
vdDropFrameTimecode = lens _vdDropFrameTimecode (\s a -> s {_vdDropFrameTimecode = a})

-- | Use Respond to AFD (RespondToAfd) to specify how the service changes the video itself in response to AFD values in the input. * Choose Respond to clip the input video frame according to the AFD value, input display aspect ratio, and output display aspect ratio. * Choose Passthrough to include the input AFD values. Do not choose this when AfdSignaling is set to (NONE). A preferred implementation of this workflow is to set RespondToAfd to (NONE) and set AfdSignaling to (AUTO). * Choose None to remove all input AFD values from this output.
vdRespondToAfd :: Lens' VideoDescription (Maybe RespondToAfd)
vdRespondToAfd = lens _vdRespondToAfd (\s a -> s {_vdRespondToAfd = a})

-- | Use Width (Width) to define the video resolution width, in pixels, for this output. If you don't provide a value here, the service will use the input width.
vdWidth :: Lens' VideoDescription (Maybe Natural)
vdWidth = lens _vdWidth (\s a -> s {_vdWidth = a}) . mapping _Nat

-- | Video codec settings, (CodecSettings) under (VideoDescription), contains the group of settings related to video encoding. The settings in this group vary depending on the value that you choose for Video codec (Codec). For each codec enum that you choose, define the corresponding settings object. The following lists the codec enum, settings object pairs. * AV1, Av1Settings * AVC_INTRA, AvcIntraSettings * FRAME_CAPTURE, FrameCaptureSettings * H_264, H264Settings * H_265, H265Settings * MPEG2, Mpeg2Settings * PRORES, ProresSettings * VC3, Vc3Settings * VP8, Vp8Settings * VP9, Vp9Settings
vdCodecSettings :: Lens' VideoDescription (Maybe VideoCodecSettings)
vdCodecSettings = lens _vdCodecSettings (\s a -> s {_vdCodecSettings = a})

-- | Choose Insert (INSERT) for this setting to include color metadata in this output. Choose Ignore (IGNORE) to exclude color metadata from this output. If you don't specify a value, the service sets this to Insert by default.
vdColorMetadata :: Lens' VideoDescription (Maybe ColorMetadata)
vdColorMetadata = lens _vdColorMetadata (\s a -> s {_vdColorMetadata = a})

-- | Applies only if you set AFD Signaling(AfdSignaling) to Fixed (FIXED). Use Fixed (FixedAfd) to specify a four-bit AFD value which the service will write on all  frames of this video output.
vdFixedAfd :: Lens' VideoDescription (Maybe Natural)
vdFixedAfd = lens _vdFixedAfd (\s a -> s {_vdFixedAfd = a}) . mapping _Nat

-- | Applies only to H.264, H.265, MPEG2, and ProRes outputs. Only enable Timecode insertion when the input frame rate is identical to the output frame rate. To include timecodes in this output, set Timecode insertion (VideoTimecodeInsertion) to PIC_TIMING_SEI. To leave them out, set it to DISABLED. Default is DISABLED. When the service inserts timecodes in an output, by default, it uses any embedded timecodes from the input. If none are present, the service will set the timecode for the first output frame to zero. To change this default behavior, adjust the settings under Timecode configuration (TimecodeConfig). In the console, these settings are located under Job > Job settings > Timecode configuration. Note - Timecode source under input settings (InputTimecodeSource) does not affect the timecodes that are inserted in the output. Source under Job settings > Timecode configuration (TimecodeSource) does.
vdTimecodeInsertion :: Lens' VideoDescription (Maybe VideoTimecodeInsertion)
vdTimecodeInsertion = lens _vdTimecodeInsertion (\s a -> s {_vdTimecodeInsertion = a})

-- | Specify how the service handles outputs that have a different aspect ratio from the input aspect ratio. Choose Stretch to output (STRETCH_TO_OUTPUT) to have the service stretch your video image to fit. Keep the setting Default (DEFAULT) to have the service letterbox your video instead. This setting overrides any value that you specify for the setting Selection placement (position) in this output.
vdScalingBehavior :: Lens' VideoDescription (Maybe ScalingBehavior)
vdScalingBehavior = lens _vdScalingBehavior (\s a -> s {_vdScalingBehavior = a})

-- | Use Selection placement (position) to define the video area in your output frame. The area outside of the rectangle that you specify here is black.
vdPosition :: Lens' VideoDescription (Maybe Rectangle)
vdPosition = lens _vdPosition (\s a -> s {_vdPosition = a})

-- | Use Cropping selection (crop) to specify the video area that the service will include in the output video frame.
vdCrop :: Lens' VideoDescription (Maybe Rectangle)
vdCrop = lens _vdCrop (\s a -> s {_vdCrop = a})

-- | Find additional transcoding features under Preprocessors (VideoPreprocessors). Enable the features at each output individually. These features are disabled by default.
vdVideoPreprocessors :: Lens' VideoDescription (Maybe VideoPreprocessor)
vdVideoPreprocessors = lens _vdVideoPreprocessors (\s a -> s {_vdVideoPreprocessors = a})

-- | Use Sharpness (Sharpness) setting to specify the strength of anti-aliasing. This setting changes the width of the anti-alias filter kernel used for scaling. Sharpness only applies if your output resolution is different from your input resolution. 0 is the softest setting, 100 the sharpest, and 50 recommended for most content.
vdSharpness :: Lens' VideoDescription (Maybe Natural)
vdSharpness = lens _vdSharpness (\s a -> s {_vdSharpness = a}) . mapping _Nat

-- | This setting only applies to H.264, H.265, and MPEG2 outputs. Use Insert AFD signaling (AfdSignaling) to specify whether the service includes AFD values in the output video data and what those values are. * Choose None to remove all AFD values from this output. * Choose Fixed to ignore input AFD values and instead encode the value specified in the job. * Choose Auto to calculate output AFD values based on the input AFD scaler data.
vdAfdSignaling :: Lens' VideoDescription (Maybe AfdSignaling)
vdAfdSignaling = lens _vdAfdSignaling (\s a -> s {_vdAfdSignaling = a})

instance FromJSON VideoDescription where
  parseJSON =
    withObject
      "VideoDescription"
      ( \x ->
          VideoDescription'
            <$> (x .:? "height")
            <*> (x .:? "antiAlias")
            <*> (x .:? "dropFrameTimecode")
            <*> (x .:? "respondToAfd")
            <*> (x .:? "width")
            <*> (x .:? "codecSettings")
            <*> (x .:? "colorMetadata")
            <*> (x .:? "fixedAfd")
            <*> (x .:? "timecodeInsertion")
            <*> (x .:? "scalingBehavior")
            <*> (x .:? "position")
            <*> (x .:? "crop")
            <*> (x .:? "videoPreprocessors")
            <*> (x .:? "sharpness")
            <*> (x .:? "afdSignaling")
      )

instance Hashable VideoDescription

instance NFData VideoDescription

instance ToJSON VideoDescription where
  toJSON VideoDescription' {..} =
    object
      ( catMaybes
          [ ("height" .=) <$> _vdHeight,
            ("antiAlias" .=) <$> _vdAntiAlias,
            ("dropFrameTimecode" .=) <$> _vdDropFrameTimecode,
            ("respondToAfd" .=) <$> _vdRespondToAfd,
            ("width" .=) <$> _vdWidth,
            ("codecSettings" .=) <$> _vdCodecSettings,
            ("colorMetadata" .=) <$> _vdColorMetadata,
            ("fixedAfd" .=) <$> _vdFixedAfd,
            ("timecodeInsertion" .=) <$> _vdTimecodeInsertion,
            ("scalingBehavior" .=) <$> _vdScalingBehavior,
            ("position" .=) <$> _vdPosition,
            ("crop" .=) <$> _vdCrop,
            ("videoPreprocessors" .=) <$> _vdVideoPreprocessors,
            ("sharpness" .=) <$> _vdSharpness,
            ("afdSignaling" .=) <$> _vdAfdSignaling
          ]
      )
