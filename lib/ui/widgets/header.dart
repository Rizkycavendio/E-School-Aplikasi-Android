import 'package:e_school/cubit/auth_cubit.dart';
import 'package:e_school/ui/pages/detail_matpel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../shared/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
              height: 170,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  gradient: LinearGradient(
                      colors: [kBlueSea, kBlueDeep],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: Container(
                margin: EdgeInsets.only(top: 35, left: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hallo, ${state.user.name}',
                            style: kWhiteTextStyleNotoSans.copyWith(
                                fontWeight: bold, fontSize: 28),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Selamat Belajar!',
                            style: kWhiteTextStyleNotoSans.copyWith(
                                fontWeight: regular, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 25, bottom: 70),
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/akun.png'))),
                    )
                  ],
                ),
              ));
        } else {
          return SizedBox();
        }
      },
    );
  }
}
