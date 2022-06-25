
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level1/Firebase/auth_repository.dart';

import '../model/account.dart';
part 'loginpage_controller.freezed.dart';
@freezed
class LoginPageState with _$LoginPageState {
  factory LoginPageState({
    required TextEditingController emailFiledController,
    required TextEditingController passFiledController,
    String? emailFiledErrorText,
    String? passFiledErrorText,
    Account? loginAccount,
    dynamic successSignIn,
    dynamic successGetAccountData,
		// 初期値
    @Default(false) bool isLoading,
    @Default(true) bool existEmptyFiled,
  }) = _LoginPageState;
}


class LoginPageStateController extends StateNotifier<LoginPageState>{
  LoginPageStateController(LoginPageState state) : super(state);

  Future<dynamic>authenticationSignIn()async {
    final canSingIn = await Authentication().signIn(state.emailFiledController.text, state.passFiledController.text);
    state = state.copyWith(successSignIn: canSingIn);
  }

  void checkControllerText(){
    if(state.passFiledController.text.isEmpty){
      state = state.copyWith(passFiledErrorText: "パスワードが入力されていません");
    }
    if(state.emailFiledController.text.isEmpty){
      state = state.copyWith(emailFiledErrorText: "メールアドレスが入力されていません");
    }
    if(state.emailFiledErrorText == null && state.passFiledErrorText == null){//全ての欄が埋まっていた時
      state = state.copyWith(existEmptyFiled: false);
    }
  }
}