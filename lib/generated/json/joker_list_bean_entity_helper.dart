import 'package:my_app/bean/joker_list_bean_entity.dart';

jokerListBeanEntityFromJson(JokerListBeanEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		data.data = (json['data'] as List).map((v) => JokerListBeanData().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> jokerListBeanEntityToJson(JokerListBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}

jokerListBeanDataFromJson(JokerListBeanData data, Map<String, dynamic> json) {
	if (json['content'] != null) {
		data.content = json['content'].toString();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime'].toString();
	}
	return data;
}

Map<String, dynamic> jokerListBeanDataToJson(JokerListBeanData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['content'] = entity.content;
	data['updateTime'] = entity.updateTime;
	return data;
}