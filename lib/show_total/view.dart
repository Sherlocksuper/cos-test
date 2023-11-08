import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Cos/Cos.dart';
import 'logic.dart';

class Show_totalPage extends StatelessWidget {
  Show_totalPage({Key? key}) : super(key: key);

  final logic = Get.put(Show_totalLogic());
  final state = Get.find<Show_totalLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Show_totalLogic>(
      builder: (context) {
        return Scaffold(
          body: Center(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.contentsList.length,
              itemBuilder: (context, index) {
                var path = "https://mojie-1314462060.cos.ap-nanjing.myqcloud.com/${state.contentsList[index]!.key}";
                return ShowItem(path: path);
              },
            ),
          ),
        );
      },
    );
  }
}

class ShowItem extends StatelessWidget {
  var path;

  //取后缀

  ShowItem({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    var suffix = path.substring(path.lastIndexOf(".") + 1);
    print(suffix);

    return Wrap(
      direction: Axis.horizontal,
      children: [
        suffix == 'jpg'
            ? Image.network(
                path,
                width: 100,
                height: 100,
              )
            : Container(),
        Text(path)
      ],
    );
  }
}
