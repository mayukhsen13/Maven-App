import 'package:flutter/material.dart';
import 'package:otg_learning/services/HomeServices.dart';
import 'package:otg_learning/ui/models/homeCourseModel.dart';
import 'package:otg_learning/ui/widgets/courseItemThumb.dart';

class AllCoursesPage extends StatefulWidget {
  @override
  _AllCoursesPageState createState() => _AllCoursesPageState();
}

class _AllCoursesPageState extends State<AllCoursesPage> {
  List<HomeCourse> allCourses;
  void getCourses() async {
    List<HomeCourse> courseData = await getHomeCourses();
    // for (int i = 0; i < courseData.length; i++) {
    //   print(courseData[i].title);
    // }
    setState(() {
      allCourses = courseData;
    });
  }

  @override
  void initState() {
    super.initState();
    getCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("All Courses"),
        ),
        body: allCourses != null
            ? ListView.builder(
                itemCount: allCourses.length,
                itemBuilder: (_, i) {
                  return ThumbCourseItem(
                    name: allCourses[i].title,
                    imageUrl: allCourses[i].thumbnail,
                    price: allCourses[i].price.toInt(),
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
