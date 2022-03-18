class ExceptionNetworking implements Exception {
  final String message;

  ExceptionNetworking({
    required this.message,
  });

  @override
  String toString() {
    return message;
  }
}

class FetchDataException extends ExceptionNetworking {
  FetchDataException({
    required String message,
  }) : super(message: message);
}

class MessageException extends ExceptionNetworking {
  MessageException({
    required String message,
  }) : super(message: message);
}

class BadRequestException extends ExceptionNetworking {
  BadRequestException({
    required String message,
  }) : super(message: message);
}


