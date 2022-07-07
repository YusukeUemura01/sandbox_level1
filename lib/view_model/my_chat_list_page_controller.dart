


import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level1/Firebase/firestore_repository.dart';
import 'package:sandbox_level1/model/account.dart';
import 'package:sandbox_level1/model/talk_room.dart';

part 'my_chat_list_page_controller.freezed.dart';

@freezed
class MyChatListPageState with _$MyChatListPageState {
  factory MyChatListPageState({
    Account? myAccount,
    @Default([]) List<Account> otherAccountList,//チャット相手のアカウントリスト
    @Default([]) List<TalkRoom> talkRoomList,//自分のメッセージリスト
  }) = _MyChatListPageState;
}



class MyChatListPageController extends StateNotifier<MyChatListPageState>{
  MyChatListPageController(MyChatListPageState state) : super(state);

  final fireStoreRepo = FirestoreRepository();

  void setLoginAccount() async {//自分のアカウントをセットする
    if(fireStoreRepo.currentLoginAccount != null){//すでに自分のアカウント情報を取得していたら
      state = state.copyWith(myAccount: fireStoreRepo.currentLoginAccount);
      return;
    }
    final loginAccount = await fireStoreRepo.fetchAccountData(FirebaseAuth.instance.currentUser!.uid);
    fireStoreRepo.setCurrentLoginAccount(loginAccount);
    state = state.copyWith(myAccount: loginAccount);
  }




  void fetchMessageList(){
    final Stream<List<TalkRoom>> stream = fireStoreRepo.fetchMyTalkRoomList(FirebaseAuth.instance.currentUser!.uid);//メッセージをとってくる
    stream.listen((talkRoomList) async {
      final accountList = await fireStoreRepo.fetchOtherAccount(talkRoomList, FirebaseAuth.instance.currentUser!.uid);
      state = state.copyWith(talkRoomList: talkRoomList,otherAccountList: accountList);
    });
  }
}