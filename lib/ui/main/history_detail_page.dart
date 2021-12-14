import 'package:flutter/material.dart';
import 'package:my_app/base/res/dimens.dart';
import 'package:my_app/base/res/my_style.dart';
import 'package:my_app/base/utils/my_app_bar.dart';
import 'package:my_app/bean/history_today_list_bean_entity.dart';
import 'package:my_app/generated/l10n.dart';

///历史上的今天详情
class HistoryDetailPage extends StatefulWidget {
  HistoryTodayListBeanData bean;
  HistoryDetailPage(this.bean);
  @override
  State<StatefulWidget> createState() => HistoryDetailPageState();
}

class HistoryDetailPageState extends State<HistoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).detail),
        // context: context,
      ),
      body: bodyWidget(),
    );
  }

  Widget bodyWidget() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
          left: MyDimens.getWidth(20),
          right: MyDimens.getWidth(20),
          top: MyDimens.getHeight(15),
          bottom: MyDimens.getHeight(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 4 / 5 - 60,
                child: Text(
                  widget.bean.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: MyStyle.text_style_16_26_bold,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 5+10,
                child: Text(widget.bean.year +
                    " / " +
                    widget.bean.month.toString() +
                    " / " +
                    widget.bean.day.toString()),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.bean.details ?? '',
            style: TextStyle(fontSize: 14,color: Colors.black,height: 1.8),
          ),
        ],
      ),
    );
  }
}
