import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String id;
  final String username;

  const AppUser({this.id, this.username});

  static const empty = AppUser(username: '', id: '');

  @override
  List<Object> get props => [id, username];

  AppUser copyWith({String id, String username}) => AppUser(
        id: id ?? this.id,
        username: username ?? this.username,
      );
}
