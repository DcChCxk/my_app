import 'package:flutter/material.dart';
import 'package:my_app/base/net/api.dart';
import 'package:my_app/base/utils/my_app_bar.dart';
import 'package:my_app/bean/news_detail_bean_entity.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';

///新闻详情页面
class NewsDetailPage extends StatefulWidget{
  final String id;
  NewsDetailPage(this.id);
  @override
  State<StatefulWidget> createState() =>NewsDetailPageState();

}

class NewsDetailPageState extends State<NewsDetailPage>{

  NewsDetailBeanData detail;

  @override
  void initState(){
    super.initState();
    _getNewsDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '新闻详情',
        context: context,
      ),
      body: bodyWidget(),
    );
  }

  Widget bodyWidget(){
    if(detail==null){
      return Container();
    }
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(detail.title,style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
            Text(detail.ptime),
            Text('来源： ${detail.source}',style: TextStyle(color: Colors.black),),
            Html(data: detail.content,style: {
              'p': Style(
                color: Colors.black
              )
            },),
          ],
        ),
      ),
    );
  }

  Future _getNewsDetail() async{
    Api.getInstance(context, false).getNewsDetail(widget.id).then((value) => {
      if(value.code==1){
        setState((){
          detail = value.data;
        })
      }else{
        Fluttertoast.showToast(msg: value.msg)
      }
    });
  }
}