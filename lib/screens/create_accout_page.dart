import 'package:flutter/material.dart';
class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  },
                  child: const CircleAvatar(
                    foregroundImage: null,
                    radius: 40,
                    child: Icon(Icons.add),
                  ),
                ),
                Container(
                  width: 300,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(hintText: "名前"),
                  ),
                ),
                Container(
                  width: 300,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: "メールアドレス"),
                  ),
                ),
                Container(
                  width: 300,
                  child: TextField(
                    controller: passController,
                    decoration: InputDecoration(hintText: "パスワード"),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () async {

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

