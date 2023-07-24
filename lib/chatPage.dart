import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:friday/openai_service.dart';
import 'package:friday/pallete.dart';
import 'textBox.dart';

class chatPage extends StatefulWidget {
  const chatPage({super.key});

  @override
  State<chatPage> createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  bool _isloading = false;
  String lastMessage = '';
  OpenAIService openAi = OpenAIService();
  final TextEditingController _textEditingController = TextEditingController();
  // List<Map> message = [
  //   {
  //     'role': 'user',
  //     'content': 'what is ai?',
  //   },
  //   {
  //     'role': 'assistant',
  //     'content': 'ai is a tool',
  //   },
  //   {
  //     'role': 'user',
  //     'content':
  //         'fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff',
  //   },
  //   {
  //     'role': 'assistant',
  //     'content': 'rrrrrrrrrrrrrrrrrrrrrrrrrrrrreeeeeeeeeeeeeeeeeeeeeeeeeeeeeee',
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        backgroundColor: Pallete.backgroudColor,
        appBar: AppBar(
          backgroundColor: Pallete.appbarColor,
          foregroundColor: Pallete.textColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: Pallete.getHeight(context) * 0.045,
                width: Pallete.getHeight(context) * 0.045,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  //color: Colors.grey,
                ),
                child: const Image(
                    image: AssetImage('assets/images/playstore.png')),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'Friday',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Cera Pro',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: 0,
                    child: Text('Clear chat'),
                  )
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  setState(() {
                    openAi.messages.clear();
                  });
                }
              },
            )
          ],
          elevation: 0,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Pallete.getHeight(context) * 0.8,
                width: double.infinity,
                child: openAi.messages.length != 0
                    ? ListView(
                        children: openAi.messages
                            .map((e) => TextBox(message: e))
                            .toList())
                    : const Center(
                        child: Text(
                          'Start Conversation...',
                          style: TextStyle(
                            color: Pallete.convoColor,
                            fontFamily: 'PT Sans',
                            fontSize: 16,
                          ),
                        ),
                      ),
              ),
              SizedBox(
                //padding: EdgeInsets.symmetric(horizontal: 5),
                height: 60,
                width: Pallete.getWidth(context),
                child: Row(
                  children: [
                    Container(
                      height: Pallete.getHeight(context) * 0.9,
                      width: Pallete.getWidth(context) * 0.8,
                      margin: EdgeInsets.fromLTRB(5, 5, 2, 5),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Pallete.textfieldColor,
                          borderRadius: BorderRadius.all(Radius.circular(
                              (Pallete.getHeight(context) * 0.9) / 2))),
                      child: TextField(
                        textCapitalization: TextCapitalization.sentences,
                        controller: _textEditingController,
                        onChanged: (value) {
                          lastMessage = value;
                        },
                        style: const TextStyle(
                          color: Pallete.convoColor,
                        ),
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            color: Pallete.convoColor,
                          ),
                          hintText: 'Enter something...',
                          contentPadding: EdgeInsets.all(1.0),
                          enabledBorder: UnderlineInputBorder(
                              //borderSide: BorderSide(color: Colors.white),
                              ),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        height: Pallete.getWidth(context) * 0.15,
                        width: Pallete.getWidth(context) * 0.15,
                        decoration: BoxDecoration(
                          color: Pallete.firstSuggestionBoxColor,
                          borderRadius: BorderRadius.all((Radius.circular(
                                  Pallete.getHeight(context) * 0.9)) /
                              2),
                        ),
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.send),
                      ),
                      onTap: () {
                        if (lastMessage != '') {
                          // message.add({
                          //   'role': 'user',
                          //   'content': lastMessage,
                          // });
                          setState(() {
                            FocusManager.instance.primaryFocus?.unfocus();
                            _isloading = true;
                          });
                          openAi.isArtPrompt(lastMessage).then(
                            (value) {
                              setState(() {
                                _textEditingController.text = '';

                                print(value);
                                _isloading = false;
                              });
                            },
                          );
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        )),
      ),
      if (_isloading)
        const Opacity(
          opacity: 0.8,
          child: ModalBarrier(
            dismissible: false,
            color: Pallete.blackColor,
          ),
        ),
      if (_isloading)
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                height: 80,
                width: 80,
                image: AssetImage('assets/images/playstore.png'),
              ),
              SizedBox(
                height: Pallete.getHeight(context) * 0.1,
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20),
              //   child: LinearProgressIndicator(
              //     minHeight: 8,
              //     color: Pallete.firstSuggestionBoxColor,
              //     semanticsLabel: 'Please wait...',
              //   ),
              // ),
              const CircularProgressIndicator(
                color: Pallete.firstSuggestionBoxColor,
              ),
            ],
          ),
        )
    ]);
  }
}
