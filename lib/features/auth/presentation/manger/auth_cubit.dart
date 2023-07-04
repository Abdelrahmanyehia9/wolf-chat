import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/auth/presentation/manger/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());

  Future<void> loginByEmailAndPassword(
      {required String email, required String password}) async {
    emit(AuthLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(AuthSuccess(user));
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code.contains("user-not-found")) {
          emit(AuthFailure(" user not found "));
        } else if (e.code.contains("wrong-pass")) {
          emit(AuthFailure("You Have Entered Wrong Password "));
        } else if (e.code.contains("invalid-email")) {
          emit(AuthFailure("email Not valid"));
        } else if (e.code.contains("user-disabled")) {
          emit(AuthFailure("this Account  have  been Blocked"));
        } else {
          emit(AuthFailure("some thing went wrong try again later"));
        }
      } else {
        emit(AuthFailure(e.toString()));
      }
    }
  }

  Future<void> signUpUsingEmailAndPassword(
      {required String email, required String password}) async {
    emit(AuthLoading());

    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      emit(AuthSuccess(user));
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code.contains("email-already-in-use:")) {
          emit(AuthFailure("email already in use:"));
        } else if (e.code.contains("invalid-email")) {
          emit(AuthFailure("email not valid"));
        } else if (e.code.contains("operation-not-allowed")) {
          emit(AuthFailure("email not enabled please talk to support agent "));
        } else if (e.code.contains("weak-password")) {
          emit(AuthFailure("weak password , easy to guess"));
        } else {
          emit(AuthFailure(e.code.toString()));
        }
      } else {
        emit(AuthFailure(e.toString()));
      }
    }
  }
}