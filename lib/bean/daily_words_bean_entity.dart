import 'package:my_app/generated/json/base/json_convert_content.dart';

class DailyWordsBeanEntity with JsonConvert<DailyWordsBeanEntity> {
	int code;
	String msg;
	List<DailyWordsBeanData> data;
}

class DailyWordsBeanData with JsonConvert<DailyWordsBeanData> {
	String content;
	String author;
}
