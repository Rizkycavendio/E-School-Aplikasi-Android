import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../shared/theme.dart';

class DetailMatpel2 extends StatelessWidget {
  const DetailMatpel2({super.key});

  Widget playVideo({@required text, icon}) {
    return Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Material(
          color: kBlueGridColor,
          elevation: 4,
          shadowColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      text,
                      style: kWhiteTextStyleNotoSans.copyWith(
                          fontSize: 20, fontWeight: bold),
                    ),
                  )
                ],
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Icon(
                      icon,
                      size: 50,
                      color: kTextWhite,
                    ),
                  )
                ],
              ))
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: kTextWhite,
        centerTitle: true,
        title: Text(
          'Bahasa Indonesia',
          style:
              kBlackTextStyleNotoSans.copyWith(fontSize: 20, fontWeight: bold),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 200,
                width: double.infinity,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/bindo_icon.png'))),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, left: 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Bahasa dan Sastra Indonesia',
                    style: kBlackTextStyleNotoSans.copyWith(
                        fontSize: 20, fontWeight: bold),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              //! Button
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                width: double.infinity,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-up');
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: kBlueSea,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text('E-Book',
                      style: kWhiteTextStyleRoboto.copyWith(
                          fontSize: 20, fontWeight: bold)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12, left: 12, right: 12),
                height: 160,
                decoration: BoxDecoration(
                  color: kTextWhite,
                  boxShadow: kElevationToShadow[3],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Deskripsi: ',
                          style: kBlackTextStyleRoboto.copyWith(
                              fontSize: 14, fontWeight: bold),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        'Pendidikan Bahasa & Sastra Indonesia (PBSI) atau dikenal juga dengan Jurusan Pendidikan Bahasa Indonesia merupakan bidang yang mengajarkan keterampilan berbahasa Indonesia dengan baik dan efektif, seperti keterampilan menyimak, berbicara, membaca, dan menulis.',
                        style: kBlackTextStyleRoboto.copyWith(
                            fontSize: 14, fontWeight: light),
                      ),
                    ),
                  ],
                ),
              ),
              playVideo(text: 'Video 1', icon: Icons.play_circle_fill),
              playVideo(text: 'Video 2', icon: Icons.play_circle_fill),
              playVideo(text: 'Video 3', icon: Icons.play_circle_fill),
              playVideo(text: 'Video 4', icon: Icons.play_circle_fill),
              playVideo(text: 'Video 5', icon: Icons.play_circle_fill),
              playVideo(text: 'Video 6', icon: Icons.play_circle_fill),
              playVideo(text: 'Video 7', icon: Icons.play_circle_fill),
              playVideo(text: 'Video 8', icon: Icons.play_circle_fill),
              playVideo(text: 'Video 9', icon: Icons.play_circle_fill),
              playVideo(text: 'Video 10', icon: Icons.play_circle_fill),
            ]),
          ],
        ),
      ),
    );
  }
}
