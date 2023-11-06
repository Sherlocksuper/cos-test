import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'logic.dart';

class PhotoTestPage extends StatelessWidget {
  PhotoTestPage({Key? key}) : super(key: key);

  final logic = Get.put(PhotoTestLogic());
  final state = Get.find<PhotoTestLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhotoTestLogic>(builder: (context) {
      return Scaffold(
        //最中间有一个按钮，显示“上传图片”
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  //点击按钮后，执行上传图片的逻辑
                  logic.choseImage();
                },
                child: Text("上传图片"),
              ),
              //本地图片的路径
              Text(state.picPath),
              //根据路径显示图片
              state.picPath == "" ? Container() : Image.file(File(state.picPath)),
              //确定按钮
              TextButton(
                onPressed: () {
                  //点击按钮后，执行上传图片的逻辑
                  logic.uploadImage();
                  state.picPath = "";
                  logic.update();
                },
                child: Text("确定"),
              ),
            ],
          ),
        ),
      );
    });
  }
}
