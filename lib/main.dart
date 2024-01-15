// @dart=2.9

import 'package:attendance/view/secondScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(
        seconds: 3,

        // call second screen
        navigateAfterSeconds:secondScreen(),
        // title: new Text(
        //   'SplashScreen Example',
        //   style: new TextStyle(
        //       fontWeight: FontWeight.bold,fl
        //       fontSize: 20.0,
        //       color: Colors.white),
        // ),
        image: new Image.asset('assest/splace.png'),
        photoSize: 100.0,        
        backgroundColor: Colors.blue,
        styleTextUnderTheLoader: new TextStyle(),
        loaderColor: Colors.white
      )

    );
  }
}
