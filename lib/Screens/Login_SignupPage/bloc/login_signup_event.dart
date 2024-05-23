part of 'login_signup_bloc.dart';

sealed class LoginSignupEvent extends Equatable {
  const LoginSignupEvent();

  @override
  List<Object> get props => [];
}

final class LoginEvent extends LoginSignupEvent {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginEvent({required this.emailController, required this.passwordController});

  @override
  List<Object> get props => [emailController, passwordController];
}

final class SignupEvent extends LoginSignupEvent {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  SignupEvent(
      {required this.emailController, required this.passwordController});

  @override
  List<Object> get props => [emailController, passwordController];
}

final class NavigateEvent extends LoginSignupEvent {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String navigateScreen;
  NavigateEvent(this.navigateScreen,
      {required this.emailController, required this.passwordController});

  @override
  List<Object> get props =>
      [emailController, passwordController, navigateScreen];
}
