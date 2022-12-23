import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../shared/theme.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [kBlueSea, kBlueDeep],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        // margin: EdgeInsets.only(top: 50),
        child: ListView(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 50),
                child: Image.asset(
                  'assets/ilustration_splash.png',
                  width: 235,
                  height: 310,
                ),
              ),
            ),
            //! Text
            Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(left: 12),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text('Selamat Datang',
                          style: kWhiteTextStyleNotoSans.copyWith(
                              fontSize: 36, fontWeight: extrabold)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text('E-School',
                          style: kWhiteTextStyleRoboto.copyWith(
                              fontSize: 20, fontWeight: regular)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Text('Aplikasi pembelajaran sekolah',
                          style: kWhiteTextStyleRoboto.copyWith(
                              fontSize: 20, fontWeight: semibold)),
                    ),
                  ),
                  //! Button
                  Container(
                    margin: EdgeInsets.only(top: 130),
                    width: 336,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign-in');
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: kBluePrimary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text('Get Started',
                          style: kWhiteTextStyleRoboto.copyWith(
                              fontSize: 20, fontWeight: bold)),
                    ),
                  ),
                  //! Hyperlink
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum memiliki akun?',
                          style: kWhiteTextStyleRoboto.copyWith(
                              fontSize: 13, fontWeight: bold),
                        ),
                        Text(' Registrasi',
                            style: kWhiteTextStyleNotoSans.copyWith(
                                fontSize: 13,
                                fontWeight: light,
                                decoration: TextDecoration.underline))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
