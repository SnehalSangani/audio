
import 'package:audio/screen/home/audio_screen.dart';
import 'package:audio/screen/home/provider/home_provider.dart';
import 'package:audio/screen/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main()
{
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Homeprovider(),)
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/':(context) => home(),
            'second':(context) => second(),
          },
        ),
      )
  );
}