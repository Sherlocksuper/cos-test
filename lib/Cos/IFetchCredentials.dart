import 'dart:convert';
import 'dart:io';

import 'package:tencentcloud_cos_sdk_plugin/fetch_credentials.dart';
import 'package:tencentcloud_cos_sdk_plugin/pigeon.dart';

class FetchCredentials implements IFetchCredentials {
  @override
  Future<SessionQCloudCredentials> fetchSessionCredentials() async {
    var httpClient = HttpClient();
    try {
      var stsUrl = "http://stsservice.con/sts";
      var request = await httpClient.getUrl(Uri.parse(stsUrl));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        print(json);

        // 然后解析响应，获取临时密钥信息
        var data = jsonDecode(json);

        return SessionQCloudCredentials(
            secretId: data['credentials']['tmpSecretId'],
            secretKey: data['credentials']['tmpSecretKey'],
            token: data['credentials']['sessionToken'],
            startTime: data['startTime'],
            expiredTime: data['expiredTime']);
      } else {
        throw ArgumentError();
      }
    } catch (e) {
      print(e);
      throw ArgumentError();
    }
  }
}
