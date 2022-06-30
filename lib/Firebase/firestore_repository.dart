import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:sandbox_level1/model/account.dart';

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
      print(id);
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
}