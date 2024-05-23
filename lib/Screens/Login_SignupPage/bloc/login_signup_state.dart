part of 'login_signup_bloc.dart';

sealed class LoginSignupState extends Equatable {
  const LoginSignupState();

  @override
  List<Object> get props => [];
}

final class BuildState extends LoginSignupState {}

final class ListenState extends LoginSignupState {}

final class LoginSignupInitial extends BuildState {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginSignupInitial(
      {required this.emailController, required this.passwordController});
  @override
  List<Object> get props => [emailController, passwordController];
}

final class LoginSignupSignupSuccess extends ListenState {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String message;
  LoginSignupSignupSuccess(
      {required this.emailController,
      required this.passwordController,
      required this.message});
  @override
  List<Object> get props => [emailController, passwordController];
}

final class LoginSignupSignupFailure extends ListenState {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String message;
  LoginSignupSignupFailure(
      {required this.emailController,
      required this.passwordController,
      required this.message});
  @override
  List<Object> get props => [emailController, passwordController];
}

final class LoginSignupLoginInitial extends BuildState {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginSignupLoginInitial(
      {required this.emailController, required this.passwordController});
  @override
  List<Object> get props => [emailController, passwordController];
}

final class LoginSignupLoginSuccess extends ListenState {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String message;
  LoginSignupLoginSuccess(
      {required this.emailController,
      required this.passwordController,
      required this.message});
  @override
  List<Object> get props => [emailController, passwordController];
}

final class LoginSignupLoginFailure extends ListenState {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String message;
  LoginSignupLoginFailure(
      {required this.emailController,
      required this.passwordController,
      required this.message});
  @override
  List<Object> get props => [emailController, passwordController];
}
