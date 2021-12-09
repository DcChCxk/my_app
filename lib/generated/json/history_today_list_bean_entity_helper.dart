import 'package:my_app/bean/history_today_list_bean_entity.dart';

historyTodayListBeanEntityFromJson(HistoryTodayListBeanEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		data.data = (json['data'] as List).map((v) => HistoryTodayListBeanData().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> historyTodayListBeanEntityToJson(HistoryTodayListBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}

historyTodayListBeanDataFromJson(HistoryTodayListBeanData data, Map<String, dynamic> json) {
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['year'] != null) {
		data.year = json['year'].toString();
	}
	if (json['month'] != null) {
		data.month = json['month'] is String
				? int.tryParse(json['month'])
				: json['month'].toInt();
	}
	if (json['day'] != null) {
		data.day = json['day'] is String
				? int.tryParse(json['day'])
				: json['day'].toInt();
	}
	if (json['details'] != null) {
		data.details = json['details'].toString();
	}
	return data;
}

Map<String, dynamic> historyTodayListBeanDataToJson(HistoryTodayListBeanData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['picUrl'] = entity.picUrl;
	data['title'] = entity.title;
	data['year'] = entity.year;
	data['month'] = entity.month;
	data['day'] = entity.day;
	data['details'] = entity.details;
	return data;
}