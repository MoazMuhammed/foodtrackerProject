import 'package:flutter/material.dart';
import 'package:foodtracker/core/widgets/app_bar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
           AppBarWidget(),
        Expanded(child: Column())
        ],
      ),
    ));
  }
}
