import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProject extends StatefulWidget {
  @override
  _ProjectState createState() {
    // TODO: implement createState
    return _ProjectState();
  }
}

class _ProjectState extends State<MyProject> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("项目")),
      body: Center(
        child: Text("项目"),
      ),
    );
  }
}
