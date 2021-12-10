import 'package:flutter/material.dart';
import 'package:my_app/base/res/dimens.dart';
import 'package:my_app/base/res/my_style.dart';
import 'package:my_app/base/utils/my_app_bar.dart';
import 'package:my_app/ui/get_word.dart';
import 'package:dio/dio.dart';

///天气查询
class WeatherQueryPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => WeatherQueryPageState();
  
}

class WeatherQueryPageState extends State<WeatherQueryPage>{

  TextEditingController _controller = new TextEditingController();
  FocusNode _node = new FocusNode();

  String add;

  Response res;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '天气查询',
        context: context,
      ),
      body:bodyWidget(),
      bottomNavigationBar: GetWord(),
    );
  }

  Widget bodyWidget(){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/main/weather_query.jpg'),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width-120,
                  child: TextFormField(
                    controller: _controller,
                    focusNode: _node,
                    decoration: const InputDecoration(
                      labelText: '请输入要查询的城市',
                      labelStyle: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 93, 93, 93)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextButton(onPressed: (){
                  _node.unfocus();
                  add=_controller.text;
                  _getHttp();
                }, child: const Text('查询')),
              ],
            ),
          ),
          weatherWidget(),
        ],
      ),
    );
  }

  Widget weatherWidget(){
    if(res==null){
      return Container();
    }
    if(res.data["code"]==0){
      return const Text('未找到对应城市，请检查后重试');
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: MyDimens.getWidth(30),horizontal: MyDimens.getHeight(20)),
      child: Column(
        children: [
          rowWidget('查询的城市为：   ', res.data["data"]["address"]),
          const SizedBox(height: 3,),
          rowWidget('现在的温度是：   ', res.data["data"]["temp"]),
          const SizedBox(height: 3,),
          rowWidget('现在的天气是：   ', res.data["data"]["weather"]),
          const SizedBox(height: 3,),
          Row(
            children: [
              rowWidget('风向为：  ', res.data["data"]["windDirection"]),
              const SizedBox(width: 20,),
              rowWidget('风力为：  ', res.data["data"]["windPower"])
            ],
          ),
          const SizedBox(height: 3,),
          rowWidget('空气湿度：   ', res.data["data"]["humidity"]),
          const SizedBox(height: 3,),
          rowWidget('最后更新时间：   ', res.data["data"]["reportTime"]),
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

  Future _getHttp() async {
    try{
      Response response = await Dio().get(
          'https://www.mxnzp.com/api/weather/current/$add?app_id=peqjipghrotemlrj&app_secret=YXhFT2draXhRbTF2a2t6V1JhR25Ydz09'
      );
      setState(() {
        res =response;
      });
      print(response);
      print(response.data["data"]["address"]);
    }catch(e){
      print(e);
    }
  }
}