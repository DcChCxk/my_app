import 'package:my_app/generated/json/base/json_convert_content.dart';

class NewsDetailBeanEntity with JsonConvert<NewsDetailBeanEntity> {
	int code;
	String msg;
	NewsDetailBeanData data;
}

class NewsDetailBeanData with JsonConvert<NewsDetailBeanData> {
	List<NewsDetailBeanDataImages> images;
	String title;
	String content;
	String source;
	String ptime;
	String docid;
	String cover;
}

class NewsDetailBeanDataImages with JsonConvert<NewsDetailBeanDataImages> {
	String position;
	String imgSrc;
	String size;
}
