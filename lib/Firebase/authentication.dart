import 'package:firebase_auth/firebase_auth.dart';

class Authentication{
  final FirebaseAuth userAuth = FirebaseAuth.instance;

  Future<dynamic> signUp(String email,String pass)async{//アカウントを登録するメソッド
    try{
      UserCredential newAccount = await userAuth.signInWithEmailAndPassword(email: email, password: pass);
      return newAccount;
    }on FirebaseException catch(e){
      print("アカウント作成エラー$e");
      return false;
    }
  }
}