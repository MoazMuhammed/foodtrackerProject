import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = <String>[];

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.insert(0, text);
    });
  }

  Widget _buildTextComposer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(hintText: 'Send a message'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return Flexible(
      child:


      ListView.builder(
        padding: EdgeInsets.all(8.0),
        reverse: true,
        itemCount: _messages.length,
        itemBuilder: (_, int index) => _buildMessageItem(_messages[index]),
      ),



    );
  }

  Widget _buildMessageItem(String message) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(backgroundColor: Colors.white,
              child: AppImage(imageUrl: "https://media.istockphoto.com/id/1309328823/photo/headshot-portrait-of-smiling-male-employee-in-office.jpg?b=1&s=612x612&w=0&k=20&c=eU56mZTN4ZXYDJ2SR2DFcQahxEnIl3CiqpP3SOQVbbI=", width:10.w, height: 10.h, borderRadius: BorderRadius.circular(20.sp)),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Moaz Muhammed', style: Theme.of(context).textTheme.subtitle1),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(message),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ForgetPasswordBarWidget(onPressed: () => pop(context), title: "Chat"),
            _buildMessageList(),
            Divider(height: 1.0),
            _buildTextComposer(),
          ],
        ),
      ),
    );
  }
}