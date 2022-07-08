import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level1/screens/chat_page.dart';

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
    final myChatListPageState = ref.watch(myChatListPageProvider);
    useEffect((){
      final controller = ref.read(myChatListPageProvider.notifier);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.setLoginAccount();//自分のアカウントをセットする。自分のアカウント情報をfetchしていなければとってくる
      });
      controller.fetchMessageList();
      return null;

    },const []);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: myChatListPageState.talkRoomList.length,
              itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: SizedBox(
                      width: 100,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 10),
                          SizedBox(
                            height: 53,
                            width: 53,
                            child: CircleAvatar(
                                backgroundImage: NetworkImage(myChatListPageState.otherAccountList[index].imagePath)
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(myChatListPageState.otherAccountList[index].userName,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                              const SizedBox(height: 7,),
                              Text(myChatListPageState.talkRoomList[index].finalSendContent)
                            ],
                          )
                        ],
                      )
                  ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatPage(
                            myAccount: myChatListPageState.myAccount!,
                            otherAccount: myChatListPageState.otherAccountList[index],
                            talkRoom: myChatListPageState.talkRoomList[index],
                        ))
                    );
                  },
                );
              }
            )
          ],
        ),
      ),

    );
  }
}

