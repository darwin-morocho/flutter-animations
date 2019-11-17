import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AnimatedWidgetPage extends StatefulWidget {
  @override
  _AnimatedWidgetPageState createState() => _AnimatedWidgetPageState();
}

class _AnimatedWidgetPageState extends State<AnimatedWidgetPage>
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
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _startNewAnimation() {
    _start = _end;
    _end = _end + 100;
    _counter = Tween<double>(begin: _start, end: _end).animate(_controller);
    setState(() {});
    _controller.forward(from: 0);
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
            AnimatedText(
              animation: _counter,
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

class AnimatedText extends AnimatedWidget {
  final Animation<double> animation;

  AnimatedText({Key key, @required this.animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Text(
      animation.value.toStringAsFixed(2),
      style: TextStyle(fontSize: 40),
    );
  }
}
