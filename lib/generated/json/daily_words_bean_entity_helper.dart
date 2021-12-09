import 'package:my_app/bean/daily_words_bean_entity.dart';

dailyWordsBeanEntityFromJson(DailyWordsBeanEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		data.data = (json['data'] as List).map((v) => DailyWordsBeanData().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> dailyWordsBeanEntityToJson(DailyWordsBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}

dailyWordsBeanDataFromJson(DailyWordsBeanData data, Map<String, dynamic> json) {
	if (json['content'] != null) {
		data.content = json['content'].toString();
	}
	if (json['author'] != null) {
		data.author = json['author'].toString();
	}
	return data;
}

Map<String, dynamic> dailyWordsBeanDataToJson(DailyWordsBeanData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['content'] = entity.content;
	data['author'] = entity.author;
	return data;
}