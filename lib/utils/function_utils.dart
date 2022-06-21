import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FunctionUtils{

  Future<dynamic> getImageGallery()async{//イメージピッカーから
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    return pickedFile;
  }

  Future<String> upLoadImage(String id,File image)async{//イメージをアップロードしてそのURLを返す
    final FirebaseStorage storageInstance = FirebaseStorage.instance;
    final Reference ref = storageInstance.ref();
    await ref.child(id).putFile(image);//uidが画像のファイル名
    String downloadUrl = await storageInstance.ref(id).getDownloadURL(); //アップロードしたURLを取得
    return downloadUrl;
  }
}