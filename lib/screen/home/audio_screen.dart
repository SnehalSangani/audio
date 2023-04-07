import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio/screen/home/provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  Homeprovider? hptrue;
  Homeprovider? hpfalse;

  @override
  Widget build(BuildContext context) {
    hpfalse=Provider.of<Homeprovider>(context,listen: false);
    hptrue=Provider.of<Homeprovider>(context,listen: true);
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Audio"),
          centerTitle: true,
        ),
        body: PlayerBuilder.isPlaying(
          player: hptrue!.audioPlayer,
          builder: (context, isPlaying) {
            return Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 480,width: double.infinity,
                      child: Image.asset("${hptrue!.images[index]}",fit: BoxFit.cover,),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: () {
                      hpfalse!.presong();

                    }, icon: Icon(Icons.skip_previous,size: 35,),),
                    IconButton(onPressed: () {
                      hpfalse!.play();
                      hpfalse!.iconchanged();

                    }, icon: hptrue!.icon ?Icon(Icons.pause,color: Colors.black,size: 35,) : Icon(Icons.play_arrow,color: Colors.black,size: 35,)),
                    IconButton(onPressed: () {
                      hpfalse!.nextsong();

                    }, icon: Icon(Icons.skip_next,size: 35,),),
                  ],
                ),
                SizedBox(height: 10,),
                PlayerBuilder.currentPosition(
                  player: hptrue!.audioPlayer,
                  builder: (context, position) {
                    return  Column(
                      children: [
                        Slider(
                          max: hptrue!.time.inSeconds.toDouble(),
                          value: position.inSeconds.toDouble(), onChanged: (value) {
                          hptrue!.audioPlayer.seek(Duration(seconds: value.toInt()));

                        },
                          inactiveColor: Colors.black12,
                          activeColor: Colors.black,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(height: 20,),
                              Text("${position.inSeconds}",style: TextStyle(color: Colors.black),),
                              Spacer(),
                              Text("${hptrue!.time.inSeconds.toDouble()}",style: TextStyle(color:Colors.black ),),
                            ],
                          ),
                        )
                      ],
                    );
                    
                  },
                ),
              ],
            );
          },
        ),

      ),
    );
  }
}