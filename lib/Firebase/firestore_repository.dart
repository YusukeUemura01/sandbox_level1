import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sandbox_level1/model/account.dart';

class FirestoreRepository{
  final _fireStoreInstance = FirebaseFirestore.instance;
  late Account currentLoginAccount;

  void setCurrentLoginAccount(Account account){
    currentLoginAccount = account.copyWith();
  }

  Future<FirebaseException?> setAccountData(Account _newAccount)async{//user情報をfirestoreにセット
    final newAccountToJson = _newAccount.toJson();
    try{
      await _fireStoreInstance.collection("users").doc(_newAccount.id).set(newAccountToJson);
      return null;
    }on FirebaseException catch(e){
      return e;
    }
  }
  Future<Account> getAccountData(String id)async{//user情報をfirestoreにセット
      print(id);
      DocumentSnapshot documentSnapshot = await _fireStoreInstance.collection("users").doc(id).get();
      Map<String,dynamic> data = documentSnapshot.data() as Map<String,dynamic>;
      Account loginAccount = Account.fromJson(data);
      return loginAccount;
  }
}