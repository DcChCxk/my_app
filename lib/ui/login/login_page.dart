import 'package:flutter/material.dart';
import 'package:my_app/base/res/dimens.dart';
import 'package:my_app/base/utils/route_util.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  //获取Key用来获取Form表单组件
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  String userName;
  String password;
  bool isShowPassWord = false;

  void showPassWord() {
    setState(() {
      isShowPassWord = !isShowPassWord;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.only(top: 100.0, bottom: 10.0),
                child: const Text(
                  'Hi',
                  style: TextStyle(
                      color: Color.fromARGB(255, 53, 53, 53), fontSize: 50.0),
                )),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: loginKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 240, 240, 240),
                                  width: 1.0))),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: '请输入用户名',
                          labelStyle: TextStyle(
                              fontSize: 15.0,
                              color: Color.fromARGB(255, 93, 93, 93)),
                          border: InputBorder.none,
                        ),
                        onSaved: (value) {
                          userName = value;
                        },
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 240, 240, 240),
                                  width: 1.0))),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: '请输入密码',
                            labelStyle: const TextStyle(
                                fontSize: 15.0,
                                color: Color.fromARGB(255, 93, 93, 93)),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                isShowPassWord
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color.fromARGB(255, 126, 126, 126),
                              ),
                              onPressed: showPassWord,
                            )),
                        obscureText: !isShowPassWord,
                        onSaved: (value) {
                          password = value;
                        },
                      ),
                    ),
                    Container(
                      height: 45.0,
                      margin: const EdgeInsets.only(top: 40.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Material(
                          borderRadius: const BorderRadius.all(Radius.circular(76)),
                          child: Ink(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(76)),
                                color: Color.fromARGB(255, 61, 203, 128)),
                            child: InkWell(
                              borderRadius: const BorderRadius.all(Radius.circular(76)),
                              onTap: () => login(),
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: MyDimens.getHeight(14), bottom: MyDimens.getHeight(13)),
                                child: Center(
                                  child: Text(
                                    '登录',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: MyDimens.getSp(14)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30.0),
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Ink(
                            child:InkWell(
                              onTap: (){
                                Fluttertoast.showToast(msg: '账号是"happy"');
                              },
                              child: const Text(
                                '注册账号',
                                style: TextStyle(
                                    fontSize: 13.0,
                                    color: Color.fromARGB(255, 53, 53, 53)),
                              ),
                            ),
                          ),
                          Ink(
                            child:InkWell(
                              onTap: (){
                                Fluttertoast.showToast(msg: '密码是"123456"');
                              },
                              child: const Text(
                                '忘记密码',
                                style: TextStyle(
                                    fontSize: 13.0,
                                    color: Color.fromARGB(255, 53, 53, 53)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void login() {
    //读取当前的Form状态
    var loginForm = loginKey.currentState;
    //验证Form表单
    if (loginForm.validate()) {
      loginForm.save();
      print('userName: ' + userName + ' password: ' + password);
      if (userName == 'happy' && password == '123456') {
        RouteUtil.goMain(context);
      }else if(userName==''){
        Fluttertoast.showToast(msg: '请输入账号！');
      }else if(password==''){
        Fluttertoast.showToast(msg: '请输入密码！');
      }else{
        Fluttertoast.showToast(msg: '账号密码错误!');
      }
    }
  }
}
