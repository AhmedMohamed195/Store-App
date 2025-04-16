// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

   final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {
    emit(LoginLoading());

    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (_auth.currentUser!.emailVerified) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure("Please verify your email before logging in."));
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = "An unexpected error occurred.";

      if (e.code == 'user-not-found') {
        errorMessage = "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Wrong password provided for that user.";
      } else if (e.code == 'invalid-credential') {
        errorMessage = "Invalid email or password.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "Invalid email format.";
      } else if (e.code == 'user-disabled') {
        errorMessage = "This account has been disabled.";
      } else if (e.code == 'too-many-requests') {
        errorMessage = "Too many attempts. Try again later.";
      }

      emit(LoginFailure(errorMessage));
    } catch (e) {
      emit(LoginFailure("Unexpected error: ${e.toString()}"));
    }
  }

  Future<void> forgetPassword(String email) async {
    emit(LoginLoading());

    try {
      await _auth.sendPasswordResetEmail(email: email);
      emit(ForgetPasswordSuccess());
    } on FirebaseAuthException catch (e) {
      String errorMessage = "An error occurred.";

      if (e.code == 'invalid-email') {
        errorMessage = "Invalid email format.";
      } else if (e.code == 'user-not-found') {
        errorMessage = "No user found for that email.";
      }

      emit(LoginFailure(errorMessage));
    } catch (e) {
      emit(LoginFailure("Unexpected error: ${e.toString()}"));
    }
  }
  }

