import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level1/screens/chat_page.dart';
import 'package:sandbox_level1/view_model/user_list_page_controller.dart';

final userListPageProvider = StateNotifierProvider<
    UserListPageStateController, UserListPageState>((ref) {
  return UserListPageStateController(UserListPageState(
      allUserList: []
  ));
});

class UserListPage extends HookConsumerWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userListPageProvider);
    useEffect((){
      final _controller = ref.read(userListPageProvider.notifier);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _controller.getLoginAccount();//自分のアカウント情報をfetchしていなければとってくる
      });
      if(state.allUserList.isNotEmpty)return;
      _controller.fetchUserList();//全ユーザーのアカウント情報をとってくる
      return null;
    },const []);

    return Scaffold(
      appBar: AppBar(
        title: const Text("ユーザー 一覧"),
      ),
      body: state.allUserList.isEmpty || state.myAccount == null
        ? const Center(child: CircularProgressIndicator())
        : SafeArea(
        child: ListView.builder(
            itemCount: state.allUserList.length+1,
            itemBuilder: (BuildContext context, int index) {
              return index == 0
                  ? const SizedBox(height: 20)
                  : Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 10
                ),
                child: GestureDetector(
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
                                backgroundImage: NetworkImage(state.allUserList[index-1].imagePath)
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(state.allUserList[index-1].userName,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                            ],
                          )
                        ],
                      )
                  ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatPage(myAccount: state.myAccount!,otherAccount: state.allUserList[index-1],),
                        )
                    );
                  },
                ),
              );
            }
        ),
      ),

    );
  }
}
