import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liveintech_assignment/Screens/Login_SignupPage/bloc/login_signup_bloc.dart';
import 'package:liveintech_assignment/Screens/homePage/cubit/home_cubit.dart';
import 'package:liveintech_assignment/Screens/homePage/ui/home_page.dart';

class LogInSignUp extends StatelessWidget {
  const LogInSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // TextEditingController emailController = TextEditingController();
    // TextEditingController passwordController = TextEditingController();
    final blocProvider = BlocProvider.of<LoginSignupBloc>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Padding(
            padding: EdgeInsets.only(top: size.height * .3),
            child: BlocConsumer<LoginSignupBloc, LoginSignupState>(
              listenWhen: (previous, current) {
                return current is ListenState ? true : false;
              },
              buildWhen: (previous, current) =>
                  current is BuildState ? true : false,
              listener: (context, state) {
                // TODO: implement listener
                if (state is LoginSignupLoginSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${state.message}'),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          // Perform some action if needed
                        },
                      ),
                    ),
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => HomeCubit(),
                          child: HomePage(),
                        ),
                      ));
                } else if (state is LoginSignupLoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${state.message}'),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          // Perform some action if needed
                        },
                      ),
                    ),
                  );
                } else if (state is LoginSignupSignupFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${state.message}'),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          // Perform some action if needed
                        },
                      ),
                    ),
                  );
                } else if (state is LoginSignupSignupSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${state.message}'),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          // Perform some action if needed
                        },
                      ),
                    ),
                  );
                  blocProvider.add(NavigateEvent('LogIn',
                      emailController: state.emailController,
                      passwordController: state.passwordController));
                }
              },
              builder: (context, state) {
                if (state is LoginSignupInitial) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'Agne',
                            ),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                    'Welcome to Movie App...'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      TextFormField(
                        controller: state.emailController,
                        decoration: InputDecoration(
                            hintText: 'Enter your email',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email)),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextFormField(
                        controller: state.passwordController,
                        decoration: InputDecoration(
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.remove_red_eye)),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Already SignUp? ',
                          ),
                          InkWell(
                              onTap: () {
                                blocProvider.add(NavigateEvent('LogIn',
                                    emailController: TextEditingController(),
                                    passwordController:
                                        TextEditingController()));
                              },
                              child: Text('Login',
                                  style: TextStyle(color: Colors.blue)))
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      SizedBox(
                          height: size.height * .06,
                          width: size.width * .3,
                          child: ElevatedButton(
                              style: ButtonStyle(),
                              onPressed: () {
                                blocProvider.add(SignupEvent(
                                    emailController: state.emailController,
                                    passwordController:
                                        state.passwordController));
                              },
                              child: Text('SignUp')))
                    ],
                  );
                } else if (state is LoginSignupLoginInitial) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'Agne',
                            ),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                    'Welcome to Movie App...'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      TextFormField(
                        controller: state.emailController,
                        decoration: InputDecoration(
                            hintText: 'Enter your email',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email)),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextFormField(
                        controller: state.passwordController,
                        decoration: InputDecoration(
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.remove_red_eye)),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Don't have an Account?",
                          ),
                          InkWell(
                              onTap: () {
                                blocProvider.add(NavigateEvent('SignUp',
                                    emailController: TextEditingController(),
                                    passwordController:
                                        TextEditingController()));
                              },
                              child: Text('SignUp',
                                  style: TextStyle(color: Colors.blue)))
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      SizedBox(
                          height: size.height * .06,
                          width: size.width * .3,
                          child: ElevatedButton(
                              style: ButtonStyle(),
                              onPressed: () {
                                blocProvider.add(LoginEvent(
                                    emailController: state.emailController,
                                    passwordController:
                                        state.passwordController));
                              },
                              child: Text('Login')))
                    ],
                  );
                } else
                  return SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
