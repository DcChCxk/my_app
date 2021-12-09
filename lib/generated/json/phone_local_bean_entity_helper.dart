import 'package:my_app/bean/phone_local_bean_entity.dart';

phoneLocalBeanEntityFromJson(PhoneLocalBeanEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		data.data = PhoneLocalBeanData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> phoneLocalBeanEntityToJson(PhoneLocalBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] = entity.data?.toJson();
	return data;
}

phoneLocalBeanDataFromJson(PhoneLocalBeanData data, Map<String, dynamic> json) {
	if (json['mobile'] != null) {
		data.mobile = json['mobile'].toString();
	}
	if (json['province'] != null) {
		data.province = json['province'].toString();
	}
	if (json['carrier'] != null) {
		data.carrier = json['carrier'].toString();
	}
	return data;
}

Map<String, dynamic> phoneLocalBeanDataToJson(PhoneLocalBeanData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['mobile'] = entity.mobile;
	data['province'] = entity.province;
	data['carrier'] = entity.carrier;
	return data;
}