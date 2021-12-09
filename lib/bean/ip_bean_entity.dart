import 'package:my_app/generated/json/base/json_convert_content.dart';

class IpBeanEntity with JsonConvert<IpBeanEntity> {
	int code;
	String msg;
	IpBeanData data;
}

class IpBeanData with JsonConvert<IpBeanData> {
	String ip;
	String province;
	int provinceId;
	String city;
	int cityId;
	String isp;
	String desc;
}
