import 'package:flutter/material.dart';
import 'package:otg_learning/services/HomeServices.dart';
import 'package:otg_learning/ui/models/homeCourseModel.dart';
import 'package:otg_learning/ui/pages/allCourses.dart';
import 'package:otg_learning/ui/widgets/categoryItem.dart';
import 'package:otg_learning/ui/widgets/homeCourse.dart';

import '../widgets/topBar.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HomeCourse> homeCourses;
  void getCourses() async {
    List<HomeCourse> courseData = await getHomeCourses();
    // for (int i = 0; i < courseData.length; i++) {
    //   print(courseData[i].title);
    // }
    setState(() {
      homeCourses = courseData;
    });
  }

  @override
  void initState() {
    super.initState();
    getCourses();
  }

  void seeAllCourses(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return AllCoursesPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Theme.of(context).hintColor,
        child: homeCourses != null
            ? SafeArea(
                child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  SafeArea(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: 65, left: 20, right: 20, bottom: 20),
                          height: 250,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, bottom: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Featured",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                        Container(
                          height: 300,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: homeCourses.length + 1,
                            itemBuilder: (_, i) {
                              if (i == homeCourses.length)
                                return GestureDetector(
                                  onTap: () => seeAllCourses(context),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    child: Container(
                                      width: 200,
                                      height: 200,
                                      child: Center(
                                        child: Text(
                                          "See more >",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Theme.of(context)
                                                  .accentColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              return HomeCourseItem(
                                title: homeCourses[i].title,
                                imageUrl: homeCourses[i].thumbnail,
                                price: homeCourses[i].price.toInt(),
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                            top: 20,
                            bottom: 10,
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Categories",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                        Container(
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 8,
                            itemBuilder: (_, i) {
                              return CategoryItem();
                            },
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 20, top: 10, bottom: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Our top picks for you",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://img-a.udemycdn.com/course/240x135/3749464_eaea.jpg?J6fr_E0zi0JAKeIDNI_rNcWXUfdENpZK938IMeGzJYciN6-zHaysg0m699pDag84VJRh7rdRZu1fSCaaZk_7_bT94JFJb49ZiOrsiFT_g75dX5ZZas7kUyqwNSp27g',
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "React and Typescript: Build a Portfolio ",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10, bottom: 10),
                                child: Text(
                                  "₹1999 ",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
                  Positioned(
                    top: 0,
                    child: TopBar(page: 'home'),
                  ),
                ],
              ))
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
