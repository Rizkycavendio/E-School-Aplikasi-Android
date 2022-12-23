import 'package:e_school/cubit/auth_cubit.dart';
import 'package:e_school/ui/widgets/custom_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController nisnController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 25),
        child: Center(
          child: Text(
            'LOGIN',
            style: kBlackTextStyleNotoSans.copyWith(
                fontSize: 16, fontWeight: semibold),
          ),
        ),
      );
    }

    Widget title2() {
      return Container(
        margin: EdgeInsets.only(top: 50, left: 12),
        child: Text(
          'Hallo, Selamat Datang',
          style:
              kBlackTextStyleNotoSans.copyWith(fontSize: 24, fontWeight: bold),
        ),
      );
    }

    Widget title3() {
      return Container(
        margin: EdgeInsets.only(top: 20, left: 12),
        child: Text(
          'Masuk sebagai siswa dengan akun \nyang sudah terdaftar',
          style:
              kBlackTextStyleRoboto.copyWith(fontSize: 16, fontWeight: regular),
        ),
      );
    }

    Widget inputSection() {
      //? HYPERLINK LUPA PASSWORD
      Widget signUpButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main-page', (route) => false);
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kRedColor,
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              margin: EdgeInsets.only(top: 18),
              width: 336,
              height: 50,
              child: TextButton(
                onPressed: () {
                  context.read<AuthCubit>().signIn(
                      email: emailController.text,
                      nisn: nisnController.text,
                      password: passwordController.text);
                },
                style: TextButton.styleFrom(
                    backgroundColor: kBlueDeep,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text(
                  'Sign In',
                  style: kWhiteTextStyleRoboto.copyWith(
                      fontSize: 20, fontWeight: bold),
                ),
              ),
            );
          },
        );
      }

      Widget textLupaPassword() {
        return Align(
          alignment: Alignment.centerRight,
          child: Container(
            child: Text('Lupa Password?',
                style: kOrangeTextStyleRoboto.copyWith(
                    fontSize: 13, fontWeight: regular)),
          ),
        );
      }

      Widget textRegistrasi() {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/sign-up');
          },
          child: Container(
            margin: EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Belum punya akun?',
                  style: kBlackTextStyleRoboto.copyWith(
                      fontSize: 13, fontWeight: bold),
                ),
                Text('Registrasi',
                    style: kBlackTextStyleNotoSans.copyWith(
                        fontSize: 13,
                        fontWeight: light,
                        decoration: TextDecoration.underline))
              ],
            ),
          ),
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 30, left: 20, right: 20),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
            color: kTextWhite, borderRadius: BorderRadius.circular(10)),
        child: Container(
          child: Column(
            children: [
              CustomTextFromField(
                title: 'Email',
                hintText: 'Email',
                controller: emailController,
              ),
              CustomTextFromField(
                title: 'NISN',
                hintText: 'NISN',
                controller: nisnController,
              ),
              CustomTextFromField(
                title: 'Password',
                hintText: 'Password',
                obscureText: true,
                controller: passwordController,
              ),
              textLupaPassword(),
              signUpButton(),
              textRegistrasi()
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [title(), title2(), title3(), inputSection()],
      )),
    );
  }
}
