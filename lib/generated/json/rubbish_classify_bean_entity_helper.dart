import 'package:my_app/bean/rubbish_classify_bean_entity.dart';

rubbishClassifyBeanEntityFromJson(RubbishClassifyBeanEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		data.data = RubbishClassifyBeanData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> rubbishClassifyBeanEntityToJson(RubbishClassifyBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] = entity.data?.toJson();
	return data;
}

rubbishClassifyBeanDataFromJson(RubbishClassifyBeanData data, Map<String, dynamic> json) {
	if (json['aim'] != null) {
		data.aim = RubbishClassifyBeanDataAim().fromJson(json['aim']);
	}
	if (json['recommendList'] != null) {
		data.recommendList = (json['recommendList'] as List).map((v) => RubbishClassifyBeanDataRecommendList().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> rubbishClassifyBeanDataToJson(RubbishClassifyBeanData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['aim'] = entity.aim?.toJson();
	data['recommendList'] =  entity.recommendList?.map((v) => v.toJson())?.toList();
	return data;
}

rubbishClassifyBeanDataAimFromJson(RubbishClassifyBeanDataAim data, Map<String, dynamic> json) {
	if (json['goodsName'] != null) {
		data.goodsName = json['goodsName'].toString();
	}
	if (json['goodsType'] != null) {
		data.goodsType = json['goodsType'].toString();
	}
	return data;
}

Map<String, dynamic> rubbishClassifyBeanDataAimToJson(RubbishClassifyBeanDataAim entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['goodsName'] = entity.goodsName;
	data['goodsType'] = entity.goodsType;
	return data;
}

rubbishClassifyBeanDataRecommendListFromJson(RubbishClassifyBeanDataRecommendList data, Map<String, dynamic> json) {
	if (json['goodsName'] != null) {
		data.goodsName = json['goodsName'].toString();
	}
	if (json['goodsType'] != null) {
		data.goodsType = json['goodsType'].toString();
	}
	return data;
}

Map<String, dynamic> rubbishClassifyBeanDataRecommendListToJson(RubbishClassifyBeanDataRecommendList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['goodsName'] = entity.goodsName;
	data['goodsType'] = entity.goodsType;
	return data;
}