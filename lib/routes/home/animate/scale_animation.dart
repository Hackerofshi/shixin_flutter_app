import 'package:flutter/material.dart';

class ScaleAninationRoute extends StatefulWidget {
  @override
  _ScaleAninationRouteState createState() => new _ScaleAninationRouteState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAninationRouteState extends State<ScaleAninationRoute>
    with SingleTickerProviderStateMixin {
  //Animation<Color>
  //Animation<Size>
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: const Duration(seconds: 3));

    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("放大动画")),
        body: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('放大'),
              onPressed: () => {
                //启动动画（正向执行）
                controller.forward()
              },
            ),
            new Center(
              child: Image.asset(
                'assets/avatar-default.png',
                width: animation.value,
                height: animation.value,
              ),
            ),
            AnimatedBuilder(
              animation: animation,
              child: Image.asset('assets/avatar-default.png'),
              builder: (BuildContext ctx, Widget child) {
                return Center(
                  child: Container(
                    height: animation.value,
                    width: animation.value,
                    child: child,
                  ),
                );
              },
            )
          ],
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Image.asset("imgs/avatar.png",
          width: animation.value, height: animation.value),
    );
  }
}
