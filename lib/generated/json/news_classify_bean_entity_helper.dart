import 'package:my_app/bean/news_classify_bean_entity.dart';

newsClassifyBeanEntityFromJson(NewsClassifyBeanEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		data.data = (json['data'] as List).map((v) => NewsClassifyBeanData().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> newsClassifyBeanEntityToJson(NewsClassifyBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}

newsClassifyBeanDataFromJson(NewsClassifyBeanData data, Map<String, dynamic> json) {
	if (json['typeId'] != null) {
		data.typeId = json['typeId'] is String
				? int.tryParse(json['typeId'])
				: json['typeId'].toInt();
	}
	if (json['typeName'] != null) {
		data.typeName = json['typeName'].toString();
	}
	return data;
}

Map<String, dynamic> newsClassifyBeanDataToJson(NewsClassifyBeanData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['typeId'] = entity.typeId;
	data['typeName'] = entity.typeName;
	return data;
}