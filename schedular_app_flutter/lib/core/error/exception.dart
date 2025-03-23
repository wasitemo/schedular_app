class StatusCodeException implements Exception {
  final String message;

  const StatusCodeException({required this.message});
}

class GeneralException implements Exception {
  final String message;

  const GeneralException({required this.message});
}
