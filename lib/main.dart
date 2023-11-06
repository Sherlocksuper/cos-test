import 'package:costest/photo_test/logic.dart';
import 'package:costest/photo_test/view.dart';
import 'package:costest/video_test/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Cos/Cos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void initState() {}

  @override
  Widget build(BuildContext context) {
    initState();
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //按钮，点击后跳转到 PhotoTestPage
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Get.to(() => PhotoTestPage());
            },
            child: Text("跳转到上传图片页面"),
          ),
          //上传视频
          TextButton(
            onPressed: () {
              Get.to(() => VideoTestPage());
            },
            child: Text("跳转到上传视频页面"),
          ),
        ],
      ),
    );
  }
}
