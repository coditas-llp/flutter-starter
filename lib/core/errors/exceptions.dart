class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class LocalDbException extends AppException {
  LocalDbException([String? message])
      : super(message, "Local Database Error: ");
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, "Server Error: ");
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class CustomException extends AppException {
  CustomException([String? message]) : super(message, "");
}

