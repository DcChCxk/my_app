
import 'package:dio/dio.dart';
import 'package:my_app/bean/daily_words_bean_entity.dart';
import 'package:my_app/bean/history_today_list_bean_entity.dart';
import 'package:my_app/bean/ip_bean_entity.dart';
import 'package:my_app/bean/joker_list_bean_entity.dart';
import 'package:my_app/bean/phone_local_bean_entity.dart';
import 'package:my_app/generated/json/daily_words_bean_entity_helper.dart';
import 'package:my_app/generated/json/history_today_list_bean_entity_helper.dart';
import 'package:my_app/generated/json/ip_bean_entity_helper.dart';
import 'package:my_app/generated/json/joker_list_bean_entity_helper.dart';
import 'package:my_app/generated/json/phone_local_bean_entity_helper.dart';

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

}
