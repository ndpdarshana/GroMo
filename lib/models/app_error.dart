import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final String code;
  final String message;

  const AppError({required this.code, required this.message});

  @override
  List<Object> get props => [code, message];
}
