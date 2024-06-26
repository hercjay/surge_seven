class AppError {
  final String message;
  final int? errorCode;
  final StackTrace? stackTrace;
  final DateTime? timestamp;
  final String? errorKey;
  final int? statusCode;

  AppError(this.message,
      {this.errorCode, this.stackTrace, 
      this.timestamp, this.errorKey, this.statusCode});
}
