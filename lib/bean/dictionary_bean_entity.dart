import 'package:my_app/generated/json/base/json_convert_content.dart';

class DictionaryBeanEntity with JsonConvert<DictionaryBeanEntity> {
	int code;
	String msg;
	List<DictionaryBeanData> data;
}

class DictionaryBeanData with JsonConvert<DictionaryBeanData> {
	String word;
	String traditional;
	String pinyin;
	String radicals;
	String explanation;
	int strokes;
}
