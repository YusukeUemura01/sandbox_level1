// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Account _$$_AccountFromJson(Map<String, dynamic> json) => _$_Account(
      id: json['id'] as String,
      userName: json['userName'] as String,
      imagePath: json['imagePath'] as String,
      updateTime: const DateTimeTimestampConverter()
          .fromJson(json['updateTime'] as Timestamp),
    );

Map<String, dynamic> _$$_AccountToJson(_$_Account instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'imagePath': instance.imagePath,
      'updateTime':
          const DateTimeTimestampConverter().toJson(instance.updateTime),
    };
