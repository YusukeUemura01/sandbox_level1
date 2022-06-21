

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
part 'create_account_page_controller.freezed.dart';
@freezed
class CreateAccountPageState with _$CreateAccountPageState {
  factory CreateAccountPageState({
    File? iconImage,
    String? nameErrorText,
    String? emailErrorText,
    String? passErrorText,
		// 初期値
  }) = _CreateAccountPageState;
}

class CreateAccountPageStateController extends StateNotifier<CreateAccountPageState>{
  CreateAccountPageStateController(CreateAccountPageState state) : super(state);
  void changeErrorText(String? nameErrorText,String? emailErrorText,String? passErrorText){
    state = state.copyWith(nameErrorText: nameErrorText,emailErrorText: emailErrorText,passErrorText: passErrorText);
  }
  void changeIconImage(File newIconImage){
    state = state.copyWith(iconImage: newIconImage);
  }
}