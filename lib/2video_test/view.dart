import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'logic.dart';

class VideoTestPage extends StatelessWidget {
  VideoTestPage({Key? key}) : super(key: key);

  final logic = Get.put(VideoTestLogic());
  final state = Get.find<VideoTestLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoTestLogic>(builder: (context) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  logic.choseVideo();
                },
                child: const Text("上传视频"),
              ),
              Text(state.videoPath),
              state.videoPath == ""
                  ? Container()
                  : AspectRatio(
                      aspectRatio: state.controller.value.aspectRatio,
                      child: VideoPlayer(state.controller),
                    ),
              FloatingActionButton(
                onPressed: () {
                  state.controller.value.isPlaying ? state.controller.pause() : state.controller.play();
                  logic.update();
                },
                child: Icon(
                  state.controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
              TextButton(
                onPressed: () {
                  logic.uploadVideo();
                  Get.back();
                },
                child: const Text("确定"),
              ),
            ],
          ),
        ),
      );
    });
  }
}
