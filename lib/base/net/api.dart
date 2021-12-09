
import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/base/res/constant.dart';


import 'api_service.dart';

class Api {
  ///初始化
  ///[context] BuildContext
  ///[isShowLoading] 是否显示Loading (true:显示 false:不显示)
  static ApiService getInstance(context, bool isShowLoading) {
    final dio = Dio();
    dio.options.headers["Header"] = "header";

    dio.options = BaseOptions(
        baseUrl: Constant.baseUrl,
        receiveTimeout: 66000,
        connectTimeout: 66000); // 设置超时时间等 ...
    //添加拦截器
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // 在发送请求之前做一些事情
      if (isShowLoading) {
        EasyLoading.show(status: '加载中');
      }

      //请求之前将token添加进去
      String app_id='peqjipghrotemlrj';
      String app_secret = 'YXhFT2draXhRbTF2a2t6V1JhR25Ydz09';
      options.headers['app_id'] = app_id;
      options.headers['app_secret'] = app_secret;
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      // 对响应数据做一些事情
      //TODO 调试时打印返回数据 正式上线时可注释掉
      print('request success--------------${response.data}');
      if (isShowLoading) {
        EasyLoading.dismiss();
      }

      // //如果登录失效,则跳转到登录页面
      // BaseJsonBeanEntity bean =
      //     baseJsonBeanEntityFromJson(BaseJsonBeanEntity(), response.data);
      // if (bean.code == 10000) {
      //   // SpUtil.remove(Constant.keyAppToken);
      //   RouteUtil.goLogin(context);
      // }
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      // 响应错误
      if (isShowLoading) {
        EasyLoading.dismiss();
      }
      print('request error---------------------$e');
      formatError(e);
      return handler.next(e); //continue
    }));
    return ApiService(dio);
  }

  static void formatError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectTimeout:
        {
          Fluttertoast.showToast(msg: '服务器连接超时');
          break;
        }
      case DioErrorType.sendTimeout:
        {
          Fluttertoast.showToast(msg: '服务器请求超时');
          break;
        }
      case DioErrorType.receiveTimeout:
        {
          Fluttertoast.showToast(msg: '服务器响应超时');
          break;
        }
      case DioErrorType.response:
        {
          Fluttertoast.showToast(msg: '服务器出现异常');
          break;
        }
      default:
        {
          Fluttertoast.showToast(msg: '服务器出现异常');
          break;
        }
    }
  }
}
