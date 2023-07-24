import 'package:flutter/material.dart';
import 'package:friday/featureBox.dart';
import 'package:friday/openai_service.dart';
import 'package:friday/pallete.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'chatPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SpeechToText speechToText = SpeechToText();
  TextToSpeech flutterTts = TextToSpeech();
  bool speechEnabled = false;
  String lastwords = '';
  String? genereatedText;
  String? generatedUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroudColor,
      appBar: AppBar(
        backgroundColor: Pallete.appbarColor,
        foregroundColor: Pallete.textColor,
        leading: const Icon(
          Icons.menu,
          weight: 600,
        ),
        title: const Text(
          'Friday',
          style: TextStyle(
            fontFamily: 'Cera Pro',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                        color:
                            Pallete.appbarColor, //Pallete.assistantCircleColor,
                        shape: BoxShape.circle),
                  ),
                ),
                Container(
                  height: 123,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/playstore.png'),
                    ),
                  ),
                ),
              ],
            ),
            // Container(
            //   margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
            //     top: 30,
            //   ),
            //   padding: const EdgeInsets.symmetric(
            //     vertical: 20,
            //     horizontal: 10,
            //   ),
            //   decoration: BoxDecoration(
            //       borderRadius: const BorderRadius.all(Radius.circular(20))
            //           .copyWith(topLeft: Radius.circular(0)),
            //       border: Border.all(
            //         color: Pallete.borderColor,
            //       )),
            //   child: const Text(
            //     'Hi, what task can I do for you?',
            //     style: TextStyle(
            //         fontFamily: 'Cera Pro',
            //         fontSize: 25,
            //         color: Pallete.textColor),
            //   ),
            // ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 40).copyWith(
                top: 30,
              ),
              child: const Text(
                'Features offered',
                style: TextStyle(
                    fontFamily: 'Cera Pro',
                    fontSize: 20,
                    color: Pallete.textColor),
              ),
            ),
            Column(
              children: const [
                FeatureBox(
                  header: 'ChatGPT',
                  decription: 'A smarter way to stay oragnized and informed.',
                  color: Pallete.firstSuggestionBoxColor,
                ),
                FeatureBox(
                  header: 'Dall-E',
                  decription:
                      'Get inspired and stay creative with your personal assistant powered by Dall-E.',
                  color: Pallete.secondSuggestionBoxColor,
                ),
                // FeatureBox(
                //   header: 'Smart Voice Assistant',
                //   decription:
                //       'Get the best of both world with a voice assistant powered by ChatGPT and Dall-E.',
                //   color: Pallete.thirdSuggestionBoxColor,
                // ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Pallete.firstSuggestionBoxColor,
        onPressed: () async {
          // if (speechToText.isNotListening && speechToText.isAvailable) {
          //   startListening();
          // } else if (speechToText.isListening) {
          //   //final speech = await openAIService.isArtPrompt(lastwords);
          //   print(lastwords);
          //   systemSpeech(lastwords);
          //   stopListening();
          // } else {
          //   initSpeech();
          // }
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const chatPage()));
        },
        child: const Icon(Icons.open_in_new),
      ),
    );
  }
}
