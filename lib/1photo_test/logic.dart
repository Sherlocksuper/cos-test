import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tencentcloud_cos_sdk_plugin/cos.dart';

import '../Cos/Cos.dart';
import 'state.dart';

class PhotoTestLogic extends GetxController {
  final PhotoTestState state = PhotoTestState();

  final cosLogic = Get.find<CosController>();

  Future<void> choseImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      state.picPath = image.path;
      update();
    }
  }

  Future<void> uploadImage() async {
    if (state.picPath == "") {
      return;
    }
    await cosLogic.createTask(state.picPath);
  }
}
