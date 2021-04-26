{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.MediaConvert.Types.RemixSettings
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.MediaConvert.Types.RemixSettings where

import qualified Network.AWS.Lens as Lens
import Network.AWS.MediaConvert.Types.ChannelMapping
import qualified Network.AWS.Prelude as Prelude

-- | Use Manual audio remixing (RemixSettings) to adjust audio levels for
-- each audio channel in each output of your job. With audio remixing, you
-- can output more or fewer audio channels than your input audio source
-- provides.
--
-- /See:/ 'newRemixSettings' smart constructor.
data RemixSettings = RemixSettings'
  { -- | Channel mapping (ChannelMapping) contains the group of fields that hold
    -- the remixing value for each channel, in dB. Specify remix values to
    -- indicate how much of the content from your input audio channel you want
    -- in your output audio channels. Each instance of the InputChannels or
    -- InputChannelsFineTune array specifies these values for one output
    -- channel. Use one instance of this array for each output channel. In the
    -- console, each array corresponds to a column in the graphical depiction
    -- of the mapping matrix. The rows of the graphical matrix correspond to
    -- input channels. Valid values are within the range from -60 (mute)
    -- through 6. A setting of 0 passes the input channel unchanged to the
    -- output channel (no attenuation or amplification). Use InputChannels or
    -- InputChannelsFineTune to specify your remix values. Don\'t use both.
    channelMapping :: Prelude.Maybe ChannelMapping,
    -- | Specify the number of audio channels from your input that you want to
    -- use in your output. With remixing, you might combine or split the data
    -- in these channels, so the number of channels in your final output might
    -- be different. If you are doing both input channel mapping and output
    -- channel mapping, the number of output channels in your input mapping
    -- must be the same as the number of input channels in your output mapping.
    channelsIn :: Prelude.Maybe Prelude.Nat,
    -- | Specify the number of channels in this output after remixing. Valid
    -- values: 1, 2, 4, 6, 8... 64. (1 and even numbers to 64.) If you are
    -- doing both input channel mapping and output channel mapping, the number
    -- of output channels in your input mapping must be the same as the number
    -- of input channels in your output mapping.
    channelsOut :: Prelude.Maybe Prelude.Nat
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Data, Prelude.Typeable, Prelude.Generic)

-- |
-- Create a value of 'RemixSettings' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'channelMapping', 'remixSettings_channelMapping' - Channel mapping (ChannelMapping) contains the group of fields that hold
-- the remixing value for each channel, in dB. Specify remix values to
-- indicate how much of the content from your input audio channel you want
-- in your output audio channels. Each instance of the InputChannels or
-- InputChannelsFineTune array specifies these values for one output
-- channel. Use one instance of this array for each output channel. In the
-- console, each array corresponds to a column in the graphical depiction
-- of the mapping matrix. The rows of the graphical matrix correspond to
-- input channels. Valid values are within the range from -60 (mute)
-- through 6. A setting of 0 passes the input channel unchanged to the
-- output channel (no attenuation or amplification). Use InputChannels or
-- InputChannelsFineTune to specify your remix values. Don\'t use both.
--
-- 'channelsIn', 'remixSettings_channelsIn' - Specify the number of audio channels from your input that you want to
-- use in your output. With remixing, you might combine or split the data
-- in these channels, so the number of channels in your final output might
-- be different. If you are doing both input channel mapping and output
-- channel mapping, the number of output channels in your input mapping
-- must be the same as the number of input channels in your output mapping.
--
-- 'channelsOut', 'remixSettings_channelsOut' - Specify the number of channels in this output after remixing. Valid
-- values: 1, 2, 4, 6, 8... 64. (1 and even numbers to 64.) If you are
-- doing both input channel mapping and output channel mapping, the number
-- of output channels in your input mapping must be the same as the number
-- of input channels in your output mapping.
newRemixSettings ::
  RemixSettings
newRemixSettings =
  RemixSettings'
    { channelMapping = Prelude.Nothing,
      channelsIn = Prelude.Nothing,
      channelsOut = Prelude.Nothing
    }

-- | Channel mapping (ChannelMapping) contains the group of fields that hold
-- the remixing value for each channel, in dB. Specify remix values to
-- indicate how much of the content from your input audio channel you want
-- in your output audio channels. Each instance of the InputChannels or
-- InputChannelsFineTune array specifies these values for one output
-- channel. Use one instance of this array for each output channel. In the
-- console, each array corresponds to a column in the graphical depiction
-- of the mapping matrix. The rows of the graphical matrix correspond to
-- input channels. Valid values are within the range from -60 (mute)
-- through 6. A setting of 0 passes the input channel unchanged to the
-- output channel (no attenuation or amplification). Use InputChannels or
-- InputChannelsFineTune to specify your remix values. Don\'t use both.
remixSettings_channelMapping :: Lens.Lens' RemixSettings (Prelude.Maybe ChannelMapping)
remixSettings_channelMapping = Lens.lens (\RemixSettings' {channelMapping} -> channelMapping) (\s@RemixSettings' {} a -> s {channelMapping = a} :: RemixSettings)

-- | Specify the number of audio channels from your input that you want to
-- use in your output. With remixing, you might combine or split the data
-- in these channels, so the number of channels in your final output might
-- be different. If you are doing both input channel mapping and output
-- channel mapping, the number of output channels in your input mapping
-- must be the same as the number of input channels in your output mapping.
remixSettings_channelsIn :: Lens.Lens' RemixSettings (Prelude.Maybe Prelude.Natural)
remixSettings_channelsIn = Lens.lens (\RemixSettings' {channelsIn} -> channelsIn) (\s@RemixSettings' {} a -> s {channelsIn = a} :: RemixSettings) Prelude.. Lens.mapping Prelude._Nat

-- | Specify the number of channels in this output after remixing. Valid
-- values: 1, 2, 4, 6, 8... 64. (1 and even numbers to 64.) If you are
-- doing both input channel mapping and output channel mapping, the number
-- of output channels in your input mapping must be the same as the number
-- of input channels in your output mapping.
remixSettings_channelsOut :: Lens.Lens' RemixSettings (Prelude.Maybe Prelude.Natural)
remixSettings_channelsOut = Lens.lens (\RemixSettings' {channelsOut} -> channelsOut) (\s@RemixSettings' {} a -> s {channelsOut = a} :: RemixSettings) Prelude.. Lens.mapping Prelude._Nat

instance Prelude.FromJSON RemixSettings where
  parseJSON =
    Prelude.withObject
      "RemixSettings"
      ( \x ->
          RemixSettings'
            Prelude.<$> (x Prelude..:? "channelMapping")
            Prelude.<*> (x Prelude..:? "channelsIn")
            Prelude.<*> (x Prelude..:? "channelsOut")
      )

instance Prelude.Hashable RemixSettings

instance Prelude.NFData RemixSettings

instance Prelude.ToJSON RemixSettings where
  toJSON RemixSettings' {..} =
    Prelude.object
      ( Prelude.catMaybes
          [ ("channelMapping" Prelude..=)
              Prelude.<$> channelMapping,
            ("channelsIn" Prelude..=) Prelude.<$> channelsIn,
            ("channelsOut" Prelude..=) Prelude.<$> channelsOut
          ]
      )
