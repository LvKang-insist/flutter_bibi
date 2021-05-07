import 'package:flutter_bibi/http/a_entity.dart';

aEntityFromJson(AEntity data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = AData().fromJson(json['data']);
	}
	if (json['message'] != null) {
		data.message = json['message'].toString();
	}
	if (json['result'] != null) {
		data.result = json['result'] is String
				? int.tryParse(json['result'])
				: json['result'].toInt();
	}
	return data;
}

Map<String, dynamic> aEntityToJson(AEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['data'] = entity.data?.toJson();
	data['message'] = entity.message;
	data['result'] = entity.result;
	return data;
}

aDataFromJson(AData data, Map<String, dynamic> json) {
	if (json['isforce'] != null) {
		data.isforce = json['isforce'];
	}
	if (json['newVersion'] != null) {
		data.newVersion = json['newVersion'];
	}
	if (json['download'] != null) {
		data.download = json['download'].toString();
	}
	if (json['size'] != null) {
		data.size = json['size'].toString();
	}
	return data;
}

Map<String, dynamic> aDataToJson(AData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['isforce'] = entity.isforce;
	data['newVersion'] = entity.newVersion;
	data['download'] = entity.download;
	data['size'] = entity.size;
	return data;
}