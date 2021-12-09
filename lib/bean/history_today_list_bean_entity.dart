import 'package:my_app/generated/json/base/json_convert_content.dart';

class HistoryTodayListBeanEntity with JsonConvert<HistoryTodayListBeanEntity> {
	int code;
	String msg;
	List<HistoryTodayListBeanData> data;
}

class HistoryTodayListBeanData with JsonConvert<HistoryTodayListBeanData> {
	String picUrl;
	String title;
	String year;
	int month;
	int day;
	String details;
}
