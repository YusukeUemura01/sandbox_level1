



import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level1/Firebase/firestore_repository.dart';

import '../model/account.dart';
import '../utils/function_utils.dart';
part 'edit_profile_page_controller.freezed.dart';


@freezed
class EditProfilePageState with _$EditProfilePageState {
  factory EditProfilePageState ({
    File? newAccountImage,
    Account? myAccount,
    @Default(false) bool isLoading,
    required TextEditingController textEditingController,
  }) = _EditProfilePageState;
}




class EditProfilePageController extends StateNotifier<EditProfilePageState>{
  EditProfilePageController(EditProfilePageState state) : super(state);

  final fireStoreRepo = FirestoreRepository();

  void setLoginAccount() async {//自分のアカウントをセットする

    if(FirestoreRepository.currentLoginAccount == null){//自分のアカウント情報を取得していなかったら
      final loginAccount = await fireStoreRepo.fetchAccountData(FirebaseAuth.instance.currentUser!.uid);
      fireStoreRepo.setCurrentLoginAccount(loginAccount);
    }

    state = state.copyWith(myAccount: FirestoreRepository.currentLoginAccount);
    setCurrentNameToTextField();//TextFieldで今のユーザ名をセットしておく
  }



  void setCurrentNameToTextField(){
    state.textEditingController.text = state.myAccount!.userName;
  }




  Future<void> pickAccountImage() async {
    final pickedFile = await FunctionUtils().getImageGallery();
    if(pickedFile == null)return;
    state = state.copyWith(newAccountImage: File(pickedFile.path));
  }



  Future<String> uploadImage() async {

    if(state.newAccountImage == null){//画像が選択されていない時今のアカウント画像のパスを返す
      return state.myAccount!.imagePath;
    }

    final imageURL = await FunctionUtils().upLoadImage(state.myAccount!.id, state.newAccountImage!);
    return imageURL;
  }


  Future<void> updateAccountData(String url) async {
    final Account updateAccount = Account(
        id: state.myAccount!.id,
        userName: state.textEditingController.text,
        imagePath: url,
        updateTime: DateTime.now()
    );
    await fireStoreRepo.updateAccountData(updateAccount);
  }



  void changeLoading(){
    state = state.copyWith(isLoading: !state.isLoading);
  }
}