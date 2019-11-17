import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';

class MenuItem {
  final String label;
  final IconData icon;

  MenuItem(this.label, this.icon);
}

class HomeWithRightCircularMenuPage extends StatefulWidget {
  @override
  _HomeWithRightCircularMenuPageState createState() =>
      _HomeWithRightCircularMenuPageState();
}

class _HomeWithRightCircularMenuPageState
    extends State<HomeWithRightCircularMenuPage> with TickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> _stackAngle;

  var _items = List<MenuItem>();

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _stackAngle =
        Tween<double>(begin: -math.pi, end: 0 * math.pi).animate(_controller);
    _stackAngle.addListener(() {
      setState(() {});
    });

    _items.add(MenuItem("Act of Kidness", Icons.favorite));
    _items.add(MenuItem("Recipies", Icons.cake));
    _items.add(MenuItem("Yoga", Icons.accessibility));
    _items.add(MenuItem("Affirmations", Icons.people));
    _items.add(MenuItem("Courses", Icons.event));
    _items.add(MenuItem("Medications", Icons.comment));
    _items.add(MenuItem("Medications", Icons.comment));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final decoratorWidth = 0.8 * size.width;
    final outDecoratorWidth = decoratorWidth + 120;

    final step = math.pi / _items.length;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "What does your soul\nneed today?",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                    Container(
                      width: 55,
                      height: 55,
                      child: Center(
                        child: Icon(Icons.person),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xfff0f0f0),
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 2.5, color: Colors.redAccent),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 15,
                                offset: Offset(-10, 0))
                          ]),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                        right: -decoratorWidth / 2,
                        child: Transform.rotate(
                          angle: _stackAngle.value,
                          child: SvgPicture.asset(
                            'assets/decoration.svg',
                            width: decoratorWidth,
                          ),
                        )),
                    Positioned(
                      right: -outDecoratorWidth / 2,
                      child: Transform.rotate(
                        angle: _stackAngle.value,
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              width: outDecoratorWidth,
                              height: outDecoratorWidth,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 2, color: Colors.redAccent),
                              ),
                            ),
                            ...List.generate(_items.length, (index) {
                              final item = _items[index];

                              final angle =
                                  ((math.pi / 2) + index * step) + (step / 2);

                              return Transform.translate(
                                  offset: Offset(
                                      (outDecoratorWidth / 2) * math.cos(angle),
                                      (outDecoratorWidth / 2) *
                                          math.sin(angle)),
                                  child: MenuItemView(
                                    menuItem: item,
                                    index: index,
                                    itemsLength: _items.length,
                                  ));
                            }).toList()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                color: Color(0xfff0f0f0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItemView extends StatelessWidget {
  final MenuItem menuItem;
  final int index;
  final int itemsLength;

  const MenuItemView({Key key, this.menuItem, this.index, this.itemsLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Transform.translate(
          offset: Offset(-100, 20 - ((index / itemsLength) * 50)),
          child: SizedBox(
            width: 120,
            child: Text(
              menuItem.label,
              textAlign: TextAlign.right,
              maxLines: 2,
            ),
          ),
        ),
        CupertinoButton(
          minSize: 30,
          pressedOpacity: 0.8,
          onPressed: () {},
          padding: EdgeInsets.zero,
          child: Container(
            width: 50,
            height: 50,
            child: Center(
              child: Icon(menuItem.icon, color: Colors.white, size: 30),
            ),
            decoration: BoxDecoration(
                color: Color(0xffF50057),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20,
                      offset: Offset(-5, 0))
                ],
                shape: BoxShape.circle),
          ),
        )
      ],
    );
  }
}
