import 'dart:async';

import 'package:e_school/cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        Navigator.pushNamed(context, '/get-started');
      } else {
        print(user.email);
        context.read<AuthCubit>().getCurrentUser(user.uid);
        Navigator.pushNamedAndRemoveUntil(
            context, '/sign-in', (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 235,
              height: 310,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/logo_splash.png'))),
            ),
            Text(
              'E-SCHOOL',
              style: kWhiteTextStyleNotoSans.copyWith(
                  fontSize: 32, fontWeight: bold, letterSpacing: 10),
            ),
            Container(
              margin: EdgeInsets.only(top: 300),
              child: Text(
                'By K E L O M P O K  6',
                style: kWhiteTextStyleNotoSans,
              ),
            )
          ],
        ),
      ),
    );
  }
}
