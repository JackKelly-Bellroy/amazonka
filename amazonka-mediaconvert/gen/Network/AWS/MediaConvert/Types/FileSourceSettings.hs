{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.MediaConvert.Types.FileSourceSettings
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.MediaConvert.Types.FileSourceSettings where

import Network.AWS.Lens
import Network.AWS.MediaConvert.Types.CaptionSourceFramerate
import Network.AWS.MediaConvert.Types.FileSourceConvert608To708
import Network.AWS.Prelude

-- | If your input captions are SCC, SMI, SRT, STL, TTML, or IMSC 1.1 in an xml file, specify the URI of the input caption source file. If your caption source is IMSC in an IMF package, use TrackSourceSettings instead of FileSoureSettings.
--
-- /See:/ 'fileSourceSettings' smart constructor.
data FileSourceSettings = FileSourceSettings'
  { _fssConvert608To708 ::
      !( Maybe
           FileSourceConvert608To708
       ),
    _fssFramerate ::
      !(Maybe CaptionSourceFramerate),
    _fssSourceFile :: !(Maybe Text),
    _fssTimeDelta :: !(Maybe Int)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'FileSourceSettings' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'fssConvert608To708' - Specify whether this set of input captions appears in your outputs in both 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert includes the captions data in two ways: it passes the 608 data through using the 608 compatibility bytes fields of the 708 wrapper, and it also translates the 608 data into 708.
--
-- * 'fssFramerate' - Ignore this setting unless your input captions format is SCC. To have the service compensate for differing frame rates between your input captions and input video, specify the frame rate of the captions file. Specify this value as a fraction, using the settings Framerate numerator (framerateNumerator) and Framerate denominator (framerateDenominator). For example, you might specify 24 / 1 for 24 fps, 25 / 1 for 25 fps, 24000 / 1001 for 23.976 fps, or 30000 / 1001 for 29.97 fps.
--
-- * 'fssSourceFile' - External caption file used for loading captions. Accepted file extensions are 'scc', 'ttml', 'dfxp', 'stl', 'srt', 'xml', and 'smi'.
--
-- * 'fssTimeDelta' - Specifies a time delta in seconds to offset the captions from the source file.
fileSourceSettings ::
  FileSourceSettings
fileSourceSettings =
  FileSourceSettings'
    { _fssConvert608To708 = Nothing,
      _fssFramerate = Nothing,
      _fssSourceFile = Nothing,
      _fssTimeDelta = Nothing
    }

-- | Specify whether this set of input captions appears in your outputs in both 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert includes the captions data in two ways: it passes the 608 data through using the 608 compatibility bytes fields of the 708 wrapper, and it also translates the 608 data into 708.
fssConvert608To708 :: Lens' FileSourceSettings (Maybe FileSourceConvert608To708)
fssConvert608To708 = lens _fssConvert608To708 (\s a -> s {_fssConvert608To708 = a})

-- | Ignore this setting unless your input captions format is SCC. To have the service compensate for differing frame rates between your input captions and input video, specify the frame rate of the captions file. Specify this value as a fraction, using the settings Framerate numerator (framerateNumerator) and Framerate denominator (framerateDenominator). For example, you might specify 24 / 1 for 24 fps, 25 / 1 for 25 fps, 24000 / 1001 for 23.976 fps, or 30000 / 1001 for 29.97 fps.
fssFramerate :: Lens' FileSourceSettings (Maybe CaptionSourceFramerate)
fssFramerate = lens _fssFramerate (\s a -> s {_fssFramerate = a})

-- | External caption file used for loading captions. Accepted file extensions are 'scc', 'ttml', 'dfxp', 'stl', 'srt', 'xml', and 'smi'.
fssSourceFile :: Lens' FileSourceSettings (Maybe Text)
fssSourceFile = lens _fssSourceFile (\s a -> s {_fssSourceFile = a})

-- | Specifies a time delta in seconds to offset the captions from the source file.
fssTimeDelta :: Lens' FileSourceSettings (Maybe Int)
fssTimeDelta = lens _fssTimeDelta (\s a -> s {_fssTimeDelta = a})

instance FromJSON FileSourceSettings where
  parseJSON =
    withObject
      "FileSourceSettings"
      ( \x ->
          FileSourceSettings'
            <$> (x .:? "convert608To708")
            <*> (x .:? "framerate")
            <*> (x .:? "sourceFile")
            <*> (x .:? "timeDelta")
      )

instance Hashable FileSourceSettings

instance NFData FileSourceSettings

instance ToJSON FileSourceSettings where
  toJSON FileSourceSettings' {..} =
    object
      ( catMaybes
          [ ("convert608To708" .=) <$> _fssConvert608To708,
            ("framerate" .=) <$> _fssFramerate,
            ("sourceFile" .=) <$> _fssSourceFile,
            ("timeDelta" .=) <$> _fssTimeDelta
          ]
      )
