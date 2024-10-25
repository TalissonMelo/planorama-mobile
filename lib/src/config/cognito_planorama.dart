import 'package:amazon_cognito_identity_dart_2/cognito.dart';

const String userPoolId = 'us-east-1_xxxxxx';
const String clientId = '4f5g6h7i8j9k';
const String awsRegion = 'us-east-1';

final userPool = CognitoUserPool(userPoolId, clientId);
