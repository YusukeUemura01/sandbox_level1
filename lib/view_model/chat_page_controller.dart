
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level1/Firebase/firestore_repository.dart';
import 'package:sandbox_level1/model/account.dart';
import 'package:sandbox_level1/model/message.dart';

import '../model/talk_room.dart';
part 'chat_page_controller.freezed.dart';
@freezed
class ChatPageState with _$ChatPageState{
  factory ChatPageState({
    @Default([]) List<Message> messageList,
    required TextEditingController newMessageController,
    String? talkRoomId,
    StreamSubscription<List<Message>>? messageListener,
    TalkRoom? talkRoom,
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

  Future<void> setTalkRoomInfo(TalkRoom? room,String id)async{
    if(room != null){
      state = state.copyWith(talkRoom: room);
      return;
    }
    final talkRoom = await fireStoreRepo.fetchTakRoomInfo(id);//ルーム情報がなければルーム情報を取得
    state = state.copyWith(talkRoom: talkRoom);
  }


  Future<void>getTalkRoomInfo(Account myAccount,Account otherAccount,TalkRoom? room) async {//トークルームidとメッセージリストを取得してくる

    var id = await fireStoreRepo.fetchTalkRoomID(otherAccount);//id取得
    id ??= await createTalkRoom(myAccount, otherAccount);//ルームがないときルームidを作成
    state = state.copyWith(talkRoomId: id);
    await setTalkRoomInfo(room, id);//ルーム情報を取ってくる
    await listenMessageList(id);////トークルームidが存在するとき、メッセージ取得
  }




  Future<void> listenMessageList(String id) async {//メッセージをリアルタイムで更新

    Stream<List<Message>> messageListStream = fireStoreRepo.fetchMessageList(id);
    final messageListener = messageListStream.listen((messageList) async {
      state = state.copyWith(messageList: messageList);

      final talkRoom = await fireStoreRepo.fetchTakRoomInfo(id);//トークルーム情報もアップデートしておく
      state = state.copyWith(talkRoom: talkRoom);
    });
    state = state.copyWith(messageListener: messageListener);
  }



  Future<String>createTalkRoom(Account myAccount,Account otherAccount) async {//ルームが存在しない時、ルームを作る
    final id = await fireStoreRepo.createTalkRoom(myAccount, otherAccount);
    return id;
  }




  Future<void>addMessage(Account myAccount) async {//メッセージ追加
    await fireStoreRepo.addMessage(state.talkRoomId!, state.newMessageController.text, myAccount);
  }




  void clearAddMessageFiled(){//メッセージを追加した後、TextFieldを初期化
    state.newMessageController.clear();
  }


  Future<void> updateTalkRoomInfo(Account myAccount,Account otherAccount) async {
    final updateRoom = await fireStoreRepo.updateTalkRoom(myAccount.id, otherAccount.id, state.talkRoom!, state.newMessageController.text);
    state = state.copyWith(talkRoom: updateRoom);
  }
}