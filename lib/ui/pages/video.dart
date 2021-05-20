import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otg_learning/ui/video/custom_orientation_player.dart';
import 'package:video_player/video_player.dart';
import '../models/lecture.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen({Key key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen>
    with SingleTickerProviderStateMixin {
  FlickManager flickManager;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
        "https://vfx.mtime.cn/Video/2019/03/09/mp4/190309153658147087.mp4",
      ),
      // onVideoEnd: () {
      //   dataManager.skipToNextVideo(Duration(seconds: 5));
      // }
    );
    _tabController = new TabController(vsync: this, initialIndex: 0, length: 2);
  }

  @override
  void dispose() {
    flickManager.dispose();
    _tabController.dispose();
    super.dispose();
  }

  final List<Lecture> lectures = [
    Lecture(
      title: "Introduction",
      time: 1,
    ),
    Lecture(
      title: "Introduction",
      time: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).hintColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                  height: 250,
                  color: Colors.black,
                  child: CustomOrientationPlayer(this.flickManager)),
            ),
            Localizations(
              locale: const Locale('en', 'US'),
              delegates: <LocalizationsDelegate<dynamic>>[
                DefaultWidgetsLocalizations.delegate,
                DefaultMaterialLocalizations.delegate,
              ],
              child: Container(
                margin: EdgeInsets.only(top: 250),
                child: NestedScrollView(
                  physics: const BouncingScrollPhysics(),
                  headerSliverBuilder: (ctx, value) => [
                    SliverAppBar(
                      pinned: true,
                      expandedHeight: 148,
                      collapsedHeight: 0,
                      toolbarHeight: -1,
                      elevation: 1,
                      stretch: false,
                      backgroundColor: Theme.of(context).hintColor,
                      flexibleSpace: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Wrap(
                            children: [
                              Text(
                                  "React - The Complete Guide (incl Hooks, React Router, Redux)",
                                  style: Theme.of(context).textTheme.headline2),
                              Text(
                                  "Academind by Maximillian Schwarzmuller, Maximillian Schwarzmuller",
                                  style: Theme.of(context).textTheme.headline5,
                                  overflow: TextOverflow.ellipsis)
                            ],
                          )),
                    ),
                    SliverPersistentHeader(
                      delegate:
                          SectionHeaderDelegate(tabController: _tabController),
                      pinned: true,
                    ),
                  ],
                  body: TabBarView(
                      controller: this._tabController,
                      children: <Widget>[
                        Lectures(lectures: this.lectures),
                        More()
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final TabController tabController;

  SectionHeaderDelegate({this.height = 50, this.tabController});

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).primaryColor,
      alignment: Alignment.centerLeft,
      child: Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            // Row(children: [
            // FlatButton(
            //   height: 50,
            //   minWidth: 100,
            //   child: Text("Lectures",
            //       style: Theme.of(context).textTheme.bodyText2),
            //   onPressed: () => {print("Lectures")},
            // ),
            // FlatButton(
            //   height: 50,
            //   minWidth: 100,
            //   child:
            //       Text("More", style: Theme.of(context).textTheme.bodyText2),
            //   onPressed: () => {print("More")},
            // ),
            // ]),
            Container(
              width: 200,
              child: TabBar(
                controller: tabController,
                tabs: [Tab(text: "Lectures"), Tab(text: "More")],
              ),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: InkWell(
                  child: Icon(Icons.download_outlined,
                      color: Theme.of(context).accentColor),
                  onTap: () => {print("download")}),
            ))
          ])),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}

class Lectures extends StatelessWidget {
  final List<Lecture> lectures;

  Lectures({Key key, this.lectures}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext ctx, index) => InkWell(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text((index + 1).toString(),
                        style: Theme.of(context).textTheme.headline3),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Row(
                    children: [
                      // if (this.lectures[index].isWatched)
                      //   Container(
                      //       padding: EdgeInsets.all(2),
                      //       margin: EdgeInsets.only(right: 5),
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(10),
                      //           color: Theme.of(context).accentColor),
                      //       child: Icon(
                      //         Icons.download_done_rounded,
                      //         size: 14,
                      //         color: Theme.of(context).cardColor,
                      //       )),
                      Text(this.lectures[index].title,
                          style: Theme.of(context).textTheme.headline3),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      // if (this.lectures[index].hasCaptions)
                      //   Container(
                      //     margin: EdgeInsets.only(right: 4),
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(4)),
                      //     child: Icon(
                      //       Icons.closed_caption_sharp,
                      //       size: 20,
                      //       color: Colors.grey,
                      //     ),
                      //   ),
                      Text('${this.lectures[index].time} mins',
                          style: Theme.of(context).textTheme.bodyText2),
                    ],
                  ),
                  trailing: IconButton(
                      icon: Icon(Icons.arrow_downward_outlined),
                      onPressed: () => {}),
                ),
                onTap: () => {}),
            childCount: this.lectures.length,
          ),
        )
      ],
    );
  }
}

class More extends StatelessWidget {
  const More({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [SliverFillRemaining()]);
  }
}
