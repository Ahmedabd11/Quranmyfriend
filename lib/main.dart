import 'dart:ui';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/SplashScreen.dart';
import 'package:myapp/hints.dart';
import 'package:myapp/videoCollection.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;



void main() {
  runApp(MaterialApp(
      home: SplashScreen(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.red,
      visualDensity: VisualDensity.adaptivePlatformDensity,

    ),
  ));
}
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  stt.SpeechToText _speach;
  bool _islistening = false;
  String _text = "Press a button and talk to ALLAH";
  double _confidence = 1.0;
  @override
  void initState() {

    super.initState();
    _speach = stt.SpeechToText();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Qur'an Hamara Dost"
        ),
        backgroundColor: Colors.black,

      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate:_islistening,
        glowColor: Colors.red,
        endRadius: 135.0,
        duration: const Duration(milliseconds: 1000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat:true,
        child: FloatingActionButton(

          onPressed: () {
            _listen();
            if(_text=='I am sad'||_text=='I am happy'||_text=='dua for heart'||_text=='reward for good deeds'||_text=='what is Quran'||_text=='what is world'||_text=='who is successful'||_text=='who is muslim'||_text=='why we follow'||_text=='Allah Tala Bula rahe hain')
            {
              check(_text);
              _text="";
            }

          },

          child: Icon(_islistening ? Icons.mic : Icons.mic_none),
        ),
      ),

     body:
     Container(
     alignment: Alignment.topCenter,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("images/1.jpeg",
    ),
    fit: BoxFit.cover,
    ),
    ),
     child:SingleChildScrollView(
       reverse: true,
       child: Container(
         child: Row(
           children: [
             Container(
               padding: const EdgeInsets.fromLTRB(30, 30, 30, 120),
               child: Text(
                 _text,
                 style: TextStyle(

                   fontSize: 14,
                   fontStyle: FontStyle.italic,
                   color: Colors.white54,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),
             Container(
               margin: EdgeInsets.all(5),
               child: FlatButton(
                 minWidth: 10.0,
                 height: 20.0,
                 child: Text('Hints', style: TextStyle(fontSize: 10.0),),
                 color: Colors.red,
                 textColor: Colors.white,
                 onPressed: () {
                   checkhints();
                 },
               ),
             ),


           ],
         )


       ),
     ),
     ),
      backgroundColor: Colors.black,

    );

  }
  void _listen() async {
    if (!_islistening) {
      bool available = await _speach.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _islistening = true);
        _speach.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;



            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );

      }
    } else {
      setState(() => _islistening = false);
      _speach.stop();
    }

  }

  void check (String Text1)
  {
    _islistening = false;
    Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) => video(text: Text1,)));

  }
  void checkhints ()
  {
    _islistening = false;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Hintsfile()));

  }



}



