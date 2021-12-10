import 'package:my_app/bean/dictionary_bean_entity.dart';

dictionaryBeanEntityFromJson(DictionaryBeanEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		data.data = (json['data'] as List).map((v) => DictionaryBeanData().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> dictionaryBeanEntityToJson(DictionaryBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}

dictionaryBeanDataFromJson(DictionaryBeanData data, Map<String, dynamic> json) {
	if (json['word'] != null) {
		data.word = json['word'].toString();
	}
	if (json['traditional'] != null) {
		data.traditional = json['traditional'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['radicals'] != null) {
		data.radicals = json['radicals'].toString();
	}
	if (json['explanation'] != null) {
		data.explanation = json['explanation'].toString();
	}
	if (json['strokes'] != null) {
		data.strokes = json['strokes'] is String
				? int.tryParse(json['strokes'])
				: json['strokes'].toInt();
	}
	return data;
}

Map<String, dynamic> dictionaryBeanDataToJson(DictionaryBeanData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['word'] = entity.word;
	data['traditional'] = entity.traditional;
	data['pinyin'] = entity.pinyin;
	data['radicals'] = entity.radicals;
	data['explanation'] = entity.explanation;
	data['strokes'] = entity.strokes;
	return data;
}