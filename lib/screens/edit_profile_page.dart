import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../view_model/edit_profile_page_controller.dart';

final editProfilePageProvider = StateNotifierProvider<
    EditProfilePageController, EditProfilePageState>((ref) {
  return EditProfilePageController(EditProfilePageState(
      textEditingController: TextEditingController(
      )
  ));
});

class EditProfilePage extends HookConsumerWidget{
  const EditProfilePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final editProfilePageState = ref.watch(editProfilePageProvider);
    useEffect((){
      final controller = ref.read(editProfilePageProvider.notifier);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.setLoginAccount();//自分のアカウントをセットする。自分のアカウント情報をfetchしていなければとってくる
      });
      return null;
    },const []);
    return Scaffold(
      appBar: AppBar(
        title: const Text("プロフィール編集"),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: editProfilePageState.myAccount == null
        ? const Center(child: CircularProgressIndicator())
        : Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async{
                          final controller = ref.read(editProfilePageProvider.notifier);
                          await controller.pickAccountImage();
                        },
                        child: CircleAvatar(
                          backgroundImage:
                          editProfilePageState.newAccountImage == null
                              ? NetworkImage(editProfilePageState.myAccount!.imagePath)
                              : FileImage(editProfilePageState.newAccountImage!) as ImageProvider,
                          //イメージがnullのときはなし
                          radius: 40,
                          child: Icon(Icons.add,color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: editProfilePageState.textEditingController,
                          decoration: const InputDecoration(hintText: "名前"),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            final controller = ref.read(editProfilePageProvider.notifier);
                            controller.changeLoading();
                            final url = await controller.uploadImage();
                            await controller.updateAccountData(url);
                            controller.changeLoading();
                          },
                          child: const Text("更新")
                      )
                    ],
                  ),
                ),
              ),
            ),
            editProfilePageState.isLoading
            ? const Center(child: CircularProgressIndicator())
            : const SizedBox()
          ],
        ),
    );
  }
}
