import 'package:my_app/generated/json/base/json_convert_content.dart';

class JokerListBeanEntity with JsonConvert<JokerListBeanEntity> {
	int code;
	String msg;
	List<JokerListBeanData> data;
}

class JokerListBeanData with JsonConvert<JokerListBeanData> {
	String content;
	String updateTime;
}
