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
-- Module      : Network.AWS.CloudFormation.GetTemplate
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns the template body for a specified stack. You can get the template for running or deleted stacks.
--
--
-- For deleted stacks, GetTemplate returns the template for up to 90 days after the stack has been deleted.
module Network.AWS.CloudFormation.GetTemplate
  ( -- * Creating a Request
    getTemplate,
    GetTemplate,

    -- * Request Lenses
    gtTemplateStage,
    gtStackName,
    gtChangeSetName,

    -- * Destructuring the Response
    getTemplateResponse,
    GetTemplateResponse,

    -- * Response Lenses
    gtrrsStagesAvailable,
    gtrrsTemplateBody,
    gtrrsResponseStatus,
  )
where

import Network.AWS.CloudFormation.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | The input for a 'GetTemplate' action.
--
--
--
-- /See:/ 'getTemplate' smart constructor.
data GetTemplate = GetTemplate'
  { _gtTemplateStage ::
      !(Maybe TemplateStage),
    _gtStackName :: !(Maybe Text),
    _gtChangeSetName :: !(Maybe Text)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'GetTemplate' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gtTemplateStage' - For templates that include transforms, the stage of the template that AWS CloudFormation returns. To get the user-submitted template, specify @Original@ . To get the template after AWS CloudFormation has processed all transforms, specify @Processed@ .  If the template doesn't include transforms, @Original@ and @Processed@ return the same template. By default, AWS CloudFormation specifies @Original@ .
--
-- * 'gtStackName' - The name or the unique stack ID that is associated with the stack, which are not always interchangeable:     * Running stacks: You can specify either the stack's name or its unique stack ID.     * Deleted stacks: You must specify the unique stack ID. Default: There is no default value.
--
-- * 'gtChangeSetName' - The name or Amazon Resource Name (ARN) of a change set for which AWS CloudFormation returns the associated template. If you specify a name, you must also specify the @StackName@ .
getTemplate ::
  GetTemplate
getTemplate =
  GetTemplate'
    { _gtTemplateStage = Nothing,
      _gtStackName = Nothing,
      _gtChangeSetName = Nothing
    }

-- | For templates that include transforms, the stage of the template that AWS CloudFormation returns. To get the user-submitted template, specify @Original@ . To get the template after AWS CloudFormation has processed all transforms, specify @Processed@ .  If the template doesn't include transforms, @Original@ and @Processed@ return the same template. By default, AWS CloudFormation specifies @Original@ .
gtTemplateStage :: Lens' GetTemplate (Maybe TemplateStage)
gtTemplateStage = lens _gtTemplateStage (\s a -> s {_gtTemplateStage = a})

-- | The name or the unique stack ID that is associated with the stack, which are not always interchangeable:     * Running stacks: You can specify either the stack's name or its unique stack ID.     * Deleted stacks: You must specify the unique stack ID. Default: There is no default value.
gtStackName :: Lens' GetTemplate (Maybe Text)
gtStackName = lens _gtStackName (\s a -> s {_gtStackName = a})

-- | The name or Amazon Resource Name (ARN) of a change set for which AWS CloudFormation returns the associated template. If you specify a name, you must also specify the @StackName@ .
gtChangeSetName :: Lens' GetTemplate (Maybe Text)
gtChangeSetName = lens _gtChangeSetName (\s a -> s {_gtChangeSetName = a})

instance AWSRequest GetTemplate where
  type Rs GetTemplate = GetTemplateResponse
  request = postQuery cloudFormation
  response =
    receiveXMLWrapper
      "GetTemplateResult"
      ( \s h x ->
          GetTemplateResponse'
            <$> ( x .@? "StagesAvailable" .!@ mempty
                    >>= may (parseXMLList "member")
                )
            <*> (x .@? "TemplateBody")
            <*> (pure (fromEnum s))
      )

instance Hashable GetTemplate

instance NFData GetTemplate

instance ToHeaders GetTemplate where
  toHeaders = const mempty

instance ToPath GetTemplate where
  toPath = const "/"

instance ToQuery GetTemplate where
  toQuery GetTemplate' {..} =
    mconcat
      [ "Action" =: ("GetTemplate" :: ByteString),
        "Version" =: ("2010-05-15" :: ByteString),
        "TemplateStage" =: _gtTemplateStage,
        "StackName" =: _gtStackName,
        "ChangeSetName" =: _gtChangeSetName
      ]

-- | The output for 'GetTemplate' action.
--
--
--
-- /See:/ 'getTemplateResponse' smart constructor.
data GetTemplateResponse = GetTemplateResponse'
  { _gtrrsStagesAvailable ::
      !(Maybe [TemplateStage]),
    _gtrrsTemplateBody ::
      !(Maybe Text),
    _gtrrsResponseStatus :: !Int
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'GetTemplateResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gtrrsStagesAvailable' - The stage of the template that you can retrieve. For stacks, the @Original@ and @Processed@ templates are always available. For change sets, the @Original@ template is always available. After AWS CloudFormation finishes creating the change set, the @Processed@ template becomes available.
--
-- * 'gtrrsTemplateBody' - Structure containing the template body. (For more information, go to <https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html Template Anatomy> in the AWS CloudFormation User Guide.) AWS CloudFormation returns the same template that was used when the stack was created.
--
-- * 'gtrrsResponseStatus' - -- | The response status code.
getTemplateResponse ::
  -- | 'gtrrsResponseStatus'
  Int ->
  GetTemplateResponse
getTemplateResponse pResponseStatus_ =
  GetTemplateResponse'
    { _gtrrsStagesAvailable =
        Nothing,
      _gtrrsTemplateBody = Nothing,
      _gtrrsResponseStatus = pResponseStatus_
    }

-- | The stage of the template that you can retrieve. For stacks, the @Original@ and @Processed@ templates are always available. For change sets, the @Original@ template is always available. After AWS CloudFormation finishes creating the change set, the @Processed@ template becomes available.
gtrrsStagesAvailable :: Lens' GetTemplateResponse [TemplateStage]
gtrrsStagesAvailable = lens _gtrrsStagesAvailable (\s a -> s {_gtrrsStagesAvailable = a}) . _Default . _Coerce

-- | Structure containing the template body. (For more information, go to <https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html Template Anatomy> in the AWS CloudFormation User Guide.) AWS CloudFormation returns the same template that was used when the stack was created.
gtrrsTemplateBody :: Lens' GetTemplateResponse (Maybe Text)
gtrrsTemplateBody = lens _gtrrsTemplateBody (\s a -> s {_gtrrsTemplateBody = a})

-- | -- | The response status code.
gtrrsResponseStatus :: Lens' GetTemplateResponse Int
gtrrsResponseStatus = lens _gtrrsResponseStatus (\s a -> s {_gtrrsResponseStatus = a})

instance NFData GetTemplateResponse
