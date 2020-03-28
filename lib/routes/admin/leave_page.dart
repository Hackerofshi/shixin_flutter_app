import 'package:flutter/material.dart';

class NewLeave extends StatefulWidget {
  @override
  _NewLeave createState() {
    // TODO: implement createState
    return _NewLeave();
  }
}

class _NewLeave extends State<NewLeave> {
  TextEditingController _lnameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("gg"),
        ),
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return Form(
      child: Column(
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(top: 10.0, bottom: 10.0, left: 28, right: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("请假类型"),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          autofocus: true,
                          textAlign: TextAlign.right,
                          controller: _lnameController,
                          decoration: InputDecoration(
                            hintText: "请输入",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Image(
                        color: Colors.black,
                        image: AssetImage("assets/icon_right.png"),
                        height: 20,
                        width: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Color(0xFFE5E5E5),
          )
        ],
      ),
    );
  }
}
