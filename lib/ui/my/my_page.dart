import 'package:flutter/material.dart';

class MyPage extends StatefulWidget{
  const MyPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>MyPageState();
}

class MyPageState extends State<MyPage>{
  @override
  Widget build(BuildContext context) {
    return  const Center(
      child: Text('我的页面'),
    );
  }
}