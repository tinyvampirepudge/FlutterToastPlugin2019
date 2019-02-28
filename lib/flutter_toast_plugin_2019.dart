import 'dart:async';

import 'package:flutter/services.dart';

enum ToastDuration { short, long }

class FlutterToastPlugin2019 {
  // 这里的名字要跟Android端的对应
  static const MethodChannel _channel = const MethodChannel(
      'com.tinytongtong.flutter_toast_plugin_2019/flutter_toast_plugin_2019');

  static Future<bool> toast(String msg, ToastDuration duration) async {
    var argument = {
      'content': msg,
      'duration': duration.toString(),
    };
    // 本地方法是一个异步调用。
    // 'toast'对应我们Android代码的onMethodCall方法里面处理的方法名
    var success = await _channel.invokeMethod('toast', argument);
    return success;
  }
}
