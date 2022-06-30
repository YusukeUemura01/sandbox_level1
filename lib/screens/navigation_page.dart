import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level1/screens/my_profile_page.dart';
import 'package:sandbox_level1/screens/mychatpage.dart';
import 'package:sandbox_level1/screens/user_list_page.dart';
import 'package:sandbox_level1/view_model/navigation_page_controller.dart';


final navigationPageProvider = StateNotifierProvider<NavigationPageController,NavigationPageState>((ref){
  return NavigationPageController(
      NavigationPageState(
        pageList: const [UserListPage(),MyChatPage(),MyProfilePage()],
        bottomNavigationIndex: 0,
      ),
  );
});

class NavigationPage extends HookConsumerWidget {

  const NavigationPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final state = ref.watch(navigationPageProvider);
    return Scaffold(
      body: state.pageList[state.bottomNavigationIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: state.bottomNavigationIndex,
          onTap: (value){
            final controller = ref.read(navigationPageProvider.notifier);
            controller.changeBottomNavigationIndex(value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "ユーザ",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "チャット",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "プロフィール",
            ),
          ],
      ),
    );
  }
}
