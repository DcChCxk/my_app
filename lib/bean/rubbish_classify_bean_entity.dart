import 'package:my_app/generated/json/base/json_convert_content.dart';

class RubbishClassifyBeanEntity with JsonConvert<RubbishClassifyBeanEntity> {
	int code;
	String msg;
	RubbishClassifyBeanData data;
}

class RubbishClassifyBeanData with JsonConvert<RubbishClassifyBeanData> {
	RubbishClassifyBeanDataAim aim;
	List<RubbishClassifyBeanDataRecommendList> recommendList;
}

class RubbishClassifyBeanDataAim with JsonConvert<RubbishClassifyBeanDataAim> {
	String goodsName;
	String goodsType;
}

class RubbishClassifyBeanDataRecommendList with JsonConvert<RubbishClassifyBeanDataRecommendList> {
	String goodsName;
	String goodsType;
}
