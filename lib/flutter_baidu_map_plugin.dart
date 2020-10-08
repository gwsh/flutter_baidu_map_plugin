import 'dart:async';

import 'package:flutter/services.dart';

class FlutterBaiduMapPlugin {
  static const MethodChannel _channel =
      const MethodChannel('flutter_baidu_map_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<int> addFunction(int num) async {
    final int _result =
        await _channel.invokeMethod('addFunction', {"num": num});
    return _result;
  }
}
