import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level1/Firebase/authentication.dart';
import 'package:sandbox_level1/utils/function_utils.dart';
import 'package:sandbox_level1/view_model/create_account_page_controller.dart';

final createAccountPageProvider = StateNotifierProvider<
    CreateAccountPageStateController, CreateAccountPageState>((ref) {
  return CreateAccountPageStateController(CreateAccountPageState(
    nameController: TextEditingController(),
    emailController: TextEditingController(),
    passController: TextEditingController(),
  ));
});

class CreateAccountPage extends HookConsumerWidget {
  CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createAccountPageState = ref.watch(createAccountPageProvider);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () async {
                    await ref.read(createAccountPageProvider.notifier).getImageAndChangeIconImage();//アイコン画像変更
                  },
                  child: CircleAvatar(

                    backgroundImage: createAccountPageState.iconImage == null
                        ? NetworkImage(createAccountPageState.imagePath)
                        : FileImage(createAccountPageState.iconImage!)
                            as ImageProvider,
                    radius: 40,
                    child: createAccountPageState.iconImage == null
                        ? const Icon(Icons.camera_alt_outlined,color: Colors.black,size: 40,)
                        : null
                  ),
                ),
                Container(
                  width: 300,
                  child: TextField(
                    controller: createAccountPageState.nameController,
                    decoration: InputDecoration(
                        hintText: "名前",
                        errorText: createAccountPageState.nameErrorText),
                  ),
                ),
                Container(
                  width: 300,
                  child: TextField(
                    controller: createAccountPageState.emailController,
                    decoration: InputDecoration(
                      hintText: "メールアドレス",
                      errorText: createAccountPageState.emailErrorText,
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  child: TextField(
                    controller: createAccountPageState.passController,
                    decoration: InputDecoration(
                        hintText: "パスワード",
                        errorText: createAccountPageState.passErrorText),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () async {
                    ref.read(createAccountPageProvider.notifier).initializeErrorText(); //エラーテキスト初期化
                    final  existEmptyField = ref.read(createAccountPageProvider.notifier).checkControllerText();//空欄がないかチェック
                    if (existEmptyField) return; //空欄があったとき

                    final canAuthenticationSingUp = await ref.read(createAccountPageProvider.notifier).authenticationSignUp();//signup
                    if(!canAuthenticationSingUp){//Authができなかったとき
                      showErrorDialog(context);
                    }

                    final canUploadIconImage = await ref.read(createAccountPageProvider.notifier).upLoadIconImage();//iconImageをアップロード
                    if(!canUploadIconImage){//iconImageをアップロード出来なかった時
                      showErrorDialog(context);
                    }
                    //TODO ここから
                  },
                  child: const Text("登録"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void showErrorDialog(BuildContext context) {
    showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (_) {
          return AlertDialog(
            title: const Text("エラーが発生しました"),
            content: const Text("もう一度試してください"),
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
