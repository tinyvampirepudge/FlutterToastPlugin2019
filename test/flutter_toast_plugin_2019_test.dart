import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_toast_plugin_2019/flutter_toast_plugin_2019.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_toast_plugin_2019');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterToastPlugin2019.platformVersion, '42');
  });
}
