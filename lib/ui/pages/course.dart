import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/lecture.dart';
import '../models/fullCourse.dart';
import '../animations/slideRoute.dart';
import './video.dart';

class CourseScreen extends StatefulWidget {
  CourseScreen({Key key}) : super(key: key);

  final List<FullCourse> _courses = [
    FullCourse(
        title: "Visualization on R",
        creator:
            "Academind by Maximillian Schwarzmuller, Maximillian Schwarzmuller",
        price: 899,
        learning: ["Application of Visualization on R"],
        requirements: "A knowledge of R Programming and Analytics",
        sections: [
          Section(title: "Charting with R", lectures: [
            Lecture(
                title: "plot.new() function in R: Generating new plot object",
                time: 3),
            Lecture(
              title: "plot.window() function in R: Creating window",
              time: 4,
            )
          ])
        ]),
  ];

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  _goToVideo(BuildContext context) {
    Navigator.push(context, SlideTopRoute(page: VideoScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).hintColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Localizations(
              locale: const Locale('en', 'US'),
              delegates: <LocalizationsDelegate<dynamic>>[
                DefaultWidgetsLocalizations.delegate,
                DefaultMaterialLocalizations.delegate,
              ],
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight:
                        (MediaQuery.of(context).size.width / 16) * 9,
                    collapsedHeight: 0,
                    toolbarHeight: -1,
                    elevation: 1,
                    stretch: false,
                    backgroundColor: Theme.of(context).hintColor,
                    flexibleSpace: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        color: Theme.of(context).accentColor),
                  ),
                  SliverFillRemaining()
                ],
              ),
            ),
            Positioned(
                top: 5,
                left: 5,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Material(
                      color: Color.fromRGBO(128, 128, 128, 0.3),
                      type: MaterialType.circle,
                      child: IconButton(
                          icon: Icon(Icons.arrow_back,
                              color: Theme.of(context).primaryColor),
                          onPressed: () => {Navigator.of(context).pop()}),
                    )))
          ],
        ),
      ),
    );
  }
}
