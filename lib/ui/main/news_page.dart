import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/base/net/api.dart';
import 'package:my_app/base/res/dimens.dart';
import 'package:my_app/base/utils/TabSizeIndicator.dart';
import 'package:my_app/base/utils/my_app_bar.dart';
import 'package:my_app/bean/news_classify_bean_entity.dart';
import 'package:my_app/ui/main/news_list_item_page.dart';


///新闻页面
class NewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>NewsPageState();

}

class NewsPageState extends State<NewsPage> with TickerProviderStateMixin {
  TextStyle _textStyleTarBarText = TextStyle(fontSize: MyDimens.getSp(17));
  String title = '新闻';
  List<NewsClassifyBeanData> allClassificationList = [];
  TabController _tabController;
  List list=[];
  @override
  void initState() {
    super.initState();
    _allClassificationList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: title,
        context: context,
      ),
      body: _body(),
    );
  }

  Widget _body(){
    if (allClassificationList == null || allClassificationList.length == 0) {
      return Container();
    } else {
      return Column(
        children: [
          _tabView(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _buildPages(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      );
    }
  }

  ///tab栏
  Widget _tabView() {
    if (allClassificationList == null || allClassificationList.length == 0) {
      return Container();
    }
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: TabBar(
        //让TabBar中的tab紧凑排列
        isScrollable: true,
        //设置未选中时的字体颜色，tabs里面的字体样式优先级最高
        unselectedLabelColor: Color.fromRGBO(153, 153, 153, 1),
        //设置未选中时的字体样式，tabs里面的字体样式优先级最高
        unselectedLabelStyle: _textStyleTarBarText,
        //设置选中时的字体颜色，tabs里面的字体样式优先级最高
        labelColor: Color.fromRGBO(243, 39, 40, 1),
        labelStyle: _textStyleTarBarText,
        indicatorColor: Color.fromRGBO(243, 39, 40, 1),
        //设置下划线长度
        indicator: TabSizeIndicator(
            wantWidth: 20,
            borderSide: BorderSide(width: 2.0, color: Colors.red)),
        //选中下划线的高度，值越大高度越高，默认为2。0
        indicatorWeight: 1.9,
        labelPadding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
        dragStartBehavior: DragStartBehavior.start,
        controller: _tabController,
        tabs: allClassificationList.map((f) {
          return Center(
            child: new Text(
              f.typeName,
              style: _textStyleTarBarText,
            ),
          );
        }).toList(),
      ),
    );
  }

  //循环不同分类下的页面
  List<Widget> _buildPages() {
    List<Widget> pages = [];
    for (int i = 0; i < allClassificationList.length; i++) {
      Widget page =
      NewsListItemPage(allClassificationList[i].typeId);
      pages.add(page);
    }
    return pages;
  }

  //调用接口 查询分类信息
  Future<void> _allClassificationList() async {
    Api.getInstance(context, true).getNewsClassify().then((value) => {
      if (value.code != 1)
        {Fluttertoast.showToast(msg: value.msg ?? '')}
      else
        {
          setState(() {
            for(int i = 0;i<value.data.length;i++){
              if(value.data[i].typeId!=526&&value.data[i].typeId!=522){
                allClassificationList.add(value.data[i]);
              }
            }
            _tabController = TabController(
                length: allClassificationList.length, vsync: this);
          })
        }
    });
  }

}
