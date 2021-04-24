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
-- Module      : Network.AWS.IoT.CreateThingType
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates a new thing type.
module Network.AWS.IoT.CreateThingType
  ( -- * Creating a Request
    createThingType,
    CreateThingType,

    -- * Request Lenses
    cttThingTypeProperties,
    cttTags,
    cttThingTypeName,

    -- * Destructuring the Response
    createThingTypeResponse,
    CreateThingTypeResponse,

    -- * Response Lenses
    cttrrsThingTypeId,
    cttrrsThingTypeARN,
    cttrrsThingTypeName,
    cttrrsResponseStatus,
  )
where

import Network.AWS.IoT.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | The input for the CreateThingType operation.
--
--
--
-- /See:/ 'createThingType' smart constructor.
data CreateThingType = CreateThingType'
  { _cttThingTypeProperties ::
      !(Maybe ThingTypeProperties),
    _cttTags :: !(Maybe [Tag]),
    _cttThingTypeName :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'CreateThingType' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cttThingTypeProperties' - The ThingTypeProperties for the thing type to create. It contains information about the new thing type including a description, and a list of searchable thing attribute names.
--
-- * 'cttTags' - Metadata which can be used to manage the thing type.
--
-- * 'cttThingTypeName' - The name of the thing type.
createThingType ::
  -- | 'cttThingTypeName'
  Text ->
  CreateThingType
createThingType pThingTypeName_ =
  CreateThingType'
    { _cttThingTypeProperties = Nothing,
      _cttTags = Nothing,
      _cttThingTypeName = pThingTypeName_
    }

-- | The ThingTypeProperties for the thing type to create. It contains information about the new thing type including a description, and a list of searchable thing attribute names.
cttThingTypeProperties :: Lens' CreateThingType (Maybe ThingTypeProperties)
cttThingTypeProperties = lens _cttThingTypeProperties (\s a -> s {_cttThingTypeProperties = a})

-- | Metadata which can be used to manage the thing type.
cttTags :: Lens' CreateThingType [Tag]
cttTags = lens _cttTags (\s a -> s {_cttTags = a}) . _Default . _Coerce

-- | The name of the thing type.
cttThingTypeName :: Lens' CreateThingType Text
cttThingTypeName = lens _cttThingTypeName (\s a -> s {_cttThingTypeName = a})

instance AWSRequest CreateThingType where
  type Rs CreateThingType = CreateThingTypeResponse
  request = postJSON ioT
  response =
    receiveJSON
      ( \s h x ->
          CreateThingTypeResponse'
            <$> (x .?> "thingTypeId")
            <*> (x .?> "thingTypeArn")
            <*> (x .?> "thingTypeName")
            <*> (pure (fromEnum s))
      )

instance Hashable CreateThingType

instance NFData CreateThingType

instance ToHeaders CreateThingType where
  toHeaders = const mempty

instance ToJSON CreateThingType where
  toJSON CreateThingType' {..} =
    object
      ( catMaybes
          [ ("thingTypeProperties" .=)
              <$> _cttThingTypeProperties,
            ("tags" .=) <$> _cttTags
          ]
      )

instance ToPath CreateThingType where
  toPath CreateThingType' {..} =
    mconcat ["/thing-types/", toBS _cttThingTypeName]

instance ToQuery CreateThingType where
  toQuery = const mempty

-- | The output of the CreateThingType operation.
--
--
--
-- /See:/ 'createThingTypeResponse' smart constructor.
data CreateThingTypeResponse = CreateThingTypeResponse'
  { _cttrrsThingTypeId ::
      !(Maybe Text),
    _cttrrsThingTypeARN ::
      !(Maybe Text),
    _cttrrsThingTypeName ::
      !(Maybe Text),
    _cttrrsResponseStatus ::
      !Int
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'CreateThingTypeResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cttrrsThingTypeId' - The thing type ID.
--
-- * 'cttrrsThingTypeARN' - The Amazon Resource Name (ARN) of the thing type.
--
-- * 'cttrrsThingTypeName' - The name of the thing type.
--
-- * 'cttrrsResponseStatus' - -- | The response status code.
createThingTypeResponse ::
  -- | 'cttrrsResponseStatus'
  Int ->
  CreateThingTypeResponse
createThingTypeResponse pResponseStatus_ =
  CreateThingTypeResponse'
    { _cttrrsThingTypeId =
        Nothing,
      _cttrrsThingTypeARN = Nothing,
      _cttrrsThingTypeName = Nothing,
      _cttrrsResponseStatus = pResponseStatus_
    }

-- | The thing type ID.
cttrrsThingTypeId :: Lens' CreateThingTypeResponse (Maybe Text)
cttrrsThingTypeId = lens _cttrrsThingTypeId (\s a -> s {_cttrrsThingTypeId = a})

-- | The Amazon Resource Name (ARN) of the thing type.
cttrrsThingTypeARN :: Lens' CreateThingTypeResponse (Maybe Text)
cttrrsThingTypeARN = lens _cttrrsThingTypeARN (\s a -> s {_cttrrsThingTypeARN = a})

-- | The name of the thing type.
cttrrsThingTypeName :: Lens' CreateThingTypeResponse (Maybe Text)
cttrrsThingTypeName = lens _cttrrsThingTypeName (\s a -> s {_cttrrsThingTypeName = a})

-- | -- | The response status code.
cttrrsResponseStatus :: Lens' CreateThingTypeResponse Int
cttrrsResponseStatus = lens _cttrrsResponseStatus (\s a -> s {_cttrrsResponseStatus = a})

instance NFData CreateThingTypeResponse
