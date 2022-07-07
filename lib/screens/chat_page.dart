import 'package:bubble/bubble.dart';
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




const styleSomebody = BubbleStyle(
  nip: BubbleNip.rightBottom,
  color: Color.fromARGB(255, 225, 255, 199),
  borderColor: Colors.blue,
  borderWidth: 1,
  elevation: 4,
  margin: BubbleEdges.only(top: 8, right: 10),
  alignment: Alignment.topRight
);


const styleMe = BubbleStyle(
  nip: BubbleNip.leftBottom,
  color: Colors.white,
  borderColor: Colors.blue,
  borderWidth: 1,
  elevation: 4,
  margin: BubbleEdges.only(top: 8, left: 10),
  alignment: Alignment.topLeft
);




class ChatPage extends HookConsumerWidget{
  final Account myAccount;
  final Account otherAccount;
  const ChatPage({Key? key,required this.myAccount,required this.otherAccount}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final chatPageState = ref.watch(chatPageStateProvider);
    useEffect((){
      final controller = ref.read(chatPageStateProvider.notifier);
      controller.getTalkRoomInfo(myAccount,otherAccount);//トークルームidとメッセージリストをとってくる
      return null;
    },const []);

    return Scaffold(
      appBar: AppBar(
        title: Text(otherAccount.userName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            final controller = ref.read(chatPageStateProvider.notifier);
            controller.initializedMessageList();//画面を閉じる時にメッセージリストを初期化しておく
            Navigator.pop(context);
          },
        ),
      ),
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
                          CircleAvatar(
                            backgroundImage: chatPageState.messageList[index].sendAccountID == myAccount.id
                                ? NetworkImage(myAccount.imagePath)
                                : NetworkImage(otherAccount.imagePath)
                          ),
                          Bubble(
                            child: Container(
                                child: Text(chatPageState.messageList[index].content),
                                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.5),
                            ),
                            style: chatPageState.messageList[index].sendAccountID == myAccount.id ? styleMe : styleSomebody
                          ),
                          const SizedBox(width: 7),
                          Text(intl.DateFormat("MMM d HH:mm").format(chatPageState.messageList[index].sendTime),style: const TextStyle(fontSize: 13),),
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
                child: SizedBox(
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
                          onPressed: () async {
                            final controller = ref.read(chatPageStateProvider.notifier);

                            await controller.addMessage(myAccount);//メッセージ追加
                            controller.clearAddMessageFiled();//メッセージ追加できたらtextFieldを初期化
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
