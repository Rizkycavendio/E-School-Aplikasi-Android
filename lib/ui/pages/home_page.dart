import 'package:e_school/ui/pages/detail_matpel.dart';
import 'package:e_school/ui/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../shared/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  //? LIST Image Slider
  final List<Widget> imageSliders = [
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kBluePrimary,
      ),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    'Semangat Belajarnya!',
                    style: kWhiteTextStyleNotoSans.copyWith(
                        fontSize: 16, fontWeight: bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'Silahkan pilih kelas di bawah',
                    style: kWhiteTextStyleNotoSans.copyWith(
                        fontSize: 12, fontWeight: bold),
                  ),
                )
              ],
            ),
          ),
          Container(
            // margin: EdgeInsets.only(right: 25, bottom: 70),
            width: 114,
            height: 109,
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/ilustration_slider_1.png'))),
          )
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kBluePrimary,
      ),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    'Ujian Akhir Semester',
                    style: kWhiteTextStyleNotoSans.copyWith(
                        fontSize: 16, fontWeight: bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'Tanggal ujian dimulai:',
                    style: kWhiteTextStyleNotoSans.copyWith(
                        fontSize: 11, fontWeight: regular),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    '09 Desember 2022',
                    style: kWhiteTextStyleNotoSans.copyWith(
                        fontSize: 12, fontWeight: bold),
                  ),
                )
              ],
            ),
          ),
          Container(
            // margin: EdgeInsets.only(right: 25, bottom: 70),
            width: 114,
            height: 109,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/ilustration_slider.png'))),
          )
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kBluePrimary,
      ),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    'Tugas Jangan Lupa Dikerjakan',
                    style: kWhiteTextStyleNotoSans.copyWith(
                        fontSize: 16, fontWeight: bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'Silahkan cek pada menu Tugas',
                    style: kWhiteTextStyleNotoSans.copyWith(
                        fontSize: 12, fontWeight: bold),
                  ),
                )
              ],
            ),
          ),
          Container(
            // margin: EdgeInsets.only(right: 25, bottom: 70),
            width: 114,
            height: 109,
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/ilustration_slider_2.png'))),
          )
        ],
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    //? HEADER
    // Widget header() {

    // }

    //? SLIDER
    Widget slider() {
      return Container(
          margin: EdgeInsets.only(top: 18),
          child: Column(
            children: [
              CarouselSlider(
                items: imageSliders,
                carouselController: _controller,
                options: CarouselOptions(
                    height: 125,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageSliders.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 6.0,
                      height: 6.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : kBlueSea)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ],
          ));
    }

    //? TITLE MATA PELAJARAN
    Widget titleMatpel() {
      return Container(
        margin: EdgeInsets.only(left: 10, top: 12),
        child: Text(
          'Mata Pelajaran',
          style:
              kBlackTextStyleNotoSans.copyWith(fontSize: 20, fontWeight: bold),
        ),
      );
    }

    // //? GRIDVIEW MATPEL
    // Widget gridMatpel() {
    //   return Container(
    //     child: GridView(
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
    //   children: [
    //     Container(
    //       color: kBlueColor,
    //     ),
    //     Container(
    //       color: kBlueColor,
    //     ),
    //     Container(
    //       color: kBlueColor,
    //     ),
    //   ],
    // ));
    //       );
    // }

    return Scaffold(
        body: Container(
      child: ListView(
        children: [
          Header(),
          slider(),
          titleMatpel(),
          //! ROW 1
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/detail-matpel');
                },
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 21),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logo_math.png')),
                          borderRadius: BorderRadius.circular(25),
                          color: kRedColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        'Matematika',
                        style: kBlackTextStyleRoboto.copyWith(
                            fontWeight: regular, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/detail-matpel2');
                },
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 21),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logo_bindo.png')),
                          borderRadius: BorderRadius.circular(25),
                          color: kGreenColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        'B. Indonesia',
                        style: kBlackTextStyleRoboto.copyWith(
                            fontWeight: regular, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/detail-matpel3');
                },
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 21),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logo_bingg.png')),
                          borderRadius: BorderRadius.circular(25),
                          color: kYellowColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        'B. Inggris',
                        style: kBlackTextStyleRoboto.copyWith(
                            fontWeight: regular, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          //! ROW 2
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/detail-matpel4');
                },
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 21),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logo_sains.png')),
                          borderRadius: BorderRadius.circular(25),
                          color: kBlueGridColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        'Sains',
                        style: kBlackTextStyleRoboto.copyWith(
                            fontWeight: regular, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/detail-matpel5');
                },
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 21),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logo_tik.png')),
                          borderRadius: BorderRadius.circular(25),
                          color: kOrangeColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        'TIK',
                        style: kBlackTextStyleRoboto.copyWith(
                            fontWeight: regular, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/detail-matpel6');
                },
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 21),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logo_geo.png')),
                          borderRadius: BorderRadius.circular(25),
                          color: kPinkColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        'Geografi',
                        style: kBlackTextStyleRoboto.copyWith(
                            fontWeight: regular, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          //! ROW 3
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/detail-matpel7');
                },
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 21),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logo_sosio.png')),
                          borderRadius: BorderRadius.circular(25),
                          color: kGreenMuda),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        'Sosiologi',
                        style: kBlackTextStyleRoboto.copyWith(
                            fontWeight: regular, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/detail-matpel8');
                },
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 21),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logo_ekonomi.png')),
                          borderRadius: BorderRadius.circular(25),
                          color: kPurpleColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        'Ekonomi',
                        style: kBlackTextStyleRoboto.copyWith(
                            fontWeight: regular, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/detail-matpel9');
                },
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 21),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logo_olahraga.png')),
                          borderRadius: BorderRadius.circular(25),
                          color: kGreyGridColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        'Olahraga',
                        style: kBlackTextStyleRoboto.copyWith(
                            fontWeight: regular, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
