import 'package:flutter/material.dart';

import 'package:flutter_toast_plugin_2019/flutter_toast_plugin_2019.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text("toast"),
            // 插件的使用跟其他库没有什么区别，直接调用即可
            onPressed: () => FlutterToastPlugin2019.toast(
                "Toast from Flutter", ToastDuration.short),
          ),
        ),
      ),
    );
  }
}
