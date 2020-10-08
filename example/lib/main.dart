import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_baidu_map_plugin/flutter_baidu_map_plugin.dart';
import 'package:flutter_baidu_map_plugin_example/views/location-view.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  int _sumNumber = 0;

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }
  // 动态申请定位权限
  Future<bool> _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
    ].request();

    return statuses[Permission.location].isGranted &&
        statuses[Permission.storage].isGranted;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "location_view": (context) => LocationView(),
      },
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('地图插件')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text('定位信息'),
              subtitle: Text('点击开始后，百度地图实时推送经纬度信息'),
              leading: Icon(Icons.location_searching),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pushNamed(context, "location_view");
              },
            )
          ],
        ),
      ),
    );
  }
}
