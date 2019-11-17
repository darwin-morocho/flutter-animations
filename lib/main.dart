import 'package:flutter/material.dart';
import 'pages/basic.dart';
import 'pages/animated_widget.dart';
import 'pages/transform/translate_animation.dart';
import 'pages/transform/scale_animation.dart';
import 'pages/transform/rotate_animation.dart';
import 'pages/home_with_right_circular_menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeWithRightCircularMenuPage(),
    );
  }
}


