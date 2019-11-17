import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ScaleAnimationPage extends StatefulWidget {
  @override
  _ScaleAnimationPageState createState() => _ScaleAnimationPageState();
}

class _ScaleAnimationPageState extends State<ScaleAnimationPage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _scale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1, end: 1.2), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1), weight: 50),
    ]).animate(_controller);
    _scale.addListener(() {
      setState(() {});
    });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform.scale(
          scale: _scale.value,
          child: Icon(
            Icons.favorite,
            size: 50,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
