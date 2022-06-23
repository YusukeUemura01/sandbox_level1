import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level1/Firebase/authentication.dart';
import 'package:sandbox_level1/utils/function_utils.dart';
import 'package:sandbox_level1/view_model/create_account_page_controller.dart';

final createAccountPageProvider = StateNotifierProvider<
    CreateAccountPageStateController,
    CreateAccountPageState>((ref) {
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
                final pickedFile = await FunctionUtils().getImageGallery(); //imagePickerで画像取得
                ref.read(createAccountPageProvider.notifier).changeIconImage(File(pickedFile.path));
              },
              child: CircleAvatar(
                foregroundImage: createAccountPageState.iconImage == null
                    ? NetworkImage(createAccountPageState.imagePath)
                    : FileImage(createAccountPageState.iconImage!) as ImageProvider,
                radius: 40,
                child: const Icon(Icons.add),
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
                ref.read(createAccountPageProvider.notifier).initializeErrorText();//エラーテキスト初期化
                final checkController = ref.read(createAccountPageProvider.notifier).checkControllerText(//空欄がないかをチェック
                    createAccountPageState.nameController!.text,
                    createAccountPageState.passController!.text,
                    createAccountPageState.emailController!.text
                );

                if(!checkController)return;//エラーがあったとき

              },
              child: const Text("登録"))
          ],
        ),
      ),
    ),)
    ,
    );
  }
}

