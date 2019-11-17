import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class RotateAnimationPage extends StatefulWidget {
  @override
  _RotateAnimationPageState createState() => _RotateAnimationPageState();
}

class _RotateAnimationPageState extends State<RotateAnimationPage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _angle;
  Animation<Color> _color,_iconColor;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _angle =
        Tween<double>(begin: 0, end: 45 * math.pi / 180).animate(_controller);
    _color = ColorTween(begin: Color(0xfff0f0f0), end: Colors.redAccent)
        .animate(_controller);

    _iconColor = ColorTween(begin: Colors.blue, end: Colors.white)
        .animate(_controller);

    _angle.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  _onPressed(){
    if(_controller.isCompleted){
      _controller.reverse();
    }else{
      _controller.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform.rotate(
          angle: _angle.value,
          child: CupertinoButton(
            onPressed: _onPressed,
            color: _color.value,
            padding: EdgeInsets.all(10),
            borderRadius: BorderRadius.circular(50),
            child: Icon(Icons.add, size: 50, color: _iconColor.value),
          ),
        ),
      ),
    );
  }
}
