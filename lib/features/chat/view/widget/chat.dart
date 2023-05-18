import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dialogflow_grpc/dialogflow_grpc.dart';
import 'package:dialogflow_grpc/generated/google/cloud/dialogflow/v2beta1/session.pb.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class Chat extends StatefulWidget {
  Chat({required Key key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  bool _isRecording = false;

  StreamSubscription? _recorderStatus;
  StreamSubscription<List<int>>? _audioStreamSubscription;
  BehaviorSubject<List<int>>? _audioStream;
  DialogflowGrpcV2Beta1? dialogflow;

  @override
  void initState() {
    super.initState();
    initPlugin();
  }

  Future<void> initPlugin() async {
    final serviceAccount = ServiceAccount.fromString(
        '${(await rootBundle.loadString('assets/chat/credentials.json'))}');
    dialogflow = DialogflowGrpcV2Beta1.viaServiceAccount(serviceAccount);
  }

  @override
  void dispose() {
    _recorderStatus?.cancel();
    _audioStreamSubscription?.cancel();
    super.dispose();
  }

  void handleSubmitted(text) async {
    print(text);
    _textController.clear();

    ChatMessage message = ChatMessage(
      text: text,
      name: "You",
      type: true,
    );

    setState(() {
      _messages.insert(0, message);
    });
    DetectIntentResponse? data = await dialogflow?.detectIntent(text, 'en-US');
    String? fulfillmentText = data?.queryResult.fulfillmentText;
    if (fulfillmentText != null) {
      if (fulfillmentText.isNotEmpty) {
        ChatMessage botMessage = ChatMessage(
          text: fulfillmentText,
          name: "FA",
          type: false,
        );
        setState(() {
          _messages.insert(0, botMessage);
        });
      }
    }
  }

  void handleStream() async {
    _audioStream = BehaviorSubject<List<int>>();


    var biasList = SpeechContextV2Beta1(phrases: [
      'Dialogflow CX',
      'Dialogflow Essentials',
      'Action Builder',
      'HIPAA'
    ], boost: 20.0);

    var config = InputConfigV2beta1(
        encoding: 'AUDIO_ENCODING_LINEAR_16',
        languageCode: 'en-US',
        sampleRateHertz: 16000,
        singleUtterance: false,
        speechContexts: [biasList]);

    final responseStream =
    dialogflow!.streamingDetectIntent(config, _audioStream!);

    responseStream.listen((data) {
      setState(() {
        String transcript = data.recognitionResult.transcript;
        String queryText = data.queryResult.queryText;
        String fulfillmentText = data.queryResult.fulfillmentText;

        if (fulfillmentText.isNotEmpty) {
          ChatMessage message = new ChatMessage(
            text: queryText,
            name: "You",
            type: true,
          );

          ChatMessage botMessage = new ChatMessage(
            text: fulfillmentText,
            name: "Bot",
            type: false,
          );

          _messages.insert(0, message);
          _textController.clear();
          _messages.insert(0, botMessage);
        }
        if (transcript.isNotEmpty) {
          _textController.text = transcript;
        }
      });
    }, onError: (e) {}, onDone: () {});
  }

  void stopStream() async {
    await _audioStreamSubscription?.cancel();
    await _audioStream?.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: <Widget>[
        ForgetPasswordBarWidget(onPressed: () => pop(context), title: "Chat Bot"),
        Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            )),
        Divider(height: 1.0),

        Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: IconTheme(
              data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        controller: _textController,
                        onSubmitted: handleSubmitted,
                        decoration:
                        InputDecoration.collapsed(hintText: "Send a message"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      child: IconButton(
                        icon: Icon(Icons.send,color: AppColors.primary),
                        onPressed: () => handleSubmitted(_textController.text),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ]),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({required this.text, required this.name, required this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Stack(children: [
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.2.w),
                      borderRadius: BorderRadius.circular(50.sp),color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white),
                  child: AppSVG(assetName: "logo"),height: 25.sp,width: 25.sp,)
            ]),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(right: 4.0, top: 6),
              child:
              Text(this.name, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
      new Expanded(
        child: Container(
          margin:  EdgeInsets.only(top: 5.0),
          child: BubbleSpecialOne(
            text: text,
            isSender: false,
            color: AppColors.primary,
            textStyle: TextStyle(
              fontSize: 18.sp,
              color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,
            ),
          ),
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: BubbleSpecialOne(
                text: text,
                isSender: true,
                color: AppColors.hint,
                textStyle: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      Column(
        children: [
          Container(
            child: CircleAvatar(
              child: Text(
                this.name[0],
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 4.0, top: 6),
            child:
            Text(this.name, style: Theme.of(context).textTheme.subtitle1),
          )
        ],
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}