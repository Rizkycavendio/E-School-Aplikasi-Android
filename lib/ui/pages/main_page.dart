import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:e_school/ui/pages/home_page.dart';
import 'package:e_school/ui/pages/jadwal_page.dart';
import 'package:e_school/ui/pages/profile_page.dart';
import 'package:e_school/ui/pages/tugas_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../shared/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  List<Widget> widgets = [
    HomePage(),
    TugasPage(),
    JadwalPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[currentIndex],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.flip,
        backgroundColor: kBlueColor,
        height: 50,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.menu_book_sharp, title: 'Tugas'),
          TabItem(icon: Icons.calendar_month, title: 'Jadwal'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: 0,
        onTap: (int i) {
          setState(() {
            currentIndex = i;
          });
        },
      ),
    );
  }
}
