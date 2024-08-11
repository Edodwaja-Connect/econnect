import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eapp/pages/course_page.dart';
import 'package:eapp/pages/detail_page.dart';
import 'package:eapp/pages/home_page.dart';
import 'package:eapp/pages/profile_page.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late List<Widget> pages;
  late HomePage homePage;
  late CoursePage course;
  late DetailPage detail;
  int currentTabIndex = 0;

  @override
  void initState() {
    homePage = HomePage();
    course = CoursePage();
    detail = DetailPage();
    pages = [homePage, course, detail];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 65,
          backgroundColor: Colors.white,
          color: Colors.black,
          animationDuration: Duration(milliseconds: 500),
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          items: [
            Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.book_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.account_box_outlined,
              color: Colors.white,
            ),
          ]),
      body: pages[currentTabIndex],
    );
  }
}
