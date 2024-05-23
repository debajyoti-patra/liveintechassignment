import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liveintech_assignment/Screens/Login_SignupPage/Ui/Login_Signup.dart';
import 'package:liveintech_assignment/Screens/Login_SignupPage/bloc/login_signup_bloc.dart';
import 'package:liveintech_assignment/Screens/homePage/cubit/home_cubit.dart';
import 'Screens/homePage/ui/home_page.dart';
import 'Utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(400, 840),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HomeCubit(),
            ),
            BlocProvider(
              create: (context) => LoginSignupBloc(),
            ),
          ],
          child: LogInSignUp(),
        ),
      ),
    );
  }
}
