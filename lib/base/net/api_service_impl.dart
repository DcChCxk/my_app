
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
import 'package:my_app/generated/json/daily_words_bean_entity_helper.dart';
import 'package:my_app/generated/json/dictionary_bean_entity_helper.dart';
import 'package:my_app/generated/json/history_today_list_bean_entity_helper.dart';
import 'package:my_app/generated/json/ip_bean_entity_helper.dart';
import 'package:my_app/generated/json/joker_list_bean_entity_helper.dart';
import 'package:my_app/generated/json/news_classify_bean_entity_helper.dart';
import 'package:my_app/generated/json/news_detail_bean_entity_helper.dart';
import 'package:my_app/generated/json/news_list_bean_entity_helper.dart';
import 'package:my_app/generated/json/phone_local_bean_entity_helper.dart';
import 'package:my_app/generated/json/rubbish_classify_bean_entity_helper.dart';

import 'api_service.dart';

class ApiServiceImpl implements ApiService {
  ApiServiceImpl(this._dio) {
    ArgumentError.checkNotNull(_dio, 'dio');
  }

  final Dio _dio;

  @override
  Future<DailyWordsBeanEntity> getDailyWord(int count) async {
    final queryParameters = <String, dynamic>{
      'count': count,
    };

    final Response response = await _dio.request('/daily_word/recommend',
        queryParameters: queryParameters,
        options: Options(method: 'GET'));

    return dailyWordsBeanEntityFromJson(DailyWordsBeanEntity(), response.data);
  }

  @override
  Future<IpBeanEntity> getIp() async {
    final Response response = await _dio.request('/ip/self',
        options: Options(method: 'GET'));
    return ipBeanEntityFromJson(IpBeanEntity(), response.data);
  }

  @override
  Future<JokerListBeanEntity> haveFun() async {
    final Response response = await _dio.request('/jokes/list/random',
        options: Options(method: 'GET'));

    return jokerListBeanEntityFromJson(JokerListBeanEntity(), response.data);
  }

  @override
  Future<HistoryTodayListBeanEntity> getHistory(int type) async {
    final queryParameters = <String, dynamic>{
      'type': type,
    };

    final Response response = await _dio.request('/history/today',
        queryParameters: queryParameters,
        options: Options(method: 'GET'));

    return historyTodayListBeanEntityFromJson(HistoryTodayListBeanEntity(), response.data);
  }

  @override
  Future<PhoneLocalBeanEntity> phoneLocal(String mobile) async {
    final queryParameters = <String, dynamic>{
      'mobile': mobile,
    };

    final Response response = await _dio.request('/mobile_location/aim_mobile',
        queryParameters: queryParameters,
        options: Options(method: 'GET'));

    return phoneLocalBeanEntityFromJson(PhoneLocalBeanEntity(), response.data);
  }

  @override
  Future<RubbishClassifyBeanEntity> rubbishClassify(String name) async {
    final queryParameters = <String, dynamic>{
      'name': name,
    };

    final Response response = await _dio.request('/rubbish/type',
        queryParameters: queryParameters,
        options: Options(method: 'GET'));

    return rubbishClassifyBeanEntityFromJson(RubbishClassifyBeanEntity(), response.data);
  }

  @override
  Future<DictionaryBeanEntity> dictionary(String content) async {
    final queryParameters = <String, dynamic>{
      'content': content,
    };

    final Response response = await _dio.request('/convert/dictionary',
        queryParameters: queryParameters,
        options: Options(method: 'GET'));

    return dictionaryBeanEntityFromJson(DictionaryBeanEntity(), response.data);
  }

  @override
  Future<NewsClassifyBeanEntity> getNewsClassify() async {
    final Response response = await _dio.request('/news/types',
        options: Options(method: 'GET'));

    return newsClassifyBeanEntityFromJson(NewsClassifyBeanEntity(), response.data);
  }

  @override
  Future<NewsListBeanEntity> getNewsList(int typeId,int page) async {
    final queryParameters = <String, dynamic>{
      'typeId': typeId,
      'page': page,
    };

    final Response response = await _dio.request('/news/list',
        queryParameters: queryParameters,
        options: Options(method: 'GET'));

    return newsListBeanEntityFromJson(NewsListBeanEntity(), response.data);
  }

  @override
  Future<NewsDetailBeanEntity> getNewsDetail(String newsId) async {
    final queryParameters = <String, dynamic>{
      'newsId': newsId,
    };

    final Response response = await _dio.request('/news/details',
        queryParameters: queryParameters,
        options: Options(method: 'GET'));

    return newsDetailBeanEntityFromJson(NewsDetailBeanEntity(), response.data);
  }
}
