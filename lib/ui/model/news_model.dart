import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/base/custom/load_state_layout.dart';
import 'package:my_app/base/net/api.dart';
import 'package:my_app/base/page/base_view_model.dart';
import 'package:my_app/base/res/constant.dart';
import 'package:my_app/bean/news_list_bean_entity.dart';

class NewsModel extends BaseViewModel {
  NewsModel(myContext) : super(myContext);

  List<NewsListBeanData> myList = [];

  // 下拉/上拉刷新控制器
  EasyRefreshController easyRefreshController = EasyRefreshController();

  dynamic page = 1; // 当前分页
  dynamic pageSize = 5; // 分页大小
  dynamic total = 0; // 总数

  load(int id,int type) {
    if (type == Constant.LOADING || type == Constant.PULL_TO_REFRESH) {
      page = 1;
      myList.clear();
      easyRefreshController.resetLoadState();
      easyRefreshController.finishLoad(noMore: false);
    } else if (type == Constant.PULL_ON_LOADING) {
        easyRefreshController.finishLoad(noMore: true);
      page += 1;
    }
    Api.getInstance(context, false)
        .getNewsList(id, page)
        .then((value) => {
      if (value.code == 1){
        loadState = LoadState.State_Success,
        myList.addAll(value.data),
      }
      else {
        loadState = LoadState.State_Error,
        Fluttertoast.showToast(msg: value.msg?? '暂无数据')
      },
      if (type == Constant.LOADING || type == Constant.PULL_TO_REFRESH){
        easyRefreshController.finishRefresh(success: true)
      } else if (type == Constant.PULL_ON_LOADING){
        easyRefreshController.finishLoad(success: true, noMore: false)
      },
      notifyListeners()
    });
  }
}
