


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level1/Firebase/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:sandbox_level1/Firebase/firestore_repository.dart';
import 'package:sandbox_level1/utils/function_utils.dart';

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
    UserCredential? loginUserCredential,
		// 初期値
    @Default(false) bool isLoading,
  }) = _LoginPageState;
}


class LoginPageStateController extends StateNotifier<LoginPageState>{
  LoginPageStateController(LoginPageState state) : super(state);


  void changeIsLoading(){
    state = state.copyWith(isLoading:!state.isLoading);
  }
  void initializeErrorText(){
    state = state.copyWith(passFiledErrorText: null,emailFiledErrorText: null);
  }

  Future<FirebaseException?>authenticationSignIn()async {
    final _resultAuth = await Authentication().signIn(state.emailFiledController.text, state.passFiledController.text);
    if(_resultAuth is UserCredential){
      state = state.copyWith(loginUserCredential: _resultAuth);
      return null;
    }
    if(_resultAuth is FirebaseException){//エラー時
      return _resultAuth;
    }
    return FirebaseException(plugin: "エラー発生");
  }

  bool checkTextFiledError(){
    if(state.passFiledController.text.isEmpty){
      state = state.copyWith(passFiledErrorText: "パスワードが入力されていません");
    }
    if(state.emailFiledController.text.isEmpty){
      state = state.copyWith(emailFiledErrorText: "メールアドレスが入力されていません");
    }

    if(state.emailFiledErrorText == null && state.passFiledErrorText == null){//全ての欄が埋まっていた時
      return false;
    }else{//エラーがあったとき
      return true;
    }
  }
  Future<FirebaseException?>getAccountData()async{
    if(state.loginUserCredential == null){
      return FirebaseException(plugin: "SingInされていません");
    }
    final _loginAccount = await FirestoreRepository().getAccountData(state.loginUserCredential!.user!.uid);
    state = state.copyWith(loginAccount: _loginAccount);
    FirestoreRepository().setCurrentLoginAccount(_loginAccount);
    return null;
  }
}