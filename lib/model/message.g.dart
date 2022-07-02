// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      content: json['content'] as String,
      sendAccountID: json['sendAccountID'] as String,
      sendTime: const DateTimeTimestampConverter()
          .fromJson(json['sendTime'] as Timestamp),
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'content': instance.content,
      'sendAccountID': instance.sendAccountID,
      'sendTime': const DateTimeTimestampConverter().toJson(instance.sendTime),
    };
