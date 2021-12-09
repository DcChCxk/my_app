import 'package:flutter/material.dart';
import 'package:my_app/base/net/api.dart';
import 'package:my_app/base/res/dimens.dart';
import 'package:my_app/base/res/my_style.dart';
import 'package:my_app/base/utils/my_app_bar.dart';
import 'package:my_app/bean/daily_words_bean_entity.dart';
import 'package:my_app/bean/ip_bean_entity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/ui/get_word.dart';

class SelfIpPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>SelfIpPageState();
  
}

class SelfIpPageState extends State<SelfIpPage>{

  IpBeanData ip;
  DailyWordsBeanData word;

  @override
  void initState(){
    super.initState();
    _getIp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'IP查询',
        context: context,
      ),
      body: bodyWidget(),
      bottomNavigationBar: GetWord(),
    );
  }

  Widget bodyWidget(){
    if(ip==null){
      return Container();
    }
    return Container(
      padding: EdgeInsets.only(left: MyDimens.getWidth(16),right: MyDimens.getWidth(16),top: MyDimens.getHeight(20)),
      child: Column(
        children: [
          rowWidget('您的IP地址是: ', ip.ip),
          rowWidget('您所在的地方是: ', ip.province + ' ' + ip.city),
          Row(
            children: [
              Text('您所使用的网络是由"',style: MyStyle.text_style_14_153,),
              Text(ip.isp,style: MyStyle.text_style_14_51_bold,),
              Text('"提供的',style: MyStyle.text_style_14_153,),
            ],
          )
        ],
      ),
    );
  }

  Widget rowWidget(String s,String data){
    return Row(
      children: [
        Text(s,style: MyStyle.text_style_14_153,),
        Text(data,style: MyStyle.text_style_14_51_bold,)
      ],
    );
  }

  Future _getIp() async{
    Api.getInstance(context, true).getIp().then((value) =>{
      if(value.code==1){
        setState((){
          ip=value.data;
        })
      }else{
        Fluttertoast.showToast(msg: value.msg),
      }
    });
  }

}