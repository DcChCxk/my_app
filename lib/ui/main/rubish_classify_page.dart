import 'package:flutter/material.dart';
import 'package:my_app/base/net/api.dart';
import 'package:my_app/base/res/my_style.dart';
import 'package:my_app/base/utils/my_app_bar.dart';
import 'package:my_app/bean/rubbish_classify_bean_entity.dart';
import 'package:my_app/ui/get_word.dart';
import 'package:fluttertoast/fluttertoast.dart';

///垃圾分类
class RubbishClassifyPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => RubbishClassifyPageState();

}

class RubbishClassifyPageState extends State<RubbishClassifyPage>{

  TextEditingController _controller = new TextEditingController();
  FocusNode _node = new FocusNode();

  String name;

  RubbishClassifyBeanData rubbishBean;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: '垃圾分类查询',
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
            child: Image.asset('assets/main/rubbish_classify.jpg'),
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
                      labelText: '这是什么种类的垃圾：',
                      labelStyle: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 93, 93, 93)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextButton(onPressed: (){
                  name = _controller.text;
                  _node.unfocus();
                  _rubbishClassify();
                }, child: const Text('查询')),
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
    if(rubbishBean==null){
      return Container();
    }
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${rubbishBean.aim.goodsName}是： ',style: MyStyle.text_style_14_153,),
            Text(rubbishBean.aim.goodsType,style: MyStyle.text_style_14_51_bold,)
          ],
        ),
        const Text('相关垃圾：'),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: rubbishBean.recommendList.length,
          itemBuilder: (context,index){
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${rubbishBean.recommendList[index].goodsName}是： ',style: MyStyle.text_style_14_153,),
                Text(rubbishBean.recommendList[index].goodsType,style: MyStyle.text_style_14_51_bold,)
              ],
            );
          })
      ],
    );
  }

  Future _rubbishClassify() async{
    Api.getInstance(context, false).rubbishClassify(name).then((value) => {
      if(value.code==1){
        setState((){
          rubbishBean=value.data;
        })
      }else{
        Fluttertoast.showToast(msg: value.msg)
      }
    });
  }
}