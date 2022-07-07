import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../view_model/my_chat_list_page_controller.dart';



final myChatListPageProvider = StateNotifierProvider<
    MyChatListPageController, MyChatListPageState>((ref) {
  return MyChatListPageController(MyChatListPageState(

  ));
});

class MyChatListPage extends HookConsumerWidget {
  const MyChatListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    useEffect((){
      final controller = ref.read(myChatListPageProvider.notifier);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.setLoginAccount();//自分のアカウントをセットする。自分のアカウント情報をfetchしていなければとってくる
      });
      controller.fetchMessageList();
      return null;

    },const []);
    return Scaffold(
      body: Container(),

    );
  }
}

