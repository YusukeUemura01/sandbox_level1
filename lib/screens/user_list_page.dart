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
      final controller = ref.read(userListPageProvider.notifier);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.setLoginAccount();//自分のアカウントをセットする。自分のアカウント情報をfetchしていなければとってくる
      });
      
      if(state.allUserList.isNotEmpty)return;
      controller.fetchUserList();//全ユーザーのアカウント情報をとってくる
      return null;
    },const []);

    return Scaffold(
      appBar: AppBar(
        title: const Text("ユーザー"),
      ),
      body: state.allUserList.isEmpty || state.myAccount == null
        ? const Center(child: CircularProgressIndicator())
        : SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: CircleAvatar(
                          backgroundImage: NetworkImage(state.myAccount!.imagePath)
                      ),
                    ),
                    const SizedBox(width: 20,),

                    Text(state.myAccount!.userName,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  ],
                ),
                const SizedBox(height: 50),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("ユーザー 一覧",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                const Divider(color: Colors.blueGrey,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.allUserList.length,
                    itemBuilder: (BuildContext context, int index) {
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
                                      backgroundImage: NetworkImage(state.allUserList[index].imagePath)
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(state.allUserList[index].userName,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                                  ],
                                )
                              ],
                            )
                        ),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ChatPage(myAccount: state.myAccount!,otherAccount: state.allUserList[index],),
                              )
                          );
                        },
                      );
                    }
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
