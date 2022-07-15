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
      appBar: AppBar(
        elevation: 0,
        title: const Text("チャット"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: myChatListPageState.talkRoomList.isEmpty || myChatListPageState.otherAccountList.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
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
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 1/2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(myChatListPageState.otherAccountList[index].userName,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                                  const SizedBox(height: 7,),
                                  Container(
                                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 1/2),
                                    child: Text(
                                      myChatListPageState.talkRoomList[index].finalSendContent,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            myChatListPageState.talkRoomList[index].finalUpdateUserID != myChatListPageState.myAccount!.id
                                ? Padding(
                              padding: const EdgeInsets.only(left: 15,top: 15),
                              child: CircleAvatar(
                                radius: 17,
                                backgroundColor: const Color.fromARGB(255, 255, 45, 136),
                                child: Text(myChatListPageState.talkRoomList[index].unreadMessageCount.toString(),style: const TextStyle(color: Colors.white)),
                              ),
                            )
                                : const SizedBox(),
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

