import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sandbox_level1/model/account.dart';

import 'json_converter.dart';
part 'message.freezed.dart';
part 'message.g.dart';
@freezed
class Message with _$Message {
  factory Message({
    required String content,
    required String sendAccountID,
    @DateTimeTimestampConverter() required DateTime sendTime,
		// 初期値
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}