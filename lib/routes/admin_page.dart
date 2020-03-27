import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPage createState() {
    // TODO: implement createState
    return _AdminPage();
  }
}

class _AdminPage extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(title: Text("行政")),
      body: getBody(),
    );
  }

  getBody() {
    return Container(
      padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ClipOval(
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              color: Color(0xFFFFF8EE),
                              alignment: Alignment.center,
                              child: Image(
                                image: AssetImage("assets/icon_leave.png"),
                                width: 49,
                              ),
                            ),
                          ),
                          Text("测试"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ClipOval(
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              color: Color(0xFFFFF8EE),
                              alignment: Alignment.center,
                              child: Image(
                                image: AssetImage("assets/icon_leave.png"),
                                width: 49,
                              ),
                            ),
                          ),
                          Text("测试"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
