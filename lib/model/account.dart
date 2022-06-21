
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'account.freezed.dart';
@freezed
class Account with _$DataClass {
  factory DataClass({
    required String id,
    required String userName,
    required String imagePath,
    required



		// 初期値
    @Default(false) bool isCompleted,
  }) = _DataClass;
}