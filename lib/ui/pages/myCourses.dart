import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './course.dart';
import '../animations/slideRoute.dart';
import '../models/course.dart';
import '../widgets/coursesTopBar.dart';

class MyCourses extends StatefulWidget {
  MyCourses({Key key}) : super(key: key);

  final List<Course> _courses = [
    Course(
        title: "React - The Complete Guide (incl Hooks, React Router, Redux)",
        creator:
            "Academind by Maximillian Schwarzmuller, Maximillian Schwarzmuller",
        completed: 0.2),
  ];

  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  _goToCourse(BuildContext context) {
    Navigator.push(context, SlideRightRoute(page: CourseScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).hintColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SafeArea(
              child: Container(
                margin: EdgeInsets.only(top: 65),
                child: ListView.builder(
                  itemCount: widget._courses.length,
                  itemBuilder: (ctx, index) => Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () => _goToCourse(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blueAccent),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Container(
                                  width: double.infinity,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 4.0),
                                          child: Text(
                                              widget._courses[index].title,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3),
                                        ),
                                        Text(widget._courses[index].creator,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2),
                                        if (widget._courses[index].completed >
                                            0)
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  alignment:
                                                      AlignmentGeometry.lerp(
                                                          Alignment.centerLeft,
                                                          Alignment.centerLeft,
                                                          0),
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 6.0),
                                                  width: double.infinity,
                                                  height: 5,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[400],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: FractionallySizedBox(
                                                      heightFactor: 1,
                                                      widthFactor: widget
                                                          ._courses[index]
                                                          .completed,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Theme.of(context)
                                                                  .accentColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                      )),
                                                ),
                                                Text(
                                                    '${(widget._courses[index].completed * 100).toInt()}% complete',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2)
                                              ])
                                        else
                                          Container(
                                              margin: EdgeInsets.only(top: 15),
                                              child: Text("START COURSE",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4))
                                      ]),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: CoursesTopBar(),
            )
          ],
        ),
      ),
    );
  }
}
