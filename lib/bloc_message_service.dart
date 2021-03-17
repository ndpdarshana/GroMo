import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BlocMessage extends Equatable {
  final Type from;
  final Map<Type, dynamic> to;

  BlocMessage({
    @required this.from,
    @required this.to,
  })  : assert(from != null),
        assert(to != null);

  @override
  List<Object> get props => [from, to];
}

class BlocMessagingService {
  static BlocMessagingService _instance = BlocMessagingService._internal();
  StreamController<BlocMessage> _streamController;

  factory BlocMessagingService() {
    return _instance;
  }

  BlocMessagingService._internal() {
    if (_streamController?.isClosed ?? true) {
      _streamController = StreamController<BlocMessage>.broadcast();
    }
  }

  void publish(BlocMessage message) => _streamController?.sink?.add(message);

  Stream<BlocMessage> subscribe() => _streamController?.stream?.asBroadcastStream();

  void close() => _streamController?.close();
}
