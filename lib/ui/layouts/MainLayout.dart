import 'dart:ui';
import 'package:flutter/material.dart';
import '../pages/myCart.dart';
import '../pages/search.dart';
import '../pages/classroom.dart';
import '../pages/myCourses.dart';
import '../pages/home.dart';

import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart';

class MainLayout extends StatefulWidget {
  final onMenuTap;
  MainLayout({this.onMenuTap});
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int tabNo = 0;
  CupertinoTabController controller;
  @override
  void initState() {
    controller = CupertinoTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CupertinoTabScaffold(
            controller: controller,
            tabBar: CupertinoTabBar(
              backgroundColor: Theme.of(context).focusColor,
              onTap: (value) {
                setState(() {
                  tabNo = value;
                });
              },
              activeColor: material.Colors.lightBlue,
              inactiveColor: Color(0xFFADADAD),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: "Home",
                    activeIcon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search_rounded), label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.play_arrow_outlined),
                    activeIcon: Icon(Icons.play_arrow_sharp),
                    label: "My Courses"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.meeting_room_outlined),
                    activeIcon: Icon(Icons.meeting_room),
                    label: "Classroom"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined),
                    label: "My Cart",
                    activeIcon: Icon(Icons.shopping_cart_rounded)),
              ],
            ),
            tabBuilder: (context, index) => index == 0
                ? HomePage()
                : index == 1
                    ? Search()
                    : index == 2
                        ? MyCourses()
                        : index == 3
                            ? Classroom()
                            : index == 4
                                ? MyCart()
                                : HomePage()),

        // Positioned(
        //     bottom: 50,
        //     child: Dismissible(
        //         resizeDuration: null,
        //         key: new ValueKey(1),
        //         child: VideoBottomBar(
        //             course: Course(
        //                 title:
        //                     "React - The Complete Guide (incl Hooks, React Router, Redux)",
        //                 creator:
        //                     "Academind by Maximillian Schwarzmuller, Maximillian Schwarzmuller",
        //                 completed: 0.2)))),
        // Positioned(
        //     bottom: 20,
        //     child: Container(
        //       decoration: BoxDecoration(
        //           gradient: LinearGradient(
        //             colors: [
        //               Color(0xFFABDCFF),
        //               Color(0xFF0396FF),
        //             ],
        //             begin: Alignment.topLeft,
        //             end: Alignment.bottomRight,
        //           ),
        //           boxShadow: [
        //             BoxShadow(
        //                 blurRadius: 25,
        //                 color: Color(0xFF03A9F4).withOpacity(0.4),
        //                 offset: Offset(0, 4))
        //           ],
        //           borderRadius: BorderRadius.circular(500)),
        //       child: material.FloatingActionButton(
        //           elevation: 0,
        //           highlightElevation: 0,
        //           backgroundColor: material.Colors.transparent,
        //           child: Icon(Icons.play_arrow_rounded,
        //               color: Theme.of(context).primaryColor),
        //           onPressed: () {
        //             this.controller.index = 2;
        //             setState(() {
        //               tabNo = 2;
        //             });
        //           }),
        //     )),
        // Positioned(
        //     bottom: 0,
        //     child: GestureDetector(
        //       child: SizedBox(
        //         height: 20,
        //         width: 60,
        //         child: FittedBox(
        //             child: Text("My Courses",
        //                 style: TextStyle(
        //                     color: tabNo == 2
        //                         ? material.Colors.lightBlue
        //                         : Color(0xFFADADAD)))),
        //       ),
        //       onTap: () {
        //         this.controller.index = 2;
        //         setState(() {
        //           tabNo = 2;
        //         });
        //       },
        //     )),
      ],
    );
  }
}
