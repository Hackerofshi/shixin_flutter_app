import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPage createState() {
    // TODO: implement createState
    return _ResultPage();
  }
}

class _ResultPage extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text("选中数据返回"),
      ),
      body: Container(
        child: RaisedButton(
          color: Colors.blue,
          onPressed: () {
            /*返回数据*/
            Navigator.of(context).pop(People("YZQ", 18));
          },
          child: Text(
            "返回数据",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class People {
  People(this.name, this.age);

  var name;
  var age;
}
