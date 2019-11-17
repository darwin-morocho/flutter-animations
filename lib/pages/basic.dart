import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BasicAnimationPage extends StatefulWidget {
  @override
  _BasicAnimationPageState createState() => _BasicAnimationPageState();
}

class _BasicAnimationPageState extends State<BasicAnimationPage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _counter;
  Animation<Color> _color;

  double _start = 0, _end = 100;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    _counter = Tween<double>(begin: _start, end: _end).animate(_controller);

//    _color= TweenSequence([
//      TweenSequenceItem(
//        tween: ColorTween(begin: Colors.redAccent, end: Colors.blue),
//        weight: 20
//      ),
//      TweenSequenceItem(
//          tween: ColorTween(begin: Colors.blue, end: Colors.blue),
//          weight: 60
//      ),
//      TweenSequenceItem(
//          tween: ColorTween(begin: Colors.blue, end: Colors.green),
//        weight: 20
//      )
//    ]).animate(_controller);

//    _color = ColorTween(begin: Colors.redAccent, end: Colors.green)
//        .animate(_controller);

    _counter.addListener(() {
      setState(() {});
    });


    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _startNewAnimation(){
    _start=_end;
    _end =_end+100;
    _counter = Tween<double>(begin: _start, end: _end).animate(_controller);
    _controller.forward(from: 0 );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _counter.value.toStringAsFixed(2),
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 20),
            CupertinoButton(
              onPressed: _startNewAnimation,
              child: Text("START"),
            )
          ],
        ),
      ),
    );
  }
}
