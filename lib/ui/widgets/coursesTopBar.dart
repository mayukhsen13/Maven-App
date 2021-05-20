import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../pages/profile.dart';
import '../animations/fadeRoute.dart';
import '../animations/PhotoHero.dart';

class CoursesTopBar extends StatefulWidget {
  const CoursesTopBar({
    Key key,
  }) : super(key: key);

  goToProfile(BuildContext context) {
    Navigator.push(
      context,
      FadeRoute(page: Profile(page: "myCourses")),
    );
  }

  @override
  _CoursesTopBarState createState() => _CoursesTopBarState();
}

class _CoursesTopBarState extends State<CoursesTopBar> {
  String selectedItem = "All Courses";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 62,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black12, offset: Offset(0, 5), blurRadius: 5)
      ], color: Theme.of(context).focusColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Text("All Courses",
                            style: Theme.of(context).textTheme.headline2),
                        Icon(Icons.arrow_drop_down_outlined, size: 30)
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: IconButton(
                          icon: Icon(Icons.search_rounded, size: 30),
                          onPressed: () {
                            print("Search");
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: PhotoHero(
                          photo: "assets/images/user.png",
                          onTap: () => widget.goToProfile(context),
                          width: 40,
                          page: "myCourses"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
