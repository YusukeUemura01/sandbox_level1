
import 'dart:async';

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
    StreamSubscription<List<Message>>? messageListener,
  }) = _ChatPageState;
}



class ChatPageController extends StateNotifier<ChatPageState>{
  ChatPageController(ChatPageState state) : super(state);


  final fireStoreRepo = FirestoreRepository();


  void initializedMessageList(){//メッセージリストを初期化する
    state = state.copyWith(messageList: []);
    if(state.messageListener != null){
      state.messageListener!.cancel();//メッセージのリッスンをキャンセル
    }
  }


  Future<void>getTalkRoomInfo(Account myAccount,Account otherAccount) async {//トークルームidとメッセージリストを取得してくる
    final id = await fireStoreRepo.fetchTalkRoomID(otherAccount);//id取得
    state = state.copyWith(chatRoomId: id);

    if(id == null){//トークルームidが存在しない時、
      await createChatRoom(myAccount, otherAccount);
      listenMessageList(state.chatRoomId!);
      return;
    }

    await listenMessageList(id);////トークルームidが存在するとき、メッセージ取得
  }




  Future<void> listenMessageList(String id) async {//メッセージをリアルタイムで更新

    Stream<List<Message>> messageListStream = fireStoreRepo.fetchMessageList(id);
    final messageListener = messageListStream.listen((messageList) {
      state = state.copyWith(messageList: messageList);
    });
    state = state.copyWith(messageListener: messageListener);
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