
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level1/Firebase/firestore_repository.dart';
import 'package:sandbox_level1/model/account.dart';
part 'user_list_page_controller.freezed.dart';


@freezed
class UserListPageState with _$UserListPageState{
  factory UserListPageState({
    required List<Account> allUserList,
    Account? myAccount,
  }) = _UserListPageState;
}

class UserListPageStateController extends StateNotifier<UserListPageState>{
  UserListPageStateController(UserListPageState state) : super(state);

  final fireStoreRepo = FirestoreRepository();


  void fetchUserList() async {//自分以外の全ユーザをとってくる
    final _userList = await fireStoreRepo.fetchUserAccountList();
    state = state.copyWith(allUserList: _userList);
  }



  void setLoginAccount() async {
    if(FirestoreRepository.currentLoginAccount != null){//すでに自分のアカウント情報を取得していたら
      state = state.copyWith(myAccount: FirestoreRepository.currentLoginAccount);
      return;
    }
    final loginAccount = await fireStoreRepo.fetchAccountData(FirebaseAuth.instance.currentUser!.uid);
    fireStoreRepo.setCurrentLoginAccount(loginAccount);
    state = state.copyWith(myAccount: loginAccount);
  }
}