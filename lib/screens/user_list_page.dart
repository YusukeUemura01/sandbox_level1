import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserListPage extends HookConsumerWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ユーザー 一覧"),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return index == 0
                  ? const SizedBox(height: 20)
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10
                      ),
                      child: Container(
                        //color: Colors.red,
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
                                backgroundImage: null,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("あいうえお",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                              ],
                            )
                          ],
                        )
                      ),
                  );
            }),
      ),
    );
  }
}
