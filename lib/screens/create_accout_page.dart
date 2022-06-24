import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level1/Firebase/auth_repository.dart';
import 'package:sandbox_level1/screens/mychatpage.dart';
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              child: SizedBox(
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
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: createAccountPageState.nameController,
                        decoration: InputDecoration(
                            hintText: "名前",
                            errorText: createAccountPageState.nameErrorText),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: createAccountPageState.emailController,
                        decoration: InputDecoration(
                          hintText: "メールアドレス",
                          errorText: createAccountPageState.emailErrorText,
                        ),
                      ),
                    ),
                    SizedBox(
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
                        final controller = ref.read(createAccountPageProvider.notifier);
                        controller.changeIsLoading();//サークルインジェクターを出す
                        controller.initializeErrorText(); //エラーテキスト初期化
                        final  existEmptyField = controller.checkControllerText();//空欄がないかチェック
                        if (existEmptyField) {//空欄があったときエラー
                          controller.changeIsLoading();
                          return;
                        }

                        final canAuthenticationSingUp = await controller.authenticationSignUp();//signup
                        if(!canAuthenticationSingUp){//singUpできなかったときエラーダイアログを出す
                          controller.changeIsLoading();
                          showErrorDialog(context);//エラーダイアログ
                          return;
                        }
                        final canAuthenticationSingIn = await controller.authenticationSignIn();//作ったアカウントでsignin
                        if(!canAuthenticationSingIn){//sigInできなかったときエラーダイアログを出す
                          controller.changeIsLoading();
                          showErrorDialog(context);//エラーダイアログ
                        }

                        final canUploadIconImage = await controller.upLoadIconImage();//iconImageをアップロード
                        if(!canUploadIconImage){//iconImageをアップロード出来なかった時エラーダイアログを出す
                          controller.changeIsLoading();
                          showErrorDialog(context);//エラーダイアログ
                          return;
                        }
                        final canSaveOnFirestore = await controller.setAccountData();
                        if(!canSaveOnFirestore){//firestoreに保存できなかったらエラーダイアログを出す
                          controller.changeIsLoading();
                          showErrorDialog(context);//エラーダイアログ
                          return;
                        }
                        controller.changeIsLoading();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return MyChatPage();
                            },
                          ),
                        );

                      },
                      child: const Text("登録"),
                    ),
                  ],
                ),
              ),
            ),
            createAccountPageState.isLoading == true
            ? const SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator()
            )
            : const SizedBox()
          ],
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
