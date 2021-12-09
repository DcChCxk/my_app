import 'package:flutter/material.dart';
import 'package:my_app/base/net/api.dart';
import 'package:my_app/base/res/dimens.dart';
import 'package:my_app/base/res/my_style.dart';
import 'package:my_app/base/utils/my_app_bar.dart';
import 'package:my_app/base/utils/route_util.dart';
import 'package:my_app/bean/history_today_list_bean_entity.dart';
import 'package:my_app/ui/main/history_detail_page.dart';

class HistoryTodayPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HistoryTodayPageState();
}

class HistoryTodayPageState extends State<HistoryTodayPage> {
  List<HistoryTodayListBeanData> history = [];

  @override
  void initState() {
    super.initState();
    _getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '历史上的今天',
        context: context,
      ),
      body: bodyWidget(),
    );
  }

  Widget bodyWidget() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: history.length,
      itemBuilder: (context, index) {
        return item(index);
      },
    );
  }

  Widget item(index) {
    return Ink(
      child: InkWell(
        onTap: (){
          RouteUtil.startActivity(context, HistoryDetailPage(history[index]));
        },
        child: Container(
          padding: EdgeInsets.only(
              left: MyDimens.getWidth(16),
              right: MyDimens.getWidth(16),
              top: MyDimens.getHeight(10),
              bottom: MyDimens.getHeight(10)),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: MyDimens.getHeight(5),horizontal: MyDimens.getWidth(8)),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width:MediaQuery.of(context).size.width*4/5-64,
                      child: Text(history[index].title,overflow: TextOverflow.ellipsis,maxLines: 1,
                        style: TextStyle(color:Colors.black,fontSize: MyDimens.getSp(16),fontWeight: FontWeight.w500),),
                    ),
                    SizedBox(
                      width:MediaQuery.of(context).size.width/5,
                      child: Text(history[index].year +" / " +
                          history[index].month.toString() + " / " +
                          history[index].day.toString()),
                    )
                  ],
                ),
                Text(history[index].details ?? '',overflow: TextOverflow.ellipsis,maxLines: 2,
                  style: MyStyle.text_style_14_119,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _getHistory() async {
    Api.getInstance(context, true).getHistory(1).then((value) => {
          if (value.code == 1)
            {
              setState(() {
                history = value.data;
              })
            }
        });
  }
}
