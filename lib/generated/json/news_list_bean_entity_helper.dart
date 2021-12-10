import 'package:my_app/bean/news_list_bean_entity.dart';

newsListBeanEntityFromJson(NewsListBeanEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		data.data = (json['data'] as List).map((v) => NewsListBeanData().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> newsListBeanEntityToJson(NewsListBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}

newsListBeanDataFromJson(NewsListBeanData data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['imgList'] != null) {
		data.imgList = (json['imgList'] as List).map((v) => v.toString()).toList().cast<String>();
	}
	if (json['source'] != null) {
		data.source = json['source'].toString();
	}
	if (json['newsId'] != null) {
		data.newsId = json['newsId'].toString();
	}
	if (json['digest'] != null) {
		data.digest = json['digest'].toString();
	}
	if (json['postTime'] != null) {
		data.postTime = json['postTime'].toString();
	}
	if (json['videoList'] != null) {
		data.videoList = json['videoList'];
	}
	return data;
}

Map<String, dynamic> newsListBeanDataToJson(NewsListBeanData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['imgList'] = entity.imgList;
	data['source'] = entity.source;
	data['newsId'] = entity.newsId;
	data['digest'] = entity.digest;
	data['postTime'] = entity.postTime;
	data['videoList'] = entity.videoList;
	return data;
}