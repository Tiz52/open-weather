class WeatherException implements Exception {
  String message;
  WeatherException([this.message = 'Something went wrong']) {
    message = 'WeatherException: $message';
  }

  @override
  String toString() => message;
}
