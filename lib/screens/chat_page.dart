import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart'as intl;
import 'package:sandbox_level1/model/account.dart';
import 'package:sandbox_level1/view_model/chat_page_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


final chatPageStateProvider = StateNotifierProvider<
    ChatPageController, ChatPageState>((ref) {
  return ChatPageController(ChatPageState(
    newMessageController: TextEditingController(),

  ));
});

class ChatPage extends HookConsumerWidget{
  final Account myAccount;
  final Account otherAccount;
  const ChatPage({Key? key,required this.myAccount,required this.otherAccount}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final chatPageState = ref.watch(chatPageStateProvider);
    useEffect((){
      final controller = ref.read(chatPageStateProvider.notifier);
      controller.getTalkRoomInfo(otherAccount);
      return null;//
    },const []);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 110),
              child: ListView.builder(
                  itemCount: chatPageState.messageList.length,
                  reverse: true,
                  physics: const RangeMaintainingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        textDirection: chatPageState.messageList[index].sendAccountID == myAccount.id ? TextDirection.ltr : TextDirection.rtl,
                        children: [
                          Container(
                              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.6),
                              decoration: BoxDecoration(
                                color: chatPageState.messageList[index].sendAccountID == myAccount.id ? Colors.grey:Colors.blue,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text(chatPageState.messageList[index].content)),
                              )
                          ),
                          const SizedBox(width: 7),
                          Text(intl.DateFormat("MMM d HH:mm").format(chatPageState.messageList[index].sendTime),style: TextStyle(fontSize: 13),),
                        ],
                      ),
                    );
                  }
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            controller: chatPageState.newMessageController,
                            textInputAction: TextInputAction.newline,
                            maxLines: null,
                            decoration: const InputDecoration(
                                alignLabelWithHint: true,
                          border: OutlineInputBorder(

                          )
                        ),
                      )),
                      IconButton(
                          onPressed: ()async{
                            final controller = ref.read(chatPageStateProvider.notifier);
                            if(chatPageState.chatRoomId == null){//トークルームが存在しないときトークルームを作る
                              await controller.createChatRoom(myAccount, otherAccount);
                            }
                            await controller.addMessage(myAccount);
                            controller.clearAddMessageFiled();
                          },
                          icon: const Icon(Icons.send),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
