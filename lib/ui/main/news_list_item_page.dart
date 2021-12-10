import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:my_app/base/custom/load_state_layout.dart';
import 'package:my_app/base/page/BaseProviderWidget.dart';
import 'package:my_app/base/page/BaseWidget.dart';
import 'package:my_app/base/res/constant.dart';
import 'package:my_app/base/res/dimens.dart';
import 'package:my_app/base/res/my_style.dart';
import 'package:my_app/base/utils/route_util.dart';
import 'package:my_app/bean/news_list_bean_entity.dart';
import 'package:my_app/ui/model/news_model.dart';

import 'news_detail_page.dart';

class NewsListItemPage extends BaseWidget {
  final int newsId;

  NewsListItemPage(this.newsId);

  @override
  BaseWidgetState<BaseWidget> getState() {
    return NewsListItemPageState();
  }
}

class NewsListItemPageState extends BaseWidgetState<NewsListItemPage> {

  NewsModel model;

  @override
  void dispose() {
    model.easyRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    model = NewsModel(context);
    return BaseProviderWidget<NewsModel>(
        model: model,
        onReady: (model) {
          model.load(widget.newsId, Constant.LOADING);
        },
        builder: (context, model, child) {
          return _listView(model);
        });
  }

  Widget _listView(NewsModel model) {
    return LoadStateLayout(
      state: model.loadState,
      emptyRetry: () {
        model.load(widget.newsId, Constant.LOADING);
        model.loadState = LoadState.State_Loading;
      },
      errorRetry: () {
        model.load(widget.newsId, Constant.LOADING);
        model.loadState = LoadState.State_Loading;
      }, //错误按钮点击过后进行重新加载
      successWidget: Center(child: _refresh(model)),
    );
  }

  Widget _refresh(NewsModel model) {
    return Container(
      child: EasyRefresh.custom(
        taskIndependence: true,
        enableControlFinishRefresh: false,
        enableControlFinishLoad: true,
        controller: model.easyRefreshController,
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: () async {
          await model.load(widget.newsId, Constant.PULL_TO_REFRESH);
        },
        onLoad: () async {
          await model.load(widget.newsId, Constant.PULL_ON_LOADING);
        },
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                // 内容
                return _itemView(model.myList[index]);
              },
              childCount: model.myList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemView(NewsListBeanData bean) {
    return Container(
      margin: EdgeInsets.only(
        top: MyDimens.getHeight(10),
        left: MyDimens.getWidth(16),
        right: MyDimens.getWidth(16),),
      child: Ink(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05),
                offset: Offset(0, 2), //阴影y轴偏移量
                blurRadius: 8, //阴影模糊程度
                spreadRadius: 0 //阴影扩散程度
            )
          ],
        ),
        child: InkWell(
          onTap: () {
            RouteUtil.startActivity(context, NewsDetailPage(bean.newsId));
          },
          child: Container(
            padding: EdgeInsets.only(
                top: MyDimens.getHeight(10),
                bottom: MyDimens.getHeight(10),
                left: MyDimens.getWidth(13),
                right: MyDimens.getWidth(12)),
            child: Row(
              children: [
                SizedBox(
                  width: bean.imgList==null?
                  MediaQuery.of(context).size.width-55:MediaQuery.of(context).size.width*4/5-55,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bean.title??'',
                        style: MyStyle.text_style_16_26_bold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      MyDimens.height(height: MyDimens.getHeight(5)),
                      Text(
                        bean.postTime??'',
                        style: MyStyle.text_style_12_153,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      MyDimens.height(height: MyDimens.getHeight(13)),
                      Text(bean.source??'',
                          style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
                bean.imgList==null?Container():
                SizedBox(
                  width: MediaQuery.of(context).size.width/5,
                  child: Image.network(bean.imgList[0]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
