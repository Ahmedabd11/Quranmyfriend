import 'package:flutter/material.dart';

class Hintsfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""
            "Hints",
        ),
        backgroundColor: Colors.black54,
      ),
      body:
    Container(
       alignment: Alignment.center,
    decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage("images/kam.jpg",
          ),
          fit: BoxFit.cover,
          ),
          ),
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "\nSentences to use\n"
                        "\n*I am sad*\n\n*I am happy*\n\n*dua for heart*\n\n*reward for good deeds*\n\n*what is Quran*\n\n*what is world*\n\n*who is successful*\n\n*who is muslim*\n\n*why we follow*\n\n*Allah Tala Bula rahe hain*",
                        style: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],

                  ),
                ),


          ),


    );
  }
}
