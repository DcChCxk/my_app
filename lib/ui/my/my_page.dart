import 'package:flutter/material.dart';
import 'package:my_app/base/res/dimens.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/base/res/my_style.dart';
import 'package:my_app/base/utils/route_util.dart';
import 'package:my_app/ui/login/login_page.dart';

class MyPage extends StatefulWidget{
  const MyPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>MyPageState();
}

class MyPageState extends State<MyPage>{
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _headWidget(),
          _infoWidget(),
          _otherWidget(),
          _logoutWidget(),
        ],
      ),
    );
  }

  Widget _headWidget(){
    return Container(
      color: Colors.yellow,
      padding: EdgeInsets.only(top: MyDimens.getHeight(50),left: MyDimens.getWidth(16),bottom: MyDimens.getHeight(10)),
      height: 100,
      child: Row(
        children: [
          ClipOval(
            child: Image.asset('assets/my/head.jpg'),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5,),
              Text('一个靓仔',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
              SizedBox(height: 5,),
              Text('这个靓仔什么都没有说。。。')
            ],
          ),
          Expanded(child: Container()),
          Icon(Icons.navigate_next),
          SizedBox(width: 16,)
        ],
      ),
    );
  }

  Widget _infoWidget(){
    return Container(
      width: 500,
      height: 60,
      margin: EdgeInsets.only(top: MyDimens.getHeight(20),left: MyDimens.getWidth(16),right: MyDimens.getWidth(16),bottom: MyDimens.getHeight(10)),
      padding: EdgeInsets.symmetric(vertical: MyDimens.getHeight(10),horizontal: MyDimens.getWidth(16)),
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Center(
        child: Text('这是一个方块，不知道写啥',style: TextStyle(color: Colors.black),),
      ),
    );
  }

  Widget _otherWidget(){
    return Container(
      decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      margin: EdgeInsets.symmetric(vertical: MyDimens.getHeight(10),horizontal: MyDimens.getWidth(16)),
      child: Column(
        children: [
          _row(Icons.person, '更换密码'),
          _row(Icons.tapas_sharp, '忘记密码'),
          _row(Icons.accessible_outlined, '不知道啊'),
          _row(Icons.amp_stories_outlined, '也不知道'),
          _row(Icons.person, '想不出来'),
          _row(Icons.account_balance_outlined, '关于我们'),
          _row(Icons.account_circle, '假装联系人'),
          _row(Icons.share_outlined, '分享'),
        ],
      ),
    );
  }

  Widget _row(icon,data){
    return Ink(
      child: InkWell(
        onTap: (){
          Fluttertoast.showToast(msg: '别点了，没有写');
        },
        child: Container(
          padding: EdgeInsets.only(top: MyDimens.getHeight(10),left: MyDimens.getWidth(20),bottom: MyDimens.getHeight(10)),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 25,),
              Text(data,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
              Expanded(child: Container()),
              Icon(Icons.navigate_next),
              SizedBox(width: 20,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _logoutWidget(){
    return GestureDetector(
      onTap: (){
        _logout();
      },
      child: Container(
          width: 500,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        margin: EdgeInsets.symmetric(vertical: MyDimens.getHeight(10),horizontal: MyDimens.getWidth(16)),
        padding: EdgeInsets.only(top: MyDimens.getHeight(10),bottom: MyDimens.getHeight(10),),
        child: Center(
          child: Text('退出登录',style: TextStyle(color: Colors.black,fontSize: 16),),
        )
      ),
    );
  }

  //退出登录弹窗
  _logout() {
    return showDialog(context: context,
        builder: (context) {
          return AlertDialog(
              title: Row(children: <Widget>[
                Icon(Icons.outbond_outlined,color: Colors.greenAccent,size: 20,), SizedBox(width: 8),
                Text('是否要退出登录？',style: TextStyle(fontSize: 16,color: Colors.green),)
              ]),
              actions: <Widget>[
                TextButton(child: const Text('否',style: TextStyle(fontSize: 16,color: Colors.green)),
                    onPressed: () { Navigator.pop(context, true); _value = false; }),
                TextButton(child: const Text('是',style: TextStyle(fontSize: 16,color: Colors.green)),
                    onPressed: () { Navigator.pop(context, true); _value = true; })
              ]);}).then((val) {
      val = _value;
      if(val==true){
        RouteUtil.pushReplacement(context, LoginPage());
      }
    });
  }
}