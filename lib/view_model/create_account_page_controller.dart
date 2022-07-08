

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level1/Firebase/auth_repository.dart';
import 'package:sandbox_level1/Firebase/firestore_repository.dart';
import 'package:sandbox_level1/utils/function_utils.dart';
import '../model/account.dart';
part 'create_account_page_controller.freezed.dart';


@freezed
class CreateAccountPageState with _$CreateAccountPageState {
  factory CreateAccountPageState({
    File? iconImage,
    UserCredential? newUserCredential,
    String? nameErrorText,
    String? emailErrorText,
    String? passErrorText,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passController,
    //デフォルトアイコン画像のURLを設定しておく
    @Default(false)bool isLoading,
		@Default("https://firebasestorage.googleapis.com/v0/b/sandbox-level1.appspot.com/o/default_icon.png?alt=media&token=bbbfd38f-887d-4da9-b048-c79cc2395d62") String imagePath,
  }) = _CreateAccountPageState;
}

class CreateAccountPageStateController extends StateNotifier<CreateAccountPageState>{
  CreateAccountPageStateController(CreateAccountPageState state) : super(state);


  void changeIsLoading(){
    state = state.copyWith(isLoading:!state.isLoading);
  }



  Future<void> getImageAndChangeIconImage() async {
    final pickedFile = await FunctionUtils().getImageGallery();
    state = state.copyWith(iconImage: File(pickedFile.path));
  }



  void initializeErrorText(){
    state = state.copyWith(nameErrorText: null,passErrorText: null,emailErrorText: null);
  }



  bool checkTextFiledError(){
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



  Future<FirebaseException?>authenticationSignUp() async {
    final _resultSignUp = await Authentication().signUp(state.emailController.text, state.passController.text);
    if(_resultSignUp is UserCredential){//auth成功した時
      state = state.copyWith(newUserCredential: _resultSignUp);
      return null;
    }
    if(_resultSignUp is FirebaseException){//auth失敗した時
      print("Authエラー");
      return _resultSignUp;
    }
    return FirebaseException(plugin: "エラー");
  }



  Future<FirebaseException?>upLoadIconImage() async {
    if(state.iconImage == null)return null;//アイコンが選択されていない時アップロードしない
    try{
      final _imagePath = await FunctionUtils().upLoadImage(state.newUserCredential!.user!.uid, state.iconImage!);//iconをアップロード
      state = state.copyWith(imagePath: _imagePath);
      return null;
    }on FirebaseException catch(exception){
      print("iconImageアップロードエラー$exception");
      return exception;
    }
  }



  Future<FirebaseException?>setAccountData() async {
    final newAccount = Account(
        id: state.newUserCredential!.user!.uid,
        userName: state.nameController.text,
        imagePath: state.imagePath,
        updateTime: DateTime.now()
    );
    final _setAccountDataException = await FirestoreRepository().setAccountData(newAccount);//firestoreに保存
    FirestoreRepository().setCurrentLoginAccount(newAccount);//FirestoreRepositoryに保存
    return _setAccountDataException;
  }
}
