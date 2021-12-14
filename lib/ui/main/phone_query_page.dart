import 'package:flutter/material.dart';
import 'package:my_app/base/net/api.dart';
import 'package:my_app/base/res/dimens.dart';
import 'package:my_app/base/res/my_style.dart';
import 'package:my_app/base/utils/my_app_bar.dart';
import 'package:my_app/bean/phone_local_bean_entity.dart';
import 'package:my_app/generated/l10n.dart';
import 'package:my_app/ui/get_word.dart';
import 'package:dio/dio.dart';

///手机归属地查询
class PhoneQueryPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => PhoneQueryPageState();

}

class PhoneQueryPageState extends State<PhoneQueryPage>{

  TextEditingController _controller = new TextEditingController();
  FocusNode _node = new FocusNode();

  String phone;

  PhoneLocalBeanData phoneBean;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).phone_local),
        // context: context,
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
            child: Image.asset('assets/main/phone_query.jpg'),
          ),
          const SizedBox(height: 20,),
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
                    decoration: InputDecoration(
                      labelText: S.of(context).phone_local,
                      labelStyle: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 93, 93, 93)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextButton(onPressed: (){
                  phone = _controller.text;
                  _node.unfocus();
                  _phoneLocal();
                }, child:Text(S.of(context).query)),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          resultWidget(),
        ],
      ),
    );
  }

  Widget resultWidget(){
    if(phoneBean==null){
      return Container();
    }
    return phoneBean.carrier==''?
    Text(S.of(context).right_phone,style: MyStyle.text_style_14_255_118,):
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).phone_belong,style: MyStyle.text_style_14_153,),
        Text(phoneBean.carrier,style: MyStyle.text_style_14_51_bold,)
      ],
    );
  }

  Future _phoneLocal() async{
    Api.getInstance(context, false).phoneLocal(phone).then((value) => {
      if(value.code==1){
        setState((){
          phoneBean=value.data;
        })
      }
    });
  }
}