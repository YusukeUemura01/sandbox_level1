import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level1/screens/create_accout_page.dart';
import 'package:sandbox_level1/screens/navigation_page.dart';
import 'package:sandbox_level1/utils/function_utils.dart';
import 'package:sandbox_level1/view_model/loginpage_controller.dart';


final loginPageProvider = StateNotifierProvider<
    LoginPageStateController, LoginPageState>((ref) {
  return LoginPageStateController(LoginPageState(
    passFiledController: TextEditingController(),
    emailFiledController: TextEditingController(),
  ));
});

class LoginPage extends HookConsumerWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final loginPageState = ref.watch(loginPageProvider);
    return Scaffold(
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
                          style: TextStyle(color: Theme.of(context).textTheme.bodyText2!.color),
                          children: [
                            const TextSpan(text: "アカウントを作成していない方は"),
                            TextSpan(
                              text: "こちら",
                              recognizer: TapGestureRecognizer()..onTap=(){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateAccountPage()));
                              },
                              style: const TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ]
                      ),
                    ),
                    ElevatedButton(onPressed: () async {
                      final controller = ref.read(loginPageProvider.notifier);
                      final FunctionUtils utils = FunctionUtils();
                      controller.initializeErrorText();
                      controller.changeIsLoading();

                      final _existEmptyFiled = controller.checkTextFiledError();//空欄がいないかをチェック

                      if(_existEmptyFiled){
                        controller.changeIsLoading();
                        return;
                      }


                      final _signInErrorException = await controller.authenticationSignIn();//サイイン
                      if(_signInErrorException != null){
                        controller.changeIsLoading();
                        utils.showErrorDialog(context,_signInErrorException);//エラーダイアログ
                        return;
                      }


                      final _getAccountDataErrorException = await controller.getAccountData();//Account情報とってくる
                      if(_getAccountDataErrorException != null){
                        controller.changeIsLoading();
                        utils.showErrorDialog(context,_getAccountDataErrorException);//エラーダイアログ
                        return;
                      }

                      controller.changeIsLoading();

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const NavigationPage();
                          },
                        ),
                      );
                    },
                      child: const Text("ログイン"),
                    )
                  ],
                ),
              ),
            ),
            loginPageState.isLoading == true
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
}

