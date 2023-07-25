import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/cubit/auth_cubit.dart';
import 'package:login/cubit/page_cubit.dart';
import 'package:login/ui/pages/main_pages.dart';
import 'package:login/ui/pages/sign_in.dart';
import 'package:login/ui/pages/sign_up.dart';
import 'package:login/ui/pages/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/sign-up': (context) => SignUpPages(),
          '/sign-in': (context) => SignInPages(),
          '/main': (context) => MainPages(),
        },
      ),
    );
  }
}
