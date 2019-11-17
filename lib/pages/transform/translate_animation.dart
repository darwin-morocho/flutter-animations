import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TranslateAninamtionPage extends StatefulWidget {
  @override
  _TranslateAninamtionPageState createState() => _TranslateAninamtionPageState();
}

class _TranslateAninamtionPageState extends State<TranslateAninamtionPage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _dy;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _dy = Tween<double>(begin: -300, end: 300).animate(_controller);
    _dy.addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.translate(
        offset: Offset(0, _dy.value),
        child: Center(
          child: Container(
            color: Colors.redAccent,
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
