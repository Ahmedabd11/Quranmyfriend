import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class video extends StatefulWidget {
  String text;
  video({Key key,this.text}) : super(key: key);
  @override
  _videoState createState() => _videoState();
}

class _videoState extends State<video> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    if(widget.text=="I am sad")
      {
        _controller = VideoPlayerController.asset("videos/quran.mp4");
      }
    else if(widget.text=="I am happy")
      {
        _controller = VideoPlayerController.asset("videos/YaRabbi.mp4");
      }
    else if(widget.text=="dua for heart")
    {
      _controller = VideoPlayerController.asset("videos/Duaforheartmp4.mp4");
    }
    else if(widget.text=="reward for good deeds")
    {
      _controller = VideoPlayerController.asset("videos/rewardforgooddeeds.mp4");
    }
    else if(widget.text=="what is Quran")
    {
      _controller = VideoPlayerController.asset("videos/WhatisQuran.mp4");
    }
    else if(widget.text=="what is world")
    {
      _controller = VideoPlayerController.asset("videos/whatisworld.mp4");
    }
    else if(widget.text=="who is successful")
    {
      _controller = VideoPlayerController.asset("videos/Who is Succesful.mp4");
    }
    else if(widget.text=="who is muslim")
    {
      _controller = VideoPlayerController.asset("videos/whoisMomin.mp4");
    }
    else if(widget.text=="why we follow")
    {
      _controller = VideoPlayerController.asset("videos/whywefollowdeen.mp4");
    }
    else if(widget.text=="Allah Tala Bula rahe hain")
    {
      _controller = VideoPlayerController.asset("videos/AllahisCalling.mp4");
    }
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(false);
    _controller.setVolume(1.0);
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is For You :)"
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child:
        Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
      backgroundColor: Colors.black,
    );
  }
}
