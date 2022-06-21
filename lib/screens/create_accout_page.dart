import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level1/Firebase/authentication.dart';
import 'package:sandbox_level1/utils/function_utils.dart';
import 'package:sandbox_level1/view_model/create_account_page_controller.dart';

final createAccountPageProvider = StateNotifierProvider<CreateAccountPageStateController,CreateAccountPageState>((ref){
  return CreateAccountPageStateController(CreateAccountPageState());
});


class CreateAccountPage extends HookConsumerWidget {

  CreateAccountPage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createAccountPageState = ref.watch(createAccountPageProvider);
    File? iconImage = createAccountPageState.iconImage;
    String? nameErrorText = createAccountPageState.nameErrorText;
    String? emailErrorText = createAccountPageState.emailErrorText;
    String? passwordErrorText = createAccountPageState.passErrorText;
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
                    final pickedFile = await FunctionUtils().getImageGallery();
                    ref.read(createAccountPageProvider.notifier).changeIconImage(File(pickedFile.path));
                  },
                  child: CircleAvatar(
                    foregroundImage: iconImage == null ? null : FileImage(iconImage),
                    radius: 40,
                    child: const Icon(Icons.add),
                  ),
                ),
                Container(
                  width: 300,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(hintText: "名前",errorText: nameErrorText),
                  ),
                ),
                Container(
                  width: 300,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: "メールアドレス",errorText: emailErrorText),
                  ),
                ),
                Container(
                  width: 300,
                  child: TextField(
                    controller: passController,
                    decoration: InputDecoration(hintText: "パスワード",errorText: passwordErrorText),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () async {
                      nameErrorText = null;//エラーテキスト初期化
                      emailErrorText = null;
                      passwordErrorText = null;
                      if(nameController.text.isEmpty){
                        nameErrorText = "名前が入力されていません";
                      }
                      if(emailController.text.isEmpty){
                        emailErrorText = "メールアドレスが入力されていません";
                      }
                      if(passController.text.isEmpty){
                        passwordErrorText = "パスワードが入力されていません";
                      }
                      ref.read(createAccountPageProvider.notifier).changeErrorText(nameErrorText,emailErrorText,passwordErrorText);
                      if(nameErrorText == null && emailErrorText == null && passwordErrorText == null){
                        //final newAccount = await Authentication().signUp(emailController.text,passController.text);//アカウントをauthenticationに登録
                      }
                    },
                    child: const Text("登録"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

