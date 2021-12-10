import 'package:my_app/generated/json/base/json_convert_content.dart';

class NewsListBeanEntity with JsonConvert<NewsListBeanEntity> {
	int code;
	String msg;
	List<NewsListBeanData> data;
}

class NewsListBeanData with JsonConvert<NewsListBeanData> {
	String title;
	List<String> imgList;
	String source;
	String newsId;
	String digest;
	String postTime;
	dynamic videoList;
}
