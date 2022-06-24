

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level1/Firebase/authentication.dart';
import 'package:sandbox_level1/utils/function_utils.dart';
part 'create_account_page_controller.freezed.dart';
@freezed
class CreateAccountPageState with _$CreateAccountPageState {
  factory CreateAccountPageState({
    File? iconImage,
    UserCredential? newAccount,
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

  Future<void> getImageAndChangeIconImage()async{
    final pickedFile = await FunctionUtils().getImageGallery();
    state = state.copyWith(iconImage: File(pickedFile.path));
  }
  void initializeErrorText(){
    state = state.copyWith(nameErrorText: null,passErrorText: null,emailErrorText: null);
  }
  bool checkControllerText(){
    if(state.nameController.text.isEmpty){
      state = state.copyWith(nameErrorText: "名前が入力されていません");
    }
    if(state.passController.text.isEmpty){
      state = state.copyWith(passErrorText: "パスワードが入力されていません");
    }
    if(state.emailController.text.isEmpty){
      state = state.copyWith(emailErrorText: "メールアドレスが入力されていません");
    }
    if(state.nameErrorText == null && state.emailErrorText == null && state.passErrorText == null){//全ての欄が埋まっていた時
      return false;
    }else{
      return true;
    }
  }
  Future<bool>authenticationSignUp()async {
    final newAccount = await Authentication().signUp(state.emailController.text, state.passController.text);
    if(newAccount is UserCredential){
      state = state.copyWith(newAccount: newAccount);
      return true;
    }else{
      print("Authエラー");
      return false;
    }
  }
  Future<bool>upLoadIconImage()async{
    if(state.iconImage == null)return true;//アイコンが選択されていない時アップロードしない
    try{
      final _imagePath = await FunctionUtils().upLoadImage(state.newAccount!.user!.uid, state.iconImage!);//iconをアップロード
      state = state.copyWith(imagePath: _imagePath);
      return true;
    }on FirebaseException catch(e){
      print("iconImageアップロードエラー$e");
      return false;
    }
  }
}