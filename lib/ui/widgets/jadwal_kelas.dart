import 'package:e_school/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../shared/theme.dart';

class jadwalKelas extends StatelessWidget {
  final hari;
  final matpel1;
  final matpel2;
  final waktu1;
  final waktu2;

  const jadwalKelas(
      {super.key,
      required this.hari,
      required this.matpel1,
      required this.matpel2,
      this.waktu1 = 'Waktu 07.00 - 9.30',
      this.waktu2 = 'Waktu 07.00 - 9.30'});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 25, left: 12, right: 12),
        height: 200,
        padding: EdgeInsets.only(left: 20, top: 10),
        decoration: BoxDecoration(
          color: kBlueDeep,
          boxShadow: kElevationToShadow[3],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  child: Text(
                    hari,
                    style: kWhiteTextStyleNotoSans.copyWith(
                        fontSize: 20, fontWeight: bold),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 10, left: 10, top: 5),
                    height: 60,
                    width: 330,
                    decoration: BoxDecoration(
                      color: kTextWhite,
                      boxShadow: kElevationToShadow[3],
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 10, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            matpel1,
                            style: kBlackTextStyleNotoSans.copyWith(
                                fontSize: 20, fontWeight: bold),
                          ),
                          SizedBox(height: 5),
                          Text(waktu1,
                              style: kBlackTextStyleNotoSans.copyWith(
                                  fontSize: 14, fontWeight: regular))
                        ],
                      ),
                    )),
              ],
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 10, left: 10, top: 5),
                    height: 60,
                    width: 330,
                    decoration: BoxDecoration(
                      color: kTextWhite,
                      boxShadow: kElevationToShadow[3],
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 10, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            matpel2,
                            style: kBlackTextStyleNotoSans.copyWith(
                                fontSize: 20, fontWeight: bold),
                          ),
                          SizedBox(height: 5),
                          Text(waktu2,
                              style: kBlackTextStyleNotoSans.copyWith(
                                  fontSize: 14, fontWeight: regular))
                        ],
                      ),
                    )),
              ],
            )
          ],
        ));
  }
}
