
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class Homeprovider extends ChangeNotifier
{
  int sindex=0;
  bool icon=false;
  Duration time=Duration(seconds: 0);
  AssetsAudioPlayer audioPlayer=AssetsAudioPlayer();
  List name=[
    "Bejeweled",
    "Cold/Mess",
    "Dangerously",
    "Escapism",
    "Family Line",
    "Flowers",
    "Hot Mess",
    "I Wanna Be Yours",
    "If we Ever Broke Up",
    "Lavender Haze",

  ];
  List<Color> color=[
    Colors.blue.shade900,
    Colors.blue.shade500,
    Colors.blue.shade300,
    Colors.green.shade700,
    Colors.green.shade300,
    Colors.green.shade100,
    Colors.orangeAccent.shade400,
    Colors.orangeAccent.shade100,
    Colors.yellow.shade200,
    Colors.red,

  ];
  List images=[
    "assets/images/bejeweled.png",
    "assets/images/cold mess.jpg",
    "assets/images/dangerously.jpg",
    "assets/images/escapism.jpg",
    "assets/images/family line.jpg",
    "assets/images/flowers.jpg",
    "assets/images/hot mess.jpg",
    "assets/images/i wanna be yours.jpg",
    "assets/images/if we ever broke up.jpg",
    "assets/images/lavender haze.jpg",
  ];
  List subname=[
    "Taylor Swift",
    "Prateek Kuhad",
    "Charlie Puth",
    "RAYE, 070 Shake",
    "Conan Gray",
    "Miley Cyrus",
    "Zoe Clark",
    "Arctic Monkeys",
    "Mae Stephens",
    "Taylor Swift",

  ];
  List<Audio> audio=[
    Audio("asset/audio/bejeweled.mp3"),
    Audio("asset/audio/cold mess.mp3"),
    Audio("asset/audio/dangerously.mp3"),
    Audio("asset/audio/escapism.mp3"),
    Audio("asset/audio/family line.mpeg"),
    Audio("asset/audio/flowers.mp3"),
    Audio("asset/audio/hot mess.mp3"),
    Audio("asset/audio/i wanna be yours.mp3"),
    Audio("asset/audio/if we ever broke up.mp3"),
    Audio("asset/audio/lavender haze.mp3"),

  ];
  void song(int index)
  {
    sindex=index;
    notifyListeners();
  }
  Future<void> nextsong()
  async {
     await audioPlayer.next();


  }
  Future<void> presong()
  async {
    await audioPlayer.previous();

  }
  Future<void> play()
  async {
  await audioPlayer.playOrPause();
  }
  void initsong()
  {
    audioPlayer=AssetsAudioPlayer();
    audioPlayer.open(Audio("assets/audio/escapism.mp3"),
    autoStart: false);
    notifyListeners();

  }
  void totaltime()
  {
    audioPlayer.current.listen((event) {
      time=event!.audio.duration;
      notifyListeners();
    });

  }
  void iconchanged()
  {
    icon=!icon;
    notifyListeners();
  }
}