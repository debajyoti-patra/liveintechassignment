import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'login_signup_event.dart';
part 'login_signup_state.dart';

class LoginSignupBloc extends Bloc<LoginSignupEvent, LoginSignupState> {
  LoginSignupBloc()
      : super(LoginSignupInitial(
            emailController: TextEditingController(),
            passwordController: TextEditingController())) {
    on<SignupEvent>((event, emit) async {
      // TODO: implement event handler
      final FirebaseAuth _auth = FirebaseAuth.instance;

      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: event.emailController.text,
          password: event.passwordController.text,
        );
        print('User registered: ${userCredential.user!.uid}');
        emit(LoginSignupSignupSuccess(
            emailController: event.emailController,
            passwordController: event.passwordController,
            message: 'SignUp is Successful'));
      } on FirebaseAuthException catch (e) {
        print('Error registering user: $e');
        print(e);
        emit(LoginSignupSignupFailure(
            emailController: event.emailController,
            passwordController: event.passwordController,
            message: 'Please Check Your Email and Password and try again'));
        emit(LoginSignupInitial(
            emailController: event.emailController,
            passwordController: event.passwordController));
      }
    });

    on<LoginEvent>((event, emit) async {
      // TODO: implement event handler
      try {
        final FirebaseAuth _auth = FirebaseAuth.instance;
        final UserCredential userCredential =
            await _auth.signInWithEmailAndPassword(
          email: event.emailController.text.trim(),
          password: event.passwordController.text.trim(),
        );
        final User? user = userCredential.user;
        emit(LoginSignupLoginSuccess(
            emailController: TextEditingController(),
            passwordController: TextEditingController(),
            message: ''));
      } on FirebaseAuthException catch (e) {
        print('Failed to sign in with Email & Password: $e');
        emit(LoginSignupLoginFailure(
            emailController: event.emailController,
            passwordController: event.passwordController,
            message: 'Please Check Your Email and Password and try again'));
        emit(LoginSignupLoginInitial(
            emailController: event.emailController,
            passwordController: event.passwordController));
      }
    });

    on<NavigateEvent>((event, emit) {
      // TODO: implement event handler
      if (event.navigateScreen == "SignUp") {
        emit(LoginSignupInitial(
            emailController: event.emailController,
            passwordController: event.passwordController));
      } else {
        emit(LoginSignupLoginInitial(
            emailController: event.emailController,
            passwordController: event.passwordController));
      }
    });
  }
}
