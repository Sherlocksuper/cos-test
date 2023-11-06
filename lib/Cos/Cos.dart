import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tencentcloud_cos_sdk_plugin/cos.dart';
import 'package:tencentcloud_cos_sdk_plugin/cos_transfer_manger.dart';
import 'package:tencentcloud_cos_sdk_plugin/pigeon.dart';
import 'package:tencentcloud_cos_sdk_plugin/transfer_task.dart';

class CosController extends GetxController {
  String SECRET_ID = ""; //永久密钥 secretId
  String SECRET_KEY = ""; //永久密钥 secretKey
  String region = "";

  String bucket = ""; //对象在存储桶中的位置标识符，即称对象键
  String cosPath = "";

  late CosTransferManger transferManager;
  late TransferTask transferTask;

  @override
  void onInit() {
    initCos();
    super.onInit();
  }

  void initCos() {
    Cos().initWithPlainSecret(SECRET_ID, SECRET_KEY);
    //服务器格式
    CosXmlServiceConfig serviceConfig = CosXmlServiceConfig(
      region: region,
      isDebuggable: true,
      isHttps: true,
    );
    //注册默认服务器
    Cos().registerDefaultService(serviceConfig);

    //传输配置
    TransferConfig transferConfig = TransferConfig(
      forceSimpleUpload: false,
      enableVerification: true,
      divisionForUpload: 20097152,
      sliceSizeForUpload: 1048576,
    );
    //注册服务器之后才能使用
    Cos().registerDefaultTransferManger(serviceConfig, transferConfig);
    //以上是注册transfermanget
    transferManager = Cos().getDefaultTransferManger();
  }

  //若存在初始化分块上传的 UploadId，则赋值对应的 uploadId 值用于续传；否则，赋值 null
  String? _uploadId;

  successCallBack(result) {
    Get.snackbar("上传成功", "上传成功");
  }

  //上传失败回调
  failCallBack(clientException, serviceException) {
    Get.snackbar("上传失败", "上传失败");
  }

  //上传状态回调, 可以查看任务过程
  stateCallback(state) {
    // todo notify transfer state
  }

  //上传进度回调
  progressCallBack(complete, target) {
    // todo Do something to update progress...
  }

  //初始化分块完成回调
  initMultipleUploadCallback(String bucket, String cosKey, String uploadId) {
    //用于下次续传上传的 uploadId
    _uploadId = uploadId;
  }

  createTask(srcPath) async {
    if (transferManager == null) {
      initCos();
    }

    //根据srcPath判断后缀
    String suffix = srcPath.substring(srcPath.lastIndexOf(".") + 1);
    transferTask = await transferManager.upload(bucket, "$cosPath/${DateTime.now()}.$suffix",
        filePath: srcPath,
        uploadId: _uploadId,
        resultListener: ResultListener((success) => {Get.snackbar("上传成功", "上传成功")}, failCallBack),
        stateCallback: stateCallback,
        progressCallBack: progressCallBack,
        initMultipleUploadCallback: initMultipleUploadCallback);
  }
}
