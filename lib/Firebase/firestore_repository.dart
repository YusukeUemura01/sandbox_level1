import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sandbox_level1/model/account.dart';
import 'package:sandbox_level1/model/message.dart';
import 'package:sandbox_level1/model/talk_room.dart';

class FirestoreRepository{
  final _fireStoreInstance = FirebaseFirestore.instance;
  static Account? currentLoginAccount;





  void setCurrentLoginAccount(Account account){
    currentLoginAccount = account;
  }




  Future<FirebaseException?> setAccountData(Account newAccount) async {//自分の情報をfirestoreにセット
    final newAccountToJson = newAccount.toJson();
    try{
      await _fireStoreInstance.collection("users").doc(newAccount.id).set(newAccountToJson);
      return null;
    }on FirebaseException catch(e){
      return e;
    }
  }



  Future<Account> fetchAccountData(String id) async {//自分のuser情報をfirestoreからとってくる
      print("アカウントid $id");
      DocumentSnapshot documentSnapshot = await _fireStoreInstance.collection("users").doc(id).get();
      Map<String,dynamic> data = documentSnapshot.data() as Map<String,dynamic>;
      Account loginAccount = Account.fromJson(data);
      return loginAccount;
  }



  Future<List<Account>> fetchUserAccountList() async {//ユーザー一覧ページでユーザーリストをとってくるメソッド
    final String _myId = FirebaseAuth.instance.currentUser!.uid;
    final snapshot = await _fireStoreInstance.collection("users").where("id",isNotEqualTo: _myId).get();//自分以外のユーザをとってくる
    List<Account> userList = [];
    for(int index = 0;index < snapshot.docs.length;index++){
      final data = snapshot.docs[index].data();
      Account _account = Account.fromJson(data);
      userList.add(_account);
    }
    return userList;
  }



  Future<String?> fetchTalkRoomID(Account otherAccount) async {//ユーザー一覧ページで相手のアカウント情報からトークルームIDを取得するメソッド
    final myId = FirebaseAuth.instance.currentUser!.uid;
    final otherAccountId = otherAccount.id;
    List userIDList = [myId,otherAccountId];
    userIDList.sort((a, b) => a.compareTo(b));//ソートしてidの順番を決めておく
    final QuerySnapshot _snapshot = await _fireStoreInstance.collection("talk_room").where("userIDs",isEqualTo: userIDList).get();

    if(_snapshot.size == 0) return null;//トークルームが作られていない場合

    final data = _snapshot.docs[0].data() as Map<String,dynamic>;
    TalkRoom _talkRoom = TalkRoom.fromJson(data);
    print("talkroomId ${_talkRoom.id}");
    return _talkRoom.id;
  }



  Future<Message>addMessage(String talkRoomId,String content,Account sendAccount) async {//メッセージを追加するメソッド

    final newDoc =  _fireStoreInstance.collection("talk_room").doc(talkRoomId).collection("message").doc().id;
    Message newMessage = Message(
        content: content,
        sendAccountID: sendAccount.id,
        sendTime: DateTime.now(),
    );
    await _fireStoreInstance.collection("talk_room").doc(talkRoomId).collection("message").doc(newDoc).set(newMessage.toJson());
    return newMessage;
  }



  Future<String>createTalkRoom(Account myAccount,Account otherAccount) async {//トークルームを作成するメソッド
    List<String> userList = [myAccount.id,otherAccount.id];
    userList.sort((a, b) => a.compareTo(b));//ソートしてidの順番を決めておく
    final newDoc = _fireStoreInstance.collection("talk_room").doc().id;
    TalkRoom newChatroom = TalkRoom(
        id: newDoc,
        userIDs:userList,
        updateTime: DateTime.now(),
        finalSendContent: "",
        finalUpdateUserID: "",
        unreadMessageCount: 0,
    );
    await _fireStoreInstance.collection("talk_room").doc(newDoc).set(newChatroom.toJson());//talk_roomの方に保存
    return newDoc;//TODO ここまで
  }



  Stream<List<Message>> fetchMessageList(String id){//idをもとにメッセージをとってくる
    final Stream<QuerySnapshot> messageStream = _fireStoreInstance.collection("talk_room").doc(id).collection("message").orderBy("sendTime",descending: true).snapshots();
    Stream<List<Message>> stream = messageStream.map((QuerySnapshot snapshot) {
      return snapshot.docs.map((DocumentSnapshot document){
        Map<String,dynamic> data = document.data() as Map<String,dynamic>;
        Message message = Message.fromJson(data);
        return message;
      }).toList();
    });
    return stream;
  }
  
  
  
  Stream<List<TalkRoom>> fetchMyTalkRoomList(String myId){
    final Stream<QuerySnapshot> talkRoomStream = _fireStoreInstance.collection("talk_room").where("userIDs",arrayContains: myId).where("finalUpdateUserID",isNotEqualTo: "").snapshots();
    Stream<List<TalkRoom>> stream = talkRoomStream.map((QuerySnapshot snapshot){
      return snapshot.docs.map((DocumentSnapshot document){
        Map<String,dynamic> data = document.data() as Map<String,dynamic>;
        TalkRoom talkRoom = TalkRoom.fromJson(data);
        return talkRoom;
      }).toList();
    });
    return stream;
  }
  
  
  Future<List<Account>> fetchOtherAccount(List<TalkRoom> messageList,String myId) async {
    var otherAccountId = "";
    final List<Account> accountList = [];
    for(final message in messageList){
      for(final id in message.userIDs){
        if(id != myId){
          otherAccountId = id;
        }
      }
      final documentSnapshot = await _fireStoreInstance.collection("users").doc(otherAccountId).get();
      Map<String,dynamic> data = documentSnapshot.data() as Map<String,dynamic>;
      final Account account = Account.fromJson(data);
      accountList.add(account);
    }
    return accountList;
  }



  Future<TalkRoom> updateTalkRoom(String myId,String otherId,TalkRoom room,String content) async {
    var count = 0;
    if(room.finalUpdateUserID == myId){//最後の更新者が自分の時、未読数を1増やす
      count = room.unreadMessageCount + 1;
    }else{
      count = 1;
    }
    final updateTalkRoom = TalkRoom(
        id: room.id,
        userIDs: room.userIDs,
        finalUpdateUserID: myId,
        finalSendContent: content,
        unreadMessageCount: count,
        updateTime: DateTime.now(),
    );
    await _fireStoreInstance.collection("talk_room").doc(room.id).update(updateTalkRoom.toJson());
    return updateTalkRoom;
  }
  


  Future<TalkRoom> fetchTakRoomInfo(String id) async {
    final snapshot = await _fireStoreInstance.collection("talk_room").doc(id).get();
    Map<String,dynamic> data = snapshot.data() as Map<String,dynamic>;
    return TalkRoom.fromJson(data);
  }
}