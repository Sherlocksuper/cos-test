import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../Cos/Cos.dart';
import 'state.dart';

class VideoTestLogic extends GetxController {
  final VideoTestState state = VideoTestState();
  final cos = Get.put(CosController());

  Future<void> choseVideo() async {
    ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickVideo(source: ImageSource.camera);
    state.videoPath = file!.path;

    state.controller = VideoPlayerController.file(
      File(state.videoPath),
    )..initialize().then((_) {
        state.controller.play();
        update();
      });
    update();
  }

  Future<void> uploadVideo() async {
    cos.createTask(state.videoPath);
  }
}
