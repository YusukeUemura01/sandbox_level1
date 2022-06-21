
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'json_converter.dart';
part 'account.freezed.dart';
part 'account.g.dart';
@freezed
class Account with _$Account {
  factory Account({
    required String id,
    required String userName,
    required String imagePath,
    @DateTimeTimestampConverter() required DateTime updateTime,

  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}