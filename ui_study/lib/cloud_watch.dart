import 'package:aws_cloudwatch/aws_cloudwatch.dart';

/// QUICK START LOGGING FILE
///
/// PLEASE FILL OUT THE FOLLOWING VARIABLES:

const String _awsAccessKeyId = 'YOUR_ACCESS_KEY';
const String _awsSecretAccessKey = 'YOUR_SECRET_ACCESS_KEY';
const String _region = 'YOUR_REGION_CODE'; // (us-west-1, us-east-2, etc)
const String _logGroup = 'DESIRED_LOG_GROUP_NAME';
const String _errorGroup = 'DESIRED_ERROR_LOG_GROUP_NAME';

/// END OF VARIABLES

CloudWatchHandler logging = CloudWatchHandler(
  awsAccessKey: _awsAccessKeyId,
  awsSecretKey: _awsSecretAccessKey,
  region: _region,
  delay: const Duration(milliseconds: 200),
);

String logStreamName = '';

// You may want to edit this function to suit your needs
String _getLogStreamName() {
  if (logStreamName.isEmpty) {
    logStreamName = 'WRITE_STREAM_NAME';
  }
  return logStreamName;
}

void log(String logString, {bool isError = false}) {
  logging.log(
    message: logString,
    logGroupName: isError ? _errorGroup : _logGroup,
    logStreamName: _getLogStreamName(),
  );
}
