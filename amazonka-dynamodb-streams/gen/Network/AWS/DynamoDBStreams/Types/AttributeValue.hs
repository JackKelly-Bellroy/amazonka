{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.DynamoDBStreams.Types.AttributeValue
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.DynamoDBStreams.Types.AttributeValue where

import Network.AWS.Lens
import Network.AWS.Prelude

-- | Represents the data for an attribute.
--
--
-- Each attribute value is described as a name-value pair. The name is the data type, and the value is the data itself.
--
-- For more information, see <https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes Data Types> in the /Amazon DynamoDB Developer Guide/ .
--
--
-- /See:/ 'attributeValue' smart constructor.
data AttributeValue = AttributeValue'
  { _avBS ::
      !(Maybe [Base64]),
    _avBOOL :: !(Maybe Bool),
    _avN :: !(Maybe Text),
    _avS :: !(Maybe Text),
    _avNULL :: !(Maybe Bool),
    _avM ::
      !(Maybe (Map Text AttributeValue)),
    _avB :: !(Maybe Base64),
    _avL :: !(Maybe [AttributeValue]),
    _avSS :: !(Maybe [Text]),
    _avNS :: !(Maybe [Text])
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'AttributeValue' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'avBS' - An attribute of type Binary Set. For example: @"BS": ["U3Vubnk=", "UmFpbnk=", "U25vd3k="]@
--
-- * 'avBOOL' - An attribute of type Boolean. For example: @"BOOL": true@
--
-- * 'avN' - An attribute of type Number. For example: @"N": "123.45"@  Numbers are sent across the network to DynamoDB as strings, to maximize compatibility across languages and libraries. However, DynamoDB treats them as number type attributes for mathematical operations.
--
-- * 'avS' - An attribute of type String. For example: @"S": "Hello"@
--
-- * 'avNULL' - An attribute of type Null. For example: @"NULL": true@
--
-- * 'avM' - An attribute of type Map. For example: @"M": {"Name": {"S": "Joe"}, "Age": {"N": "35"}}@
--
-- * 'avB' - An attribute of type Binary. For example: @"B": "dGhpcyB0ZXh0IGlzIGJhc2U2NC1lbmNvZGVk"@ -- /Note:/ This 'Lens' automatically encodes and decodes Base64 data. The underlying isomorphism will encode to Base64 representation during serialisation, and decode from Base64 representation during deserialisation. This 'Lens' accepts and returns only raw unencoded data.
--
-- * 'avL' - An attribute of type List. For example: @"L": [ {"S": "Cookies"} , {"S": "Coffee"}, {"N", "3.14159"}]@
--
-- * 'avSS' - An attribute of type String Set. For example: @"SS": ["Giraffe", "Hippo" ,"Zebra"]@
--
-- * 'avNS' - An attribute of type Number Set. For example: @"NS": ["42.2", "-19", "7.5", "3.14"]@  Numbers are sent across the network to DynamoDB as strings, to maximize compatibility across languages and libraries. However, DynamoDB treats them as number type attributes for mathematical operations.
attributeValue ::
  AttributeValue
attributeValue =
  AttributeValue'
    { _avBS = Nothing,
      _avBOOL = Nothing,
      _avN = Nothing,
      _avS = Nothing,
      _avNULL = Nothing,
      _avM = Nothing,
      _avB = Nothing,
      _avL = Nothing,
      _avSS = Nothing,
      _avNS = Nothing
    }

-- | An attribute of type Binary Set. For example: @"BS": ["U3Vubnk=", "UmFpbnk=", "U25vd3k="]@
avBS :: Lens' AttributeValue [ByteString]
avBS = lens _avBS (\s a -> s {_avBS = a}) . _Default . _Coerce

-- | An attribute of type Boolean. For example: @"BOOL": true@
avBOOL :: Lens' AttributeValue (Maybe Bool)
avBOOL = lens _avBOOL (\s a -> s {_avBOOL = a})

-- | An attribute of type Number. For example: @"N": "123.45"@  Numbers are sent across the network to DynamoDB as strings, to maximize compatibility across languages and libraries. However, DynamoDB treats them as number type attributes for mathematical operations.
avN :: Lens' AttributeValue (Maybe Text)
avN = lens _avN (\s a -> s {_avN = a})

-- | An attribute of type String. For example: @"S": "Hello"@
avS :: Lens' AttributeValue (Maybe Text)
avS = lens _avS (\s a -> s {_avS = a})

-- | An attribute of type Null. For example: @"NULL": true@
avNULL :: Lens' AttributeValue (Maybe Bool)
avNULL = lens _avNULL (\s a -> s {_avNULL = a})

-- | An attribute of type Map. For example: @"M": {"Name": {"S": "Joe"}, "Age": {"N": "35"}}@
avM :: Lens' AttributeValue (HashMap Text AttributeValue)
avM = lens _avM (\s a -> s {_avM = a}) . _Default . _Map

-- | An attribute of type Binary. For example: @"B": "dGhpcyB0ZXh0IGlzIGJhc2U2NC1lbmNvZGVk"@ -- /Note:/ This 'Lens' automatically encodes and decodes Base64 data. The underlying isomorphism will encode to Base64 representation during serialisation, and decode from Base64 representation during deserialisation. This 'Lens' accepts and returns only raw unencoded data.
avB :: Lens' AttributeValue (Maybe ByteString)
avB = lens _avB (\s a -> s {_avB = a}) . mapping _Base64

-- | An attribute of type List. For example: @"L": [ {"S": "Cookies"} , {"S": "Coffee"}, {"N", "3.14159"}]@
avL :: Lens' AttributeValue [AttributeValue]
avL = lens _avL (\s a -> s {_avL = a}) . _Default . _Coerce

-- | An attribute of type String Set. For example: @"SS": ["Giraffe", "Hippo" ,"Zebra"]@
avSS :: Lens' AttributeValue [Text]
avSS = lens _avSS (\s a -> s {_avSS = a}) . _Default . _Coerce

-- | An attribute of type Number Set. For example: @"NS": ["42.2", "-19", "7.5", "3.14"]@  Numbers are sent across the network to DynamoDB as strings, to maximize compatibility across languages and libraries. However, DynamoDB treats them as number type attributes for mathematical operations.
avNS :: Lens' AttributeValue [Text]
avNS = lens _avNS (\s a -> s {_avNS = a}) . _Default . _Coerce

instance FromJSON AttributeValue where
  parseJSON =
    withObject
      "AttributeValue"
      ( \x ->
          AttributeValue'
            <$> (x .:? "BS" .!= mempty)
            <*> (x .:? "BOOL")
            <*> (x .:? "N")
            <*> (x .:? "S")
            <*> (x .:? "NULL")
            <*> (x .:? "M" .!= mempty)
            <*> (x .:? "B")
            <*> (x .:? "L" .!= mempty)
            <*> (x .:? "SS" .!= mempty)
            <*> (x .:? "NS" .!= mempty)
      )

instance Hashable AttributeValue

instance NFData AttributeValue
