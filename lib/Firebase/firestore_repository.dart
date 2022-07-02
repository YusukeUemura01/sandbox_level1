import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:sandbox_level1/model/account.dart';
import 'package:sandbox_level1/model/message.dart';
import 'package:sandbox_level1/model/talk_room.dart';

class FirestoreRepository{
  final _fireStoreInstance = FirebaseFirestore.instance;
  Account? currentLoginAccount;

  void setCurrentLoginAccount(Account account){
    currentLoginAccount = account;
  }

  Future<FirebaseException?> setAccountData(Account _newAccount)async{//自分の情報をfirestoreにセット
    final newAccountToJson = _newAccount.toJson();
    try{
      await _fireStoreInstance.collection("users").doc(_newAccount.id).set(newAccountToJson);
      return null;
    }on FirebaseException catch(e){
      return e;
    }
  }
  Future<Account> getAccountData(String id)async{//自分のuser情報をfirestoreからとってくる
      print("アカウントid $id");
      DocumentSnapshot documentSnapshot = await _fireStoreInstance.collection("users").doc(id).get();
      Map<String,dynamic> data = documentSnapshot.data() as Map<String,dynamic>;
      Account loginAccount = Account.fromJson(data);
      return loginAccount;
  }
  Future<List<Account>> fetchUserAccountList() async {
    final String _myId = FirebaseAuth.instance.currentUser!.uid;
    final _snapshot = await _fireStoreInstance.collection("users").where("id",isNotEqualTo: _myId).get();//自分以外のユーザをとってくる
    List<Account> userList = [];
    for(int index = 0;index < _snapshot.docs.length;index++){
      final data = _snapshot.docs[index].data();
      Account _account = Account.fromJson(data);
      userList.add(_account);
    }
    return userList;
  }
  Future<String?> getTalkRoomID(Account _otherAccount)async {
    final myId = FirebaseAuth.instance.currentUser!.uid;
    final otherAccountId = _otherAccount.id;
    List userIDList = [myId,otherAccountId];
    userIDList.sort((a, b) => a.compareTo(b));//ソートしてidの順番を決めておく
    final QuerySnapshot _snapshot = await _fireStoreInstance.collection("talk_room").where("userIDs",isEqualTo: userIDList).get();

    if(_snapshot.size == 0)return null;//トークルームが作られていない場合

    final data = _snapshot.docs[0].data() as Map<String,dynamic>;
    TalkRoom _talkRoom = TalkRoom.fromJson(data);
    print("talkroomId ${_talkRoom.id}");
    return _talkRoom.id;
  }
  Future<List<Message>> fetchMessageList(String id)async{//idをもとにメッセージをとってくる
    final QuerySnapshot _snapshot = await _fireStoreInstance.collection("talk_room").doc(id).collection("message").orderBy("sendTime",descending: true).get();
    List<Message> list = [];
    for(int index = 0;index < _snapshot.docs.length;index++){
      final data = _snapshot.docs[index].data() as Map<String,dynamic>;
      Message _message = Message.fromJson(data);
      list.add(_message);
    }
    return list;

  }
  Future<Message>addMessage(String talkRoomId,String content,Account sendAccount)async {

    final _newDoc =  _fireStoreInstance.collection("talk_room").doc(talkRoomId).collection("message").doc().id;
    Message newMessage = Message(
        content: content,
        sendAccountID: sendAccount.id,
        sendTime: DateTime.now(),
    );
    await _fireStoreInstance.collection("talk_room").doc(talkRoomId).collection("message").doc(_newDoc).set(newMessage.toJson());
    return newMessage;
  }
  Future<String>createTalkRoom(Account myAccount,Account otherAccount)async{
    List<String> _userList = [myAccount.id,otherAccount.id];
    _userList.sort((a, b) => a.compareTo(b));//ソートしてidの順番を決めておく
    final _newDoc = _fireStoreInstance.collection("talk_room").doc().id;
    TalkRoom newChatroom = TalkRoom(
        id: _newDoc,
        userIDs:_userList,
        updateTime: DateTime.now()
    );
    await _fireStoreInstance.collection("talk_room").doc(_newDoc).set(newChatroom.toJson());//talk_roomの方に保存
    return _newDoc;//TODO ここまで
  }
}