import 'dart:io';

import 'package:video_player/video_player.dart';

class VideoTestState {
  VideoTestState() {
    ///Initialize variables
  }

  VideoPlayerController controller = VideoPlayerController.file(File(""));

  String videoPath = "";
}
