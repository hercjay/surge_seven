class ErrorKeys {
  static const String NO_INTERNET = 'no_internet';
  static const String REFUSED = 'Connection refused';
  static const String USER_NOT_FOUND = "User not found in the database!";
  static const String TIMEOUT = "Timeout Error";
  static const String SERVER_ERROR = "Server Error";

  static const String SQL_SYNTAX_ERROR = "SQL syntax error";
  static const String CONNECTION_ERROR = "Database connection error";
  static const String DUPLICATE_ENTRY = "Duplicate entry error";
  static const String UNKNOWN_ERROR = "Unknown error";
  static const String FIREBASE_LOGIN_FAILED = "Firebase login failed";
  static const String CLOSED_BEFORE_FULL_HEADER =
      "Connection closed before full header was received";

  static const UNEXPECTED_CHAR = "Unexpected character";
  static const USER_NOT_IN_LOCAL_DB = "User not found in local database";
  static const MYSQL_CONNECTION_FAILED = "MySQL connection failed";
  static const MYSQL_RESULT_IS_NULL = "results is null";
  static const MYSQL_CONNECTION_TIMED_OUT = "Connection timed out";
  static const REMOTE_DB_DETAILS_MISSING = "Remote database details missing";
  static const ERROR_OPENING_REMOTE_DB =
      "Error opening connection to the remote database. Try again later.";
  static const FAILED_TO_GET_MYSQL_DATA =
      "failed to get mysql data from firestore";
  static const REMOTE_DB_OBJ_NULL = "Remote database object is null";
  static const REMOTE_DB_LATE_INITIALIZATION =
      "LateInitializationError: Field 'remoteDb' has not been initialized.";
}
