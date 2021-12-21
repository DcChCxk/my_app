import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/base/utils/route_util.dart';
import 'package:permission_handler/permission_handler.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  int _count = 3;
  TimerUtil _timerUtil;

  void _doCountDown() {
    _timerUtil = TimerUtil(mTotalTime: _count * 1000);
    _timerUtil.setOnTimerTickCallback((tick) {
      double _tick =  tick / 1000;
      setState(() {
        _count = _tick.toInt();
      });
      if (_tick == 0){
        requestPermission();
      }
    });
    _timerUtil.startCountDown();
  }

  @override
  void initState() {
    super.initState();
    _doCountDown();
  }

  @override
  void dispose() {
    _timerUtil?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          _buildSplashBg(),
          Container(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                requestPermission();
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Text(
                  _count.toString(),
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
                decoration: BoxDecoration(
                    color: const Color(0x66000000),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border: Border.all(width: 0.33, color: const Color(0xffe5e5e5))
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSplashBg() {
    return Image.asset(
      'assets/guide/loading.webp',
      width: double.infinity,
      fit: BoxFit.fill,
      height: double.infinity,
    );
  }

  void _goMain() {
    RouteUtil.pushReplacement(context,HomePage(0));
  }

  //动态申请权限
  void requestPermission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      //权限未获得,开始请求权限
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
      if (statuses[Permission.storage] == PermissionStatus.granted) {
        //存储权限获取
        _goMain();
      } else if (statuses[Permission.storage] == PermissionStatus.denied) {
        //存储权限被拒绝
      }
    } else {
      //权限已获得
      _goMain();
    }
  }
}