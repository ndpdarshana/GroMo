import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/models/app_error.dart';
import '/models/app_user.dart';

class AuthRepositoryResult extends Equatable {
  final AppUser? user;
  final AppError? error;

  const AuthRepositoryResult({this.user, this.error});

  @override
  List<Object?> get props => [user, error];
}

class AuthRepository {
  static final AuthRepository _instance = AuthRepository._internal();
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  factory AuthRepository() {
    return _instance;
  }

  AuthRepository._internal();

  Future<AuthRepositoryResult> createUser() async {
    const String email = 'ndp.mymail@gmail.com';
    const String password = 'Abc@1234';

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return AuthRepositoryResult(user: AppUser(username: userCredential.user!.email, id: userCredential.user!.uid));
    } catch (_) {
      return const AuthRepositoryResult(error: AppError(code: '400', message: 'Auth error occuerd'));
    }
  }

  Future<AuthRepositoryResult> retriveUser() async {
    try {
      final User? user = _firebaseAuth.currentUser;
      if (user != null) {
        final idTokenResult = await user.getIdTokenResult();

        return AuthRepositoryResult(
            user: AppUser(id: idTokenResult.claims!['uid'], username: idTokenResult.claims!['username']));
      }

      return Future.value(const AuthRepositoryResult(error: AppError(code: '403', message: 'No user logged in')));
    } catch (e) {
      return Future.value(const AuthRepositoryResult(error: AppError(code: '500', message: 'Unexpected error')));
    }
  }

  Future<AuthRepositoryResult> signin({required String username, required String password}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(email: username, password: password);
      return AuthRepositoryResult(user: AppUser(username: userCredential.user!.email, id: userCredential.user!.uid));
    } on FirebaseAuthException catch (e) {
      return AuthRepositoryResult(error: AppError(code: '1001', message: e.code));
    }
  }

  Future<AuthRepositoryResult> signout() async {
    try {
      await _firebaseAuth.signOut();
      return const AuthRepositoryResult();
    } on FirebaseAuthException catch (e) {
      return AuthRepositoryResult(error: AppError(code: '1001', message: e.code));
    }
  }
}
