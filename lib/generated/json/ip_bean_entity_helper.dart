import 'package:my_app/bean/ip_bean_entity.dart';

ipBeanEntityFromJson(IpBeanEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		data.data = IpBeanData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> ipBeanEntityToJson(IpBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] = entity.data?.toJson();
	return data;
}

ipBeanDataFromJson(IpBeanData data, Map<String, dynamic> json) {
	if (json['ip'] != null) {
		data.ip = json['ip'].toString();
	}
	if (json['province'] != null) {
		data.province = json['province'].toString();
	}
	if (json['provinceId'] != null) {
		data.provinceId = json['provinceId'] is String
				? int.tryParse(json['provinceId'])
				: json['provinceId'].toInt();
	}
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['cityId'] != null) {
		data.cityId = json['cityId'] is String
				? int.tryParse(json['cityId'])
				: json['cityId'].toInt();
	}
	if (json['isp'] != null) {
		data.isp = json['isp'].toString();
	}
	if (json['desc'] != null) {
		data.desc = json['desc'].toString();
	}
	return data;
}

Map<String, dynamic> ipBeanDataToJson(IpBeanData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ip'] = entity.ip;
	data['province'] = entity.province;
	data['provinceId'] = entity.provinceId;
	data['city'] = entity.city;
	data['cityId'] = entity.cityId;
	data['isp'] = entity.isp;
	data['desc'] = entity.desc;
	return data;
}