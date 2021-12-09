import 'package:flutter/material.dart';
import 'package:my_app/base/utils/will_pop_util.dart';

import 'main/main_page.dart';
import 'my/my_page.dart';

class HomePage extends StatefulWidget{
  int currentIndex;
  HomePage(this.currentIndex);

  @override
  State<StatefulWidget> createState() => HomePageState();
  
}

class HomePageState extends State<HomePage>{
  final List<BottomNavigationBarItem> _bottomItem = [
    const BottomNavigationBarItem(
      icon: Text('1'),
      label:'第一个'
    ),
    const BottomNavigationBarItem(
        icon: Text('2'),
        label:'第二个'
    ),
  ];

  final List _tabs = [MainPage(),MyPage()];


  Widget currentPage;

  @override
  Widget build(BuildContext context) {
    currentPage = _tabs[widget.currentIndex];
    return WillPopScope(
        onWillPop: () => WillPopUtils.willPop(context),
        child: Scaffold(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: widget.currentIndex,
              items: _bottomItem,
              onTap: (index) {
                setState(() {
                  widget.currentIndex = index;
                  currentPage = _tabs[widget.currentIndex];
                });
              },
              fixedColor: Colors.red,
            ),
            body: currentPage));
  }
}