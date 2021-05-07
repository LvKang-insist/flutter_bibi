import 'package:flutter_bibi/generated/json/base/json_convert_content.dart';

class AEntity with JsonConvert<AEntity> {
	AData data;
	String message;
	int result;
}

class AData with JsonConvert<AData> {
	bool isforce;
	bool newVersion;
	String download;
	String size;
}
