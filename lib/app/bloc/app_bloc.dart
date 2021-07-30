import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/auth/bloc/auth_bloc.dart';
import '/bloc_message_service.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent?, AppState> {
  late StreamSubscription<BlocMessage> _streamSubscription;

  AppBloc() : super(AppState()) {
    _streamSubscription = BlocMessagingService().subscribe()!.listen((message) {
      if (message.from == AuthBloc && message.to.keys.contains(AppBloc)) {
        add(message.to[AppBloc]);
      }
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    BlocMessagingService().close();
    return super.close();
  }

  @override
  Stream<AppState> mapEventToState(
    AppEvent? event,
  ) async* {
    if (event is AppLoaded) {
      yield _mapAppLoaded(event, state);
    }
  }

  AppState _mapAppLoaded(AppLoaded event, AppState state) {
    return state.copyWith(status: AppStatus.done);
  }
}
