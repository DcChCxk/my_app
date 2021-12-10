import 'package:my_app/generated/json/base/json_convert_content.dart';

class NewsClassifyBeanEntity with JsonConvert<NewsClassifyBeanEntity> {
	int code;
	String msg;
	List<NewsClassifyBeanData> data;
}

class NewsClassifyBeanData with JsonConvert<NewsClassifyBeanData> {
	int typeId;
	String typeName;
}
