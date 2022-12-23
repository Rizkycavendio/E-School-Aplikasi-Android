import 'package:e_school/ui/widgets/jadwal_kelas.dart';
import 'package:e_school/ui/widgets/tugas_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../shared/theme.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage({super.key});

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
              'Jadwal \n Kelasmu!',
              textAlign: TextAlign.center,
              style: kWhiteTextStyleNotoSans.copyWith(
                  fontSize: 24, fontWeight: bold),
            ),
          ),
        ));
  }

  Widget boxJadwal() {
    return Container(
      child: Column(
        children: [
          jadwalKelas(
            hari: 'Senin',
            matpel1: 'Bahasa Inggris',
            matpel2: 'Matematika',
          ),
          jadwalKelas(
            hari: 'Selasa',
            matpel1: 'Geografi',
            matpel2: 'Sains',
          ),
          jadwalKelas(
            hari: 'Rabu',
            matpel1: 'Bahasa Indonesia',
            matpel2: 'Sosiologi',
          ),
          jadwalKelas(
            hari: 'Kamis',
            matpel1: 'Geografi',
            matpel2: 'Olahraga',
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [header(), boxJadwal()],
    );
  }
}
