
import 'package:flutter/cupertino.dart';
import 'package:my_app/base/net/api.dart';
import 'package:my_app/base/res/dimens.dart';
import 'package:my_app/bean/daily_words_bean_entity.dart';

class GetWord extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => GetWordState();
}

class GetWordState extends State<GetWord>{

  DailyWordsBeanData word;

  @override
  void initState(){
    super.initState();
    _getWord();
  }

  @override
  Widget build(BuildContext context) {
    if(word==null){
      return Container();
    }
    return Container(
      padding: EdgeInsets.only(left: MyDimens.getWidth(16),right: MyDimens.getWidth(16),bottom: MyDimens.getHeight(20),top: MyDimens.getHeight(20)),
      child: Text(word.content),
    );
  }

  Future _getWord() async{
    Api.getInstance(context, false).getDailyWord(1).then((value) => {
      if(value.code==1){
        setState((){
          word=value.data[0];
        })
      }
    });
  }


}