import 'package:flutter/material.dart';
import 'package:otg_learning/ui/pages/courseDetails.dart';

class HomeCourseItem extends StatelessWidget {
  @required
  final String title;
  final String imageUrl;
  final int price;

  const HomeCourseItem({Key key, this.title, this.imageUrl, this.price})
      : super(key: key);

  void selectCourse(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CourseDetails(
        title: title,
        imageUrl: imageUrl,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectCourse(context),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                width: 200,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 200,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline5,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                margin: EdgeInsets.only(top: 10),
                width: 200,
                alignment: Alignment.centerLeft,
                child: Text(
                  price.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
