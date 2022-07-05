
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level1/Firebase/firestore_repository.dart';
import 'package:sandbox_level1/model/account.dart';
import 'package:sandbox_level1/model/message.dart';
part 'chat_page_controller.freezed.dart';
@freezed
class ChatPageState with _$ChatPageState{
  factory ChatPageState({
    @Default([]) List<Message> messageList,
    required TextEditingController newMessageController,
    String? chatRoomId,
		// 初期値
  }) = _ChatPageState;
}



class ChatPageController extends StateNotifier<ChatPageState>{
  ChatPageController(ChatPageState state) : super(state);


  final fireStoreRepo = FirestoreRepository();


  void initializedMessageList(){//メッセージリストを初期化する
    state = state.copyWith(messageList: []);
  }


  Future<void>getTalkRoomInfo(Account _otherAccount) async {//トークルームidとメッセージリストを取得してくる
    final id = await fireStoreRepo.getTalkRoomID(_otherAccount);//id取得
    state = state.copyWith(chatRoomId: id);
    if(id == null){//トークルームidが存在しない時、メッセージリストを空っぽにしておく
      state = state.copyWith(messageList: []);
      print("talkRoomIdなし");
      return;
    }
    await fetchMessageList(id);////トークルームidが存在するとき、メッセージ取得
  }




  Future<void> fetchMessageList(String id) async {

      final messageList = await fireStoreRepo.fetchMessageList(id);//idをもとにリアルタイムにメッセージを更新
      state = state.copyWith(messageList: messageList);
    }



  Future<void>createChatRoom(Account myAccount,Account otherAccount) async {//ルームが存在しない時、ルームを作る
    final id = await fireStoreRepo.createTalkRoom(myAccount, otherAccount);
    state = state.copyWith(chatRoomId: id);
  }




  Future<void>addMessage(Account myAccount) async {//メッセージ追加
    await fireStoreRepo.addMessage(state.chatRoomId!, state.newMessageController.text, myAccount);
  }




  void clearAddMessageFiled(){//メッセージを追加した後、TextFieldを初期化
    state.newMessageController.clear();
  }
}