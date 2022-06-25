import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level1/screens/create_accout_page.dart';
import 'package:sandbox_level1/view_model/loginpage_controller.dart';


final loginPageProvider = StateNotifierProvider<
    LoginPageStateController, LoginPageState>((ref) {
  return LoginPageStateController(LoginPageState(
    passFiledController: TextEditingController(),
    emailFiledController: TextEditingController(),
  ));
});

class LoginPage extends HookConsumerWidget{
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final loginPageState = ref.watch(loginPageProvider);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(""),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: loginPageState.emailFiledController,
                  decoration: InputDecoration(
                      hintText: 'メールアドレス',
                      errorText: loginPageState.emailFiledErrorText,
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    errorText: loginPageState.passFiledErrorText,
                      hintText: 'パスワード'
                  ),
                  controller: loginPageState.passFiledController,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                      const TextSpan(text: "アカウントを作成していない方は"),
                      TextSpan(
                        text: "こちら",
                        recognizer: TapGestureRecognizer()..onTap=(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccountPage()));
                        },
                        style: const TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ]
                ),
              ),
              ElevatedButton(onPressed: ()async{
                final controller = ref.read(loginPageProvider.notifier);
                controller.checkControllerText();//空欄がいないかをチェック
                await controller.authenticationSignIn();//サイイン
                if(loginPageState.successSignIn is FirebaseException){

                }
                //TODO FireStoreから情報取得


              },
                child: const Text("ログイン"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

