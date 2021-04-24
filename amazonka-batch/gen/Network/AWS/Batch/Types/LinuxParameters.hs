{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Batch.Types.LinuxParameters
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.Batch.Types.LinuxParameters where

import Network.AWS.Batch.Types.Device
import Network.AWS.Batch.Types.Tmpfs
import Network.AWS.Lens
import Network.AWS.Prelude

-- | Linux-specific modifications that are applied to the container, such as details for device mappings.
--
--
--
-- /See:/ 'linuxParameters' smart constructor.
data LinuxParameters = LinuxParameters'
  { _lpTmpfs ::
      !(Maybe [Tmpfs]),
    _lpMaxSwap :: !(Maybe Int),
    _lpDevices :: !(Maybe [Device]),
    _lpSwappiness :: !(Maybe Int),
    _lpInitProcessEnabled :: !(Maybe Bool),
    _lpSharedMemorySize :: !(Maybe Int)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'LinuxParameters' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lpTmpfs' - The container path, mount options, and size (in MiB) of the tmpfs mount. This parameter maps to the @--tmpfs@ option to <https://docs.docker.com/engine/reference/run/ docker run> .
--
-- * 'lpMaxSwap' - The total amount of swap memory (in MiB) a container can use. This parameter is translated to the @--memory-swap@ option to <https://docs.docker.com/engine/reference/run/ docker run> where the value is the sum of the container memory plus the @maxSwap@ value. For more information, see <https://docs.docker.com/config/containers/resource_constraints/#--memory-swap-details @--memory-swap@ details> in the Docker documentation. If a @maxSwap@ value of @0@ is specified, the container doesn't use swap. Accepted values are @0@ or any positive integer. If the @maxSwap@ parameter is omitted, the container doesn't use the swap configuration for the container instance it is running on. A @maxSwap@ value must be set for the @swappiness@ parameter to be used.
--
-- * 'lpDevices' - Any host devices to expose to the container. This parameter maps to @Devices@ in the <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container> section of the <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the @--device@ option to <https://docs.docker.com/engine/reference/run/ docker run> .
--
-- * 'lpSwappiness' - This allows you to tune a container's memory swappiness behavior. A @swappiness@ value of @0@ causes swapping not to happen unless absolutely necessary. A @swappiness@ value of @100@ causes pages to be swapped very aggressively. Accepted values are whole numbers between @0@ and @100@ . If the @swappiness@ parameter isn't specified, a default value of @60@ is used. If a value isn't specified for @maxSwap@ then this parameter is ignored. If @maxSwap@ is set to 0, the container doesn't use swap. This parameter maps to the @--memory-swappiness@ option to <https://docs.docker.com/engine/reference/run/ docker run> . Consider the following when you use a per-container swap configuration.     * Swap space must be enabled and allocated on the container instance for the containers to use.     * The swap space parameters are only supported for job definitions using EC2 resources.     * If the @maxSwap@ and @swappiness@ parameters are omitted from a job definition, each container will have a default @swappiness@ value of 60 and the total swap usage will be limited to two times the memory reservation of the container.
--
-- * 'lpInitProcessEnabled' - If true, run an @init@ process inside the container that forwards signals and reaps processes. This parameter maps to the @--init@ option to <https://docs.docker.com/engine/reference/run/ docker run> . This parameter requires version 1.25 of the Docker Remote API or greater on your container instance. To check the Docker Remote API version on your container instance, log into your container instance and run the following command: @sudo docker version | grep "Server API version"@
--
-- * 'lpSharedMemorySize' - The value for the size (in MiB) of the @/dev/shm@ volume. This parameter maps to the @--shm-size@ option to <https://docs.docker.com/engine/reference/run/ docker run> .
linuxParameters ::
  LinuxParameters
linuxParameters =
  LinuxParameters'
    { _lpTmpfs = Nothing,
      _lpMaxSwap = Nothing,
      _lpDevices = Nothing,
      _lpSwappiness = Nothing,
      _lpInitProcessEnabled = Nothing,
      _lpSharedMemorySize = Nothing
    }

-- | The container path, mount options, and size (in MiB) of the tmpfs mount. This parameter maps to the @--tmpfs@ option to <https://docs.docker.com/engine/reference/run/ docker run> .
lpTmpfs :: Lens' LinuxParameters [Tmpfs]
lpTmpfs = lens _lpTmpfs (\s a -> s {_lpTmpfs = a}) . _Default . _Coerce

-- | The total amount of swap memory (in MiB) a container can use. This parameter is translated to the @--memory-swap@ option to <https://docs.docker.com/engine/reference/run/ docker run> where the value is the sum of the container memory plus the @maxSwap@ value. For more information, see <https://docs.docker.com/config/containers/resource_constraints/#--memory-swap-details @--memory-swap@ details> in the Docker documentation. If a @maxSwap@ value of @0@ is specified, the container doesn't use swap. Accepted values are @0@ or any positive integer. If the @maxSwap@ parameter is omitted, the container doesn't use the swap configuration for the container instance it is running on. A @maxSwap@ value must be set for the @swappiness@ parameter to be used.
lpMaxSwap :: Lens' LinuxParameters (Maybe Int)
lpMaxSwap = lens _lpMaxSwap (\s a -> s {_lpMaxSwap = a})

-- | Any host devices to expose to the container. This parameter maps to @Devices@ in the <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container> section of the <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the @--device@ option to <https://docs.docker.com/engine/reference/run/ docker run> .
lpDevices :: Lens' LinuxParameters [Device]
lpDevices = lens _lpDevices (\s a -> s {_lpDevices = a}) . _Default . _Coerce

-- | This allows you to tune a container's memory swappiness behavior. A @swappiness@ value of @0@ causes swapping not to happen unless absolutely necessary. A @swappiness@ value of @100@ causes pages to be swapped very aggressively. Accepted values are whole numbers between @0@ and @100@ . If the @swappiness@ parameter isn't specified, a default value of @60@ is used. If a value isn't specified for @maxSwap@ then this parameter is ignored. If @maxSwap@ is set to 0, the container doesn't use swap. This parameter maps to the @--memory-swappiness@ option to <https://docs.docker.com/engine/reference/run/ docker run> . Consider the following when you use a per-container swap configuration.     * Swap space must be enabled and allocated on the container instance for the containers to use.     * The swap space parameters are only supported for job definitions using EC2 resources.     * If the @maxSwap@ and @swappiness@ parameters are omitted from a job definition, each container will have a default @swappiness@ value of 60 and the total swap usage will be limited to two times the memory reservation of the container.
lpSwappiness :: Lens' LinuxParameters (Maybe Int)
lpSwappiness = lens _lpSwappiness (\s a -> s {_lpSwappiness = a})

-- | If true, run an @init@ process inside the container that forwards signals and reaps processes. This parameter maps to the @--init@ option to <https://docs.docker.com/engine/reference/run/ docker run> . This parameter requires version 1.25 of the Docker Remote API or greater on your container instance. To check the Docker Remote API version on your container instance, log into your container instance and run the following command: @sudo docker version | grep "Server API version"@
lpInitProcessEnabled :: Lens' LinuxParameters (Maybe Bool)
lpInitProcessEnabled = lens _lpInitProcessEnabled (\s a -> s {_lpInitProcessEnabled = a})

-- | The value for the size (in MiB) of the @/dev/shm@ volume. This parameter maps to the @--shm-size@ option to <https://docs.docker.com/engine/reference/run/ docker run> .
lpSharedMemorySize :: Lens' LinuxParameters (Maybe Int)
lpSharedMemorySize = lens _lpSharedMemorySize (\s a -> s {_lpSharedMemorySize = a})

instance FromJSON LinuxParameters where
  parseJSON =
    withObject
      "LinuxParameters"
      ( \x ->
          LinuxParameters'
            <$> (x .:? "tmpfs" .!= mempty)
            <*> (x .:? "maxSwap")
            <*> (x .:? "devices" .!= mempty)
            <*> (x .:? "swappiness")
            <*> (x .:? "initProcessEnabled")
            <*> (x .:? "sharedMemorySize")
      )

instance Hashable LinuxParameters

instance NFData LinuxParameters

instance ToJSON LinuxParameters where
  toJSON LinuxParameters' {..} =
    object
      ( catMaybes
          [ ("tmpfs" .=) <$> _lpTmpfs,
            ("maxSwap" .=) <$> _lpMaxSwap,
            ("devices" .=) <$> _lpDevices,
            ("swappiness" .=) <$> _lpSwappiness,
            ("initProcessEnabled" .=) <$> _lpInitProcessEnabled,
            ("sharedMemorySize" .=) <$> _lpSharedMemorySize
          ]
      )
