import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FunctionUtils{

  Future<dynamic> getImageGallery() async {//イメージピッカーから
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    return pickedFile;
  }



  Future<String> upLoadImage(String id,File image) async {//イメージをアップロードしてそのURLを返す
    final FirebaseStorage storageInstance = FirebaseStorage.instance;
    final Reference ref = storageInstance.ref();
    await ref.child(id).putFile(image);//uidが画像のファイル名
    String downloadUrl = await storageInstance.ref(id).getDownloadURL(); //アップロードしたURLを取得
    return downloadUrl;
  }



  void showErrorDialog(BuildContext context,FirebaseException errorException) {
    showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (_) {
          return AlertDialog(
            title: const Text("エラーが発生しました"),
            content: Text("$errorException"),
            actions: [
              TextButton(
                child: const Text('戻る'),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }
}