import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:growMo/models/app_error.dart';
import 'package:growMo/models/app_user.dart';

class AuthRepositoryResult extends Equatable {
  final AppUser user;
  final AppError error;

  const AuthRepositoryResult({this.user, this.error});

  @override
  List<Object> get props => [user, error];
}

class AuthRepository {
  static AuthRepository _instance = AuthRepository._internal();
  static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  factory AuthRepository() {
    return _instance;
  }

  AuthRepository._internal();

  Future<AuthRepositoryResult> createUser() async {
    const String email = "ndp.mymail@gmail.com";
    const String password = "Abc@1234";

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return AuthRepositoryResult(user: AppUser(username: userCredential.user.email, id: userCredential.user.uid));
    } on FirebaseAuthException catch (e) {
      print('AuthRepository->createUser ${e.code}');
    } catch (e) {
      print("AuthRepository->createUser $e");
    }

    return AuthRepositoryResult();
  }

  Future<AuthRepositoryResult> retriveUser() async {
    try {
      if (_firebaseAuth.currentUser != null) {}
    } catch (e) {}
  }

  Future<AuthRepositoryResult> signin({@required String username, @required String password}) async {
    assert(username != null);
    assert(password != null);
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(email: username, password: password);
      return AuthRepositoryResult(user: AppUser(username: userCredential.user.email, id: userCredential.user.uid));
    } on FirebaseAuthException catch (e) {
      print('AuthRepository->signin: ${e.code}');
      return AuthRepositoryResult(error: AppError(code: '1001', message: e.code));
    }
  }

  Future<AuthRepositoryResult> signout() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      print('AuthRepository->signout: ${e.code}');
      return AuthRepositoryResult(error: AppError(code: '1001', message: e.code));
    }
  }
}
