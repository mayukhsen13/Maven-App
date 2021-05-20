import 'package:flutter/material.dart';

class ThumbCourseItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int price;

  const ThumbCourseItem({Key key, this.name, this.imageUrl, this.price})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 100,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    imageUrl,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 10, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontSize: 16),
                        softWrap: true,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Text(
                          "₹" + price.toString(),
                          textAlign: TextAlign.left,
                          softWrap: true,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
