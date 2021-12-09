import 'package:my_app/generated/json/base/json_convert_content.dart';

class PhoneLocalBeanEntity with JsonConvert<PhoneLocalBeanEntity> {
	int code;
	String msg;
	PhoneLocalBeanData data;
}

class PhoneLocalBeanData with JsonConvert<PhoneLocalBeanData> {
	String mobile;
	String province;
	String carrier;
}
