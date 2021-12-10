import 'package:my_app/bean/news_detail_bean_entity.dart';

newsDetailBeanEntityFromJson(NewsDetailBeanEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		data.data = NewsDetailBeanData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> newsDetailBeanEntityToJson(NewsDetailBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] = entity.data?.toJson();
	return data;
}

newsDetailBeanDataFromJson(NewsDetailBeanData data, Map<String, dynamic> json) {
	if (json['images'] != null) {
		data.images = (json['images'] as List).map((v) => NewsDetailBeanDataImages().fromJson(v)).toList();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['content'] != null) {
		data.content = json['content'].toString();
	}
	if (json['source'] != null) {
		data.source = json['source'].toString();
	}
	if (json['ptime'] != null) {
		data.ptime = json['ptime'].toString();
	}
	if (json['docid'] != null) {
		data.docid = json['docid'].toString();
	}
	if (json['cover'] != null) {
		data.cover = json['cover'].toString();
	}
	return data;
}

Map<String, dynamic> newsDetailBeanDataToJson(NewsDetailBeanData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['images'] =  entity.images?.map((v) => v.toJson())?.toList();
	data['title'] = entity.title;
	data['content'] = entity.content;
	data['source'] = entity.source;
	data['ptime'] = entity.ptime;
	data['docid'] = entity.docid;
	data['cover'] = entity.cover;
	return data;
}

newsDetailBeanDataImagesFromJson(NewsDetailBeanDataImages data, Map<String, dynamic> json) {
	if (json['position'] != null) {
		data.position = json['position'].toString();
	}
	if (json['imgSrc'] != null) {
		data.imgSrc = json['imgSrc'].toString();
	}
	if (json['size'] != null) {
		data.size = json['size'].toString();
	}
	return data;
}

Map<String, dynamic> newsDetailBeanDataImagesToJson(NewsDetailBeanDataImages entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['position'] = entity.position;
	data['imgSrc'] = entity.imgSrc;
	data['size'] = entity.size;
	return data;
}