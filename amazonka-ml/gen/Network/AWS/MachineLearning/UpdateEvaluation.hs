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
-- Module      : Network.AWS.MachineLearning.UpdateEvaluation
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Updates the @EvaluationName@ of an @Evaluation@ .
--
--
-- You can use the @GetEvaluation@ operation to view the contents of the updated data element.
module Network.AWS.MachineLearning.UpdateEvaluation
  ( -- * Creating a Request
    updateEvaluation,
    UpdateEvaluation,

    -- * Request Lenses
    ueEvaluationId,
    ueEvaluationName,

    -- * Destructuring the Response
    updateEvaluationResponse,
    UpdateEvaluationResponse,

    -- * Response Lenses
    uerrsEvaluationId,
    uerrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.MachineLearning.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'updateEvaluation' smart constructor.
data UpdateEvaluation = UpdateEvaluation'
  { _ueEvaluationId ::
      !Text,
    _ueEvaluationName :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'UpdateEvaluation' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ueEvaluationId' - The ID assigned to the @Evaluation@ during creation.
--
-- * 'ueEvaluationName' - A new user-supplied name or description of the @Evaluation@ that will replace the current content.
updateEvaluation ::
  -- | 'ueEvaluationId'
  Text ->
  -- | 'ueEvaluationName'
  Text ->
  UpdateEvaluation
updateEvaluation pEvaluationId_ pEvaluationName_ =
  UpdateEvaluation'
    { _ueEvaluationId = pEvaluationId_,
      _ueEvaluationName = pEvaluationName_
    }

-- | The ID assigned to the @Evaluation@ during creation.
ueEvaluationId :: Lens' UpdateEvaluation Text
ueEvaluationId = lens _ueEvaluationId (\s a -> s {_ueEvaluationId = a})

-- | A new user-supplied name or description of the @Evaluation@ that will replace the current content.
ueEvaluationName :: Lens' UpdateEvaluation Text
ueEvaluationName = lens _ueEvaluationName (\s a -> s {_ueEvaluationName = a})

instance AWSRequest UpdateEvaluation where
  type Rs UpdateEvaluation = UpdateEvaluationResponse
  request = postJSON machineLearning
  response =
    receiveJSON
      ( \s h x ->
          UpdateEvaluationResponse'
            <$> (x .?> "EvaluationId") <*> (pure (fromEnum s))
      )

instance Hashable UpdateEvaluation

instance NFData UpdateEvaluation

instance ToHeaders UpdateEvaluation where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ("AmazonML_20141212.UpdateEvaluation" :: ByteString),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON UpdateEvaluation where
  toJSON UpdateEvaluation' {..} =
    object
      ( catMaybes
          [ Just ("EvaluationId" .= _ueEvaluationId),
            Just ("EvaluationName" .= _ueEvaluationName)
          ]
      )

instance ToPath UpdateEvaluation where
  toPath = const "/"

instance ToQuery UpdateEvaluation where
  toQuery = const mempty

-- | Represents the output of an @UpdateEvaluation@ operation.
--
--
-- You can see the updated content by using the @GetEvaluation@ operation.
--
--
-- /See:/ 'updateEvaluationResponse' smart constructor.
data UpdateEvaluationResponse = UpdateEvaluationResponse'
  { _uerrsEvaluationId ::
      !(Maybe Text),
    _uerrsResponseStatus ::
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

-- | Creates a value of 'UpdateEvaluationResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'uerrsEvaluationId' - The ID assigned to the @Evaluation@ during creation. This value should be identical to the value of the @Evaluation@ in the request.
--
-- * 'uerrsResponseStatus' - -- | The response status code.
updateEvaluationResponse ::
  -- | 'uerrsResponseStatus'
  Int ->
  UpdateEvaluationResponse
updateEvaluationResponse pResponseStatus_ =
  UpdateEvaluationResponse'
    { _uerrsEvaluationId =
        Nothing,
      _uerrsResponseStatus = pResponseStatus_
    }

-- | The ID assigned to the @Evaluation@ during creation. This value should be identical to the value of the @Evaluation@ in the request.
uerrsEvaluationId :: Lens' UpdateEvaluationResponse (Maybe Text)
uerrsEvaluationId = lens _uerrsEvaluationId (\s a -> s {_uerrsEvaluationId = a})

-- | -- | The response status code.
uerrsResponseStatus :: Lens' UpdateEvaluationResponse Int
uerrsResponseStatus = lens _uerrsResponseStatus (\s a -> s {_uerrsResponseStatus = a})

instance NFData UpdateEvaluationResponse
