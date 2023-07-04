import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class AuthSuccess extends AuthStates {
  final UserCredential user;

  AuthSuccess(this.user);
}

class AuthFailure extends AuthStates {
  final String error;

  AuthFailure(this.error);
}

class AuthLoading extends AuthStates {}
