import 'package:dio/dio.dart';
import 'package:my_app/bean/daily_words_bean_entity.dart';
import 'package:my_app/bean/dictionary_bean_entity.dart';
import 'package:my_app/bean/history_today_list_bean_entity.dart';
import 'package:my_app/bean/ip_bean_entity.dart';
import 'package:my_app/bean/joker_list_bean_entity.dart';
import 'package:my_app/bean/news_classify_bean_entity.dart';
import 'package:my_app/bean/news_detail_bean_entity.dart';
import 'package:my_app/bean/news_list_bean_entity.dart';
import 'package:my_app/bean/phone_local_bean_entity.dart';
import 'package:my_app/bean/rubbish_classify_bean_entity.dart';
import 'package:retrofit/retrofit.dart';

import 'api_service_impl.dart';

@RestApi(baseUrl: "https://www.mxnzp.com/api/")
abstract class ApiService {
  factory ApiService(Dio dio) => ApiServiceImpl(dio);

  ///获取每日一句
  @GET('/daily_word/recommend')
  Future<DailyWordsBeanEntity> getDailyWord(
      @Query('count') int count
      );

  ///查看自己的ip
  @GET('/ip/self')
  Future<IpBeanEntity> getIp();

  ///开心一下
  @GET('/jokes/list/random')
  Future<JokerListBeanEntity> haveFun();

  ///历史今日
  @GET('/history/today')
  Future<HistoryTodayListBeanEntity> getHistory(
      @Query('type') int type
      );

  ///号码归属地查询
  @GET('/mobile_location/aim_mobile')
  Future<PhoneLocalBeanEntity> phoneLocal(
      @Query('mobile') String mobile
      );

  ///垃圾分类
  @GET('/rubbish/type')
  Future<RubbishClassifyBeanEntity> rubbishClassify(
      @Query('name') String name
      );

  ///汉语字典
  @GET('/convert/dictionary')
  Future<DictionaryBeanEntity> dictionary(
      @Query('content') String content
      );

  ///新闻分类
  @GET('/news/types')
  Future<NewsClassifyBeanEntity> getNewsClassify();

  ///新闻列表
  @GET('/news/list')
  Future<NewsListBeanEntity> getNewsList(
      @Query('typeId') int typeId,
      @Query('page') int page
      );

  ///新闻详情
  @GET('/news/details')
  Future<NewsDetailBeanEntity> getNewsDetail(
      @Query('newsId') String newsId
      );
}
