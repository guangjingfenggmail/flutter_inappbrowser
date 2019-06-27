// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agreement_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgreementListModel _$AgreementListModelFromJson(Map<String, dynamic> json) {
  return AgreementListModel(
      json['errorCode'] as int,
      json['msg'] as String,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AgreementListModelToJson(AgreementListModel instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'msg': instance.msg,
      'data': instance.data
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      (json['list'] as List)
          ?.map((e) => e == null
              ? null
              : AgreementModel.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['nextCode'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) =>
    <String, dynamic>{'list': instance.list, 'nextCode': instance.nextCode};

AgreementModel _$AgreementModelFromJson(Map<String, dynamic> json) {
  return AgreementModel(json['name'] as String, json['presentId'] as String,
      json['title'] as String, json['url'] as String);
}

Map<String, dynamic> _$AgreementModelToJson(AgreementModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'presentId': instance.presentId,
      'title': instance.title,
      'url': instance.url
    };
