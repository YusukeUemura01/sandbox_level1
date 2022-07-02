

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sandbox_level1/model/account.dart';

import 'json_converter.dart';
part 'talk_room.freezed.dart';
part 'talk_room.g.dart';
@freezed
class TalkRoom with _$TalkRoom {
  factory TalkRoom({
    required String id,
    required List<String> userIDs,
    @DateTimeTimestampConverter() required DateTime updateTime,
  }) = _TalkRoom;

  factory TalkRoom.fromJson(Map<String, dynamic> json) =>
      _$TalkRoomFromJson(json);
}