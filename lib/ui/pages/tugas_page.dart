import 'package:e_school/ui/widgets/tugas_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../shared/theme.dart';

class TugasPage extends StatelessWidget {
  const TugasPage({super.key});

  //? HEADER
  Widget header() {
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
          child: Center(
            child: Text(
              'Tugas \n Rumahmu!',
              textAlign: TextAlign.center,
              style: kWhiteTextStyleNotoSans.copyWith(
                  fontSize: 24, fontWeight: bold),
            ),
          ),
        ));
  }

  Widget boxTugas() {
    return Container(
      child: Column(
        children: [
          TugasTile(
            matpel: 'Matematika',
            backgroundColor: kRedColor,
            icon: 'assets/logo_math.png',
            subTitle:
                'Kerjakan soal ini di kertas polio,dengan menggunakan pulpen.',
          ),
          TugasTile(
            matpel: 'Bahasa Indonesia',
            backgroundColor: kGreenColor,
            icon: 'assets/logo_bindo.png',
            subTitle:
                'Kerjakan soal ini di kertas polio,dengan menggunakan pulpen.',
          ),
          TugasTile(
            matpel: 'Bahasa Inggris',
            backgroundColor: kYellowColor,
            icon: 'assets/logo_bingg.png',
            subTitle:
                'Kerjakan soal ini di kertas polio,dengan menggunakan pulpen.',
          ),
          TugasTile(
            matpel: 'Sosiologi',
            backgroundColor: kGreenMuda,
            icon: 'assets/logo_sosio.png',
            subTitle:
                'Kerjakan soal ini di kertas polio,dengan menggunakan pulpen.',
          ),
          TugasTile(
            matpel: 'Sains',
            backgroundColor: kBlueGridColor,
            icon: 'assets/logo_sains.png',
            subTitle:
                'Kerjakan soal ini di kertas polio,dengan menggunakan pulpen.',
          ),
          TugasTile(
            matpel: 'Ekonomi',
            backgroundColor: kOrangeColor,
            icon: 'assets/logo_ekonomi.png',
            subTitle:
                'Kerjakan soal ini di kertas polio,dengan menggunakan pulpen.',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [header(), boxTugas()],
    );
  }
}
