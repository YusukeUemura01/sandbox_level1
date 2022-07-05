
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level1/screens/navigation_page.dart';
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
  const CreateAccountPage({Key? key}) : super(key: key);

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
                        final utils = FunctionUtils();
                        controller.changeIsLoading();//サークルインジェクターを出す
                        controller.initializeErrorText(); //エラーテキスト初期化
                        final existEmptyField = controller.checkTextFiledError();//空欄がないかチェック
                        if (existEmptyField) {//空欄があったときエラー
                          controller.changeIsLoading();
                          return;
                        }

                        final singUpErrorException = await controller.authenticationSignUp();//signup
                        if(singUpErrorException != null){//エラーがかえってきたときエラーダイアログを出す
                          controller.changeIsLoading();
                          utils.showErrorDialog(context,singUpErrorException);//エラーダイアログ
                          return;
                        }


                        final uploadIconImageErrorException = await controller.upLoadIconImage();//iconImageをアップロード
                        if(uploadIconImageErrorException != null){//エラーがかえってきたときエラーダイアログを出す
                          controller.changeIsLoading();
                          utils.showErrorDialog(context,uploadIconImageErrorException);//エラーダイアログ
                          return;
                        }

                        final setAccountErrorException = await controller.setAccountData();
                        if(setAccountErrorException != null){//エラーがかえってきたときエラーダイアログを出す
                          controller.changeIsLoading();
                          utils.showErrorDialog(context,setAccountErrorException);//エラーダイアログ
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
}
