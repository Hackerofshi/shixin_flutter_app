import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DragDemo extends StatefulWidget {
  @override
  _DragDemo createState() {
    return new _DragDemo();
  }
}

class _DragDemo extends State<DragDemo> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("拖动"),
        ),
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Draggable(
                child: Text("我可以被移动"),
                feedback: Text('我正在被移动'),
                axis: Axis.vertical,
              ),
            ),
          ],
        ));
  }
}
