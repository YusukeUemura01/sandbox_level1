

import 'dart:io';

import 'package:flutter/cupertino.dart';
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
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passController,
    //デフォルトアイコン画像のURLを設定しておく
		@Default("https://firebasestorage.googleapis.com/v0/b/sandbox-level1.appspot.com/o/default_icon.png?alt=media&token=bbbfd38f-887d-4da9-b048-c79cc2395d62") String imagePath,
  }) = _CreateAccountPageState;
}

class CreateAccountPageStateController extends StateNotifier<CreateAccountPageState>{
  CreateAccountPageStateController(CreateAccountPageState state) : super(state);

  void changeIconImage(File newIconImage){
    state = state.copyWith(iconImage: newIconImage);
  }
  void initializeErrorText(){
    state = state.copyWith(nameErrorText: null,passErrorText: null,emailErrorText: null);
  }
  bool checkControllerText(String name,String pass,String email){
    if(name.isEmpty){
      state = state.copyWith(nameErrorText: "名前が入力されていません");
    }
    if(pass.isEmpty){
      state = state.copyWith(passErrorText: "パスワードが入力されていません");
    }
    if(email.isEmpty){
      state = state.copyWith(emailErrorText: "メールアドレスが入力されていません");
    }
    if(state.nameErrorText == null && state.emailErrorText == null && state.passErrorText == null){//全ての欄が埋まっていた時
      return true;
    }else{
      return false;
    }
  }

}