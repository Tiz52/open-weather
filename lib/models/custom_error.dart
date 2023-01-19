import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final String errorMessage;
  const CustomError({this.errorMessage = ''});

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'CustomError(errorMessage: $errorMessage)';
  }
}
