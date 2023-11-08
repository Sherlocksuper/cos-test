import 'package:costest/show_total/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '1photo_test/view.dart';
import '2video_test/view.dart';
import 'Cos/Cos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final test = Get.put(CosController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          //按钮，点击后跳转到 PhotoTestPage
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Get.to(() => PhotoTestPage());
              },
              child: const Text("跳转到上传图片页面"),
            ),
            //上传视频
            TextButton(
              onPressed: () {
                Get.to(() => VideoTestPage());
              },
              child: const Text("跳转到上传视频页面"),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => Show_totalPage());
              },
              child: const Text("展示我的所有文件"),
            ),
          ],
        ),
      ),
    );
  }
}
