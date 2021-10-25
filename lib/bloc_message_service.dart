import 'dart:async';

import 'package:equatable/equatable.dart';

class BlocMessage extends Equatable {
  final Type from;
  final Map<Type, dynamic> to;

  const BlocMessage({
    required this.from,
    required this.to,
  });

  @override
  List<Object> get props => [from, to];
}

class BlocMessagingService {
  static final BlocMessagingService _instance = BlocMessagingService._internal();
  StreamController<BlocMessage>? _streamController;

  factory BlocMessagingService() {
    return _instance;
  }

  BlocMessagingService._internal() {
    if (_streamController?.isClosed ?? true) {
      _streamController = StreamController<BlocMessage>.broadcast();
    }
  }

  void publish(BlocMessage message) => _streamController?.sink.add(message);

  Stream<BlocMessage>? subscribe() => _streamController?.stream.asBroadcastStream();

  void close() => _streamController?.close();
}
