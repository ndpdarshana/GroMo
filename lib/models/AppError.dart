import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppError extends Equatable {
  final String code;
  final String message;

  const AppError({@required this.code, @required this.message})
      : assert(code != null),
        assert(message != null);

  @override
  List<Object> get props => [code, message];
}
