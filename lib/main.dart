import 'package:e_school/cubit/auth_cubit.dart';
import 'package:e_school/ui/pages/detail_matpel.dart';
import 'package:e_school/ui/pages/detail_matpel2.dart';
import 'package:e_school/ui/pages/detail_matpel8.dart';
import 'package:e_school/ui/pages/home_page.dart';
import 'package:e_school/ui/pages/main_page.dart';
import 'package:e_school/ui/pages/sign_in.dart';
import 'package:e_school/ui/pages/sign_up.dart';
import 'package:e_school/ui/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ui/pages/get_started.dart';

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
          create: (context) => AuthCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': ((context) => SplashScreen()),
          '/get-started': (context) => GetStarted(),
          '/sign-in': (context) => SignIn(),
          '/sign-up': (context) => SignUp(),
          '/main-page': (context) => MainPage(),
          '/detail-matpel': (context) => DetailMatpel(),
          '/detail-matpel2': (context) => DetailMatpel2(),
          '/detail-matpel8': (context) => DetailMatpel8()
        },
      ),
    );
  }
}
