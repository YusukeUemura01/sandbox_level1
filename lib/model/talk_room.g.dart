// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talk_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TalkRoom _$$_TalkRoomFromJson(Map<String, dynamic> json) => _$_TalkRoom(
      id: json['id'] as String,
      userIDs:
          (json['userIDs'] as List<dynamic>).map((e) => e as String).toList(),
      finalUpdateUserID: json['finalUpdateUserID'] as String,
      finalSendContent: json['finalSendContent'] as String,
      unreadMessageCount: json['unreadMessageCount'] as int,
      updateTime: const DateTimeTimestampConverter()
          .fromJson(json['updateTime'] as Timestamp),
    );

Map<String, dynamic> _$$_TalkRoomToJson(_$_TalkRoom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userIDs': instance.userIDs,
      'finalUpdateUserID': instance.finalUpdateUserID,
      'finalSendContent': instance.finalSendContent,
      'unreadMessageCount': instance.unreadMessageCount,
      'updateTime':
          const DateTimeTimestampConverter().toJson(instance.updateTime),
    };
