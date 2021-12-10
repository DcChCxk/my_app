import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:my_app/base/res/dimens.dart';
import 'package:my_app/base/res/my_style.dart';


//四种视图状态
enum LoadState { State_Success, State_Error, State_Loading, State_Empty }



///demo:
///
/*LoadState _layoutState = LoadState.State_Loading;
Widget _listView(BuildContext context){
  return LoadStateLayout(
    state: _layoutState,
    emptyRetry: (){
      setState(() {
        _layoutState = LoadState.State_Loading;
      });
    },
    errorRetry: () {
      setState(() {
        _layoutState = LoadState.State_Loading;
      });
    }, //错误按钮点击过后进行重新加载
    successWidget: Center(
        child: Text('1111111111')
    ),
  );
}*/



///加载动画
///根据不同状态来展示不同的视图
class LoadStateLayout extends StatefulWidget {

  final LoadState state; //页面状态
  final Widget successWidget;//成功视图
  final VoidCallback errorRetry; //错误事件处理
  final VoidCallback emptyRetry; //空数据事件处理

  LoadStateLayout(
      {Key key,
        this.state = LoadState.State_Loading,//默认为加载状态
        this.successWidget,
        this.errorRetry,
        this.emptyRetry
      })
      : super(key: key);

  @override
  _LoadStateLayoutState createState() => _LoadStateLayoutState();
}

class _LoadStateLayoutState extends State<LoadStateLayout> {

  @override
  Widget build(BuildContext context) {
    return Container(
      //宽高都充满屏幕剩余空间
      width: double.infinity,
      height: double.infinity,
      child: _buildWidget,
    );
  }

  ///根据不同状态来显示不同的视图
  Widget get _buildWidget {
    switch (widget.state) {
      case LoadState.State_Success:
        return widget.successWidget;
        break;
      case LoadState.State_Error:
        return _errorView;
        break;
      case LoadState.State_Loading:
        return _loadingView;
        break;
      case LoadState.State_Empty:
        return NoDataView(widget.emptyRetry);
        break;
      default:
        return null;
    }
  }

  ///加载中视图
  Widget get _loadingView {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MyDimens.getHeight(80),
              width: MyDimens.getWidth(80),
              child: Image.asset('assets/images/load/icon_loadding.gif'),
            ),
            Text('加载中...',style: TextStyle(
              fontSize: MyDimens.getSp(14),
              color: Color(0xFF666666),
            ),)
          ]
      )
    );
  }

  ///错误视图
  Widget get _errorView {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: InkWell(
          onTap: widget.errorRetry,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                // width: MyDimens.getWidth(207),
                // height: MyDimens.getHeight(133),
                child: Image.asset('assets/useful/erro.webp'),
              ),
              Text("什么内容也没有，请轻触重试!",style: MyStyle.text_style_14_170,),
            ],
          ),
        )
    );
  }

}


class NoDataView extends StatefulWidget {


  final VoidCallback emptyRetry; //无数据事件处理

  NoDataView(this.emptyRetry);

  @override
  _NoDataViewState createState() => _NoDataViewState();
}

class _NoDataViewState extends State<NoDataView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: InkWell(
          onTap: widget.emptyRetry,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MyDimens.getWidth(300),
                height: MyDimens.getHeight(200),
                child: Image.asset('assets/images/load/icon_load_empty.png'),
              ),
              Text('暂无相关数据,轻触重试~',style: TextStyle(color:Colors.black45,fontSize: MyDimens.getSp(24)),)
            ],
          ),
        )
    );
  }
}