import 'package:flutter/material.dart';
import 'package:my_app/base/net/api.dart';
import 'package:my_app/base/res/dimens.dart';
import 'package:my_app/base/res/my_style.dart';
import 'package:my_app/base/utils/my_app_bar.dart';
import 'package:my_app/bean/joker_list_bean_entity.dart';


///笑话列表
class JokerListPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => JokerListPageState();

}

class JokerListPageState extends State<JokerListPage>{

  List<JokerListBeanData> jokers = [];

  @override
  void initState(){
    super.initState();
    _getJokers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '开心一下',
        context: context,
      ),
      body: bodyWidget(),
    );
  }

  Widget bodyWidget(){
    return RefreshIndicator(
      onRefresh: _refresh,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: jokers.length,
          itemBuilder: (context,index){
            return item(index);
          }),
    );
  }

  Widget item(int index){
    return Container(
      padding: EdgeInsets.only(left: MyDimens.getWidth(16),right: MyDimens.getWidth(16),top: MyDimens.getHeight(10),bottom: MyDimens.getHeight(10)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: MyDimens.getHeight(5),horizontal: MyDimens.getWidth(8)),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(jokers[index].content,style: MyStyle.text_style_14_153,),
      ),
    );
  }

  Future _getJokers() async{
    Api.getInstance(context, false).haveFun().then((value) => {
      if(value.code==1){
        setState((){
          jokers = value.data;
        })
      }
    });
  }

  Future _refresh() async{
    jokers.clear();
    _getJokers();
  }

}