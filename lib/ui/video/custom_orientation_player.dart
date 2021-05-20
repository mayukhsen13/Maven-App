import './controls.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'data_manager.dart';

class CustomOrientationPlayer extends StatefulWidget {
  final FlickManager flickManager;
  CustomOrientationPlayer(this.flickManager, {Key key}) : super(key: key);

  @override
  _CustomOrientationPlayerState createState() =>
      _CustomOrientationPlayerState();
}

class _CustomOrientationPlayerState extends State<CustomOrientationPlayer> {
  DataManager dataManager;

  @override
  void initState() {
    super.initState();
    // flickManager = FlickManager(
    //     videoPlayerController: VideoPlayerController.network(
    //       urls[0],
    //     ),
    //     onVideoEnd: () {
    //       dataManager.skipToNextVideo(Duration(seconds: 5));
    //     });

    dataManager = DataManager(flickManager: widget.flickManager, urls: []);
  }

  @override
  void dispose() {
    widget.flickManager.dispose();
    super.dispose();
  }

  skipToVideo(String url) {
    widget.flickManager.handleChangeVideo(VideoPlayerController.network(url));
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(widget.flickManager),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction == 0 && this.mounted) {
          widget.flickManager.flickControlManager.autoPause();
        } else if (visibility.visibleFraction == 1) {
          widget.flickManager.flickControlManager.autoResume();
        }
      },
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: FlickVideoPlayer(
              flickManager: widget.flickManager,
              preferredDeviceOrientationFullscreen: [
                DeviceOrientation.portraitUp,
                DeviceOrientation.landscapeLeft,
                DeviceOrientation.landscapeRight,
              ],
              flickVideoWithControls: FlickVideoWithControls(
                controls: CustomOrientationControls(dataManager: dataManager),
              ),
              flickVideoWithControlsFullscreen: FlickVideoWithControls(
                videoFit: BoxFit.fitWidth,
                controls: CustomOrientationControls(dataManager: dataManager),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
