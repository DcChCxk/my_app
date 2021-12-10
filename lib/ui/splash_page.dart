import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/base/utils/route_util.dart';

import 'login/login_page.dart';

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
        _goMain();
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
                _goMain();
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
    RouteUtil.pushReplacement(context, LoginPage());
  }



}