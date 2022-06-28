import 'package:flutter/material.dart';


class MyChatPage extends StatelessWidget {
  const MyChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context,index){
            return Container(

            );
          }
      ),
    );
  }
}
