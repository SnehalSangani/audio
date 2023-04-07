
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Homeprovider? hptrue;
  Homeprovider? hpfalse;
  @override
  Widget build(BuildContext context) {
    hpfalse=Provider.of<Homeprovider>(context,listen: false);
    hptrue=Provider.of<Homeprovider>(context,listen: true);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("RAINBOW MUSIC"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 70,
            width: 350,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              color: hptrue!.color[index],
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'second',arguments: index);
              },
              child: ListTile(
                leading: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset("${hptrue!.images[index]}",fit: BoxFit.cover,),

                ),
                title: Text("${hptrue!.name[index]}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                subtitle: Text("${hptrue!.subname[index]}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                trailing: Icon(Icons.play_arrow,color: Colors.white,),
              ),
            ),
          ),
        );
      },itemCount: hpfalse!.images.length,),
    ),
    );
  }
}