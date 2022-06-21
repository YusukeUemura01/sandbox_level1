import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sandbox_level1/screens/create_accout_page.dart';


class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  controller: emailController,
                  decoration: const InputDecoration(
                      hintText: 'メールアドレス'
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: 'パスワード'
                  ),
                  controller: passController,
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

