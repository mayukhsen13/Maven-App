import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:otg_learning/config/secure_package.dart';
import 'package:otg_learning/ui/models/homeCourseModel.dart';

final String courseUrl = 'https://maven.mindwebs.org/api';

Future<List<HomeCourse>> getHomeCourses() async {
  final token = await SecurePackage.getUserToken();
  Response res = await get(
    Uri.parse(courseUrl + "/courses"),
    headers: {
      HttpHeaders.authorizationHeader: 'Token $token',
    },
  );
  if (res.statusCode == 200) {
    List<dynamic> body = jsonDecode(res.body);
    List<HomeCourse> courses =
        body.map((dynamic item) => HomeCourse.fromJson(item)).toList();
    return courses;
  } else {
    return null;
  }
}
