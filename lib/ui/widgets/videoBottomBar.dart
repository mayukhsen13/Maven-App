import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/course.dart';

class VideoBottomBar extends StatefulWidget {
  final Course course;
  const VideoBottomBar({Key key, this.course}) : super(key: key);

  @override
  _VideoBottomBarState createState() => _VideoBottomBarState();
}

class _VideoBottomBarState extends State<VideoBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 59,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black12, offset: Offset(0, -5), blurRadius: 5)
      ], color: Theme.of(context).focusColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // FlickVideoProgressBar(
          //   flickProgressBarSettings: FlickProgressBarSettings(
          //     height: 4,
          //     handleRadius: 8,
          //     padding: EdgeInsets.symmetric(
          //       horizontal: 0.0,
          //       vertical: 8,
          //     ),
          //     backgroundColor: Colors.white24,
          //     bufferedColor: Colors.white38,
          //     playedColor: Theme.of(context).accentColor,
          //     getHandlePaint: (
          //         {double handleRadius,
          //         double height,
          //         double playedPart,
          //         double,
          //         width}) {
          //       return Paint()
          //         ..shader = RadialGradient(
          //           colors: [
          //             Theme.of(context).accentColor,
          //             Theme.of(context).accentColor,
          //             Colors.white,
          //           ],
          //           stops: [0.0, 0.4, 0.5],
          //           radius: 0.4,
          //         ).createShader(
          //           Rect.fromCircle(
          //             center: Offset(playedPart, height / 2),
          //             radius: handleRadius,
          //           ),
          //         );
          //     },
          //   ),
          // ),
          Container(
            height: 4,
            color: Colors.grey[400],
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
                heightFactor: 1,
                widthFactor: 0.2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 55,
                width: 97.78,
                decoration: BoxDecoration(color: Colors.blueAccent),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(widget.course.title,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.headline5),
                          ),
                          Text(widget.course.creator,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText2),
                        ]),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(Icons.pause_outlined)),
            ],
          ),
        ],
      ),
    );
  }
}
