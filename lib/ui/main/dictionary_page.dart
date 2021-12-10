import 'package:flutter/material.dart';
import 'package:my_app/base/net/api.dart';
import 'package:my_app/base/res/dimens.dart';
import 'package:my_app/base/res/my_style.dart';
import 'package:my_app/base/utils/my_app_bar.dart';
import 'package:my_app/bean/dictionary_bean_entity.dart';
import 'package:my_app/ui/get_word.dart';
import 'package:fluttertoast/fluttertoast.dart';

///汉语字典
class DictionaryPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => DictionaryPageState();

}

class DictionaryPageState extends State<DictionaryPage>{

  TextEditingController _controller = new TextEditingController();
  FocusNode _node = new FocusNode();

  String content;

  DictionaryBeanData dictionary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: '汉语字典',
        context: context,
      ),
      body:bodyWidget(),
      bottomNavigationBar: GetWord(),
    );
  }

  Widget bodyWidget(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/main/dictionary_query.png'),
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
                    decoration: const InputDecoration(
                      labelText: '要查询的汉字：',
                      labelStyle: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 93, 93, 93)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextButton(onPressed: (){
                  content = _controller.text;
                  _node.unfocus();
                  _dictionaryQuery();
                }, child: const Text('查询')),
              ],
            ),
          ),
          // const SizedBox(height: 20,),
          resultWidget(),
        ],
      ),
    );
  }

  Widget resultWidget(){
    if(dictionary==null){
      return Container();
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MyDimens.getWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(dictionary.word,style: MyStyle.text_style_24_51_bold,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(dictionary.word,style: MyStyle.text_style_14_51_bold,),
              const SizedBox(width: 10,),
              Text("拼音: ",style: TextStyle(fontSize: MyDimens.getSp(14)),),
              Text(dictionary.pinyin,style: MyStyle.text_style_14_51_bold,),
              const SizedBox(width: 10,),
              Text("偏旁: ",style: TextStyle(fontSize: MyDimens.getSp(14)),),
              Text(dictionary.radicals,style: MyStyle.text_style_14_51_bold,)
            ],
          ),
          const SizedBox(height: 5,),
          Text(dictionary.explanation,style: MyStyle.text_style_14_51,)
        ],
      ),
    );
  }

  Future _dictionaryQuery() async{
    Api.getInstance(context, false).dictionary(content).then((value) => {
      if(value.code==1){
        setState((){
          dictionary=value.data[0];
        })
      }else{
        Fluttertoast.showToast(msg: value.msg)
      }
    });
  }
}