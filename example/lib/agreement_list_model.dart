import 'package:json_annotation/json_annotation.dart';

part 'agreement_list_model.g.dart';


@JsonSerializable()
class AgreementListModel extends Object  {

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  Data data;

  AgreementListModel(this.errorCode,this.msg,this.data,);

  factory AgreementListModel.fromJson(Map<String, dynamic> srcJson) => _$AgreementListModelFromJson(srcJson);

}


@JsonSerializable()
class Data extends Object  {

  @JsonKey(name: 'list')
  List<AgreementModel> list;

  @JsonKey(name: 'nextCode')
  String nextCode;

  Data(this.list,this.nextCode,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

}


@JsonSerializable()
class AgreementModel extends Object  {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'presentId')
  String presentId;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  AgreementModel(this.name,this.presentId,this.title,this.url,);

  factory AgreementModel.fromJson(Map<String, dynamic> srcJson) => _$AgreementModelFromJson(srcJson);

}


