import 'package:flutter/material.dart';
import 'package:my_app/base/page/current_locale.dart';
import 'package:my_app/base/page/theme_model.dart';
import 'package:my_app/base/res/dimens.dart';
import 'package:my_app/base/utils/app_theme.dart';
import 'package:my_app/base/utils/route_util.dart';
import 'package:my_app/generated/l10n.dart';
import 'package:my_app/ui/login/login_page.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      color: Color(AppTheme.mainColor["primaryColorLight"]),
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
              SizedBox(height: 3,),
              Text('一个靓仔',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
              SizedBox(height: 3,),
              Text('这个靓仔什么都没有说。。。')
            ],
          ),
          Expanded(child: Container()),
          Icon(Icons.navigate_next,color: Colors.black,),
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
          _row(Icons.person, S.of(context).change_password),
          _row(Icons.tapas_sharp, S.of(context).forget_password),
          _row(Icons.accessible_outlined, '不知道啊'),
          _row(Icons.amp_stories_outlined, '也不知道'),
          _row(Icons.person, '想不出来'),
          Ink(
            child: InkWell(
              onTap: ()async {
                int i = await showDialog<int>(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        title: Text(S.of(context).change_theme),
                        children: <Widget>[
                          SimpleDialogOption(
                            onPressed: () {
                              // 返回1
                              Navigator.pop(context, 1);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Text(S.of(context).blue),
                            ),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              // 返回2
                              Navigator.pop(context, 2);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Text(S.of(context).purple),
                            ),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              // 返回2
                              Navigator.pop(context, 3);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Text(S.of(context).pink),
                            ),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              // 返回2
                              Navigator.pop(context, 4);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Text(S.of(context).yellow),
                            ),
                          ),
                        ],
                      );
                    });
                if (i != null) {
                  if(i==1)
                  {
                    Provider.of<ThemeModel>(context,listen: false).setTheme('blue');

                  }
                  else if(i==2)
                  {
                    Provider.of<ThemeModel>(context,listen: false).setTheme('purple');
                  }
                  else if(i==3)
                  {
                    Provider.of<ThemeModel>(context,listen: false).setTheme('pink');
                  }
                  else if(i==4)
                  {
                    Provider.of<ThemeModel>(context,listen: false).setTheme('yellow');
                  }
                }
              },
              child: Container(
                padding: EdgeInsets.only(top: MyDimens.getHeight(10),left: MyDimens.getWidth(20),bottom: MyDimens.getHeight(10)),
                child: Row(
                  children: [
                    Icon(Icons.source),
                    SizedBox(width: 25,),
                    Text(S.of(context).change_theme,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
                    Expanded(child: Container()),
                    Icon(Icons.navigate_next),
                    SizedBox(width: 20,)
                  ],
                ),
              ),
            ),
          ),
          _row(Icons.account_balance_outlined, S.of(context).about_us),
          Ink(
            child: InkWell(
              onTap: ()async
              {
                int i = await showDialog<int>(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        title: Text(S.of(context).choose_language),
                        children: <Widget>[
                          SimpleDialogOption(
                            onPressed: () {
                              // 返回1
                              Navigator.pop(context, 1);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text(S.of(context).chinese),
                            ),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              // 返回2
                              Navigator.pop(context, 2);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text(S.of(context).english),
                            ),
                          ),
                        ],
                      );
                    });
                if (i != null) {
                  if(i==1)
                  {
                    Provider.of<CurrentLocale>(context,listen: false).setLocale(const Locale('zh', "CH"));//更改语言
                  }
                  else
                  {
                    Provider.of<CurrentLocale>(context,listen: false).setLocale(const Locale('en', "US"));
                  }

                }
              },
              child: Container(
                padding: EdgeInsets.only(top: MyDimens.getHeight(10),left: MyDimens.getWidth(20),bottom: MyDimens.getHeight(10)),
                child: Row(
                  children: [
                    Icon(Icons.vpn_lock_sharp),
                    SizedBox(width: 25,),
                    Text(S.of(context).choose_language,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
                    Expanded(child: Container()),
                    Icon(Icons.navigate_next),
                    SizedBox(width: 20,)
                  ],
                ),
              ),
            ),
          ),
          _row(Icons.share_outlined, S.of(context).share),
        ],
      ),
    );
  }

  Widget _row(icon,data){
    return Ink(
      child: InkWell(
        onTap: () {
          Fluttertoast.showToast(msg: S.of(context).no_finish);
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
          child: Text(S.of(context).logout,style: TextStyle(color: Colors.black,fontSize: 16),),
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
                Text(S.of(context).whether_logout,style: TextStyle(fontSize: 16,color: Colors.green),)
              ]),
              actions: <Widget>[
                TextButton(child: Text(S.of(context).no,style: TextStyle(fontSize: 16,color: Colors.green)),
                    onPressed: () { Navigator.pop(context, true); _value = false; }),
                TextButton(child: Text(S.of(context).yes,style: TextStyle(fontSize: 16,color: Colors.green)),
                    onPressed: () { Navigator.pop(context, true); _value = true; })
              ]);}).then((val) {
      val = _value;
      if(val==true){
        RouteUtil.pushReplacement(context, LoginPage());
      }
    });
  }
}