// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyEntityModel _$MyEntityModelFromJson(Map<String, dynamic> json) =>
    MyEntityModel(
      id: json['id'] as int,
      userName: json['userName'] as String,
      userAge: json['userAge'] as int,
    );

Map<String, dynamic> _$MyEntityModelToJson(MyEntityModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'userAge': instance.userAge,
      'id': instance.id,
    };
