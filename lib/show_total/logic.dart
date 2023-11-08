import 'package:get/get.dart';

import '../Cos/Cos.dart';
import 'state.dart';

class Show_totalLogic extends GetxController {
  final Show_totalState state = Show_totalState();

  @override
  Future<void> onInit() async {
    state.contentsList = await Get.find<CosController>().showMyFile();
    update();
    super.onInit();
  }
}
