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
  TextEditingController _laddressController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("请假申请"),
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
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 28, right: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: "请假类型",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF7D7D7D),
                    ),
                    children: [
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
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
                          autofocus: false,
                          textAlign: TextAlign.right,
                          controller: _lnameController,
                          style:
                              TextStyle(fontSize: 18, color: Color(0xFF2D2D2D)),
                          decoration: InputDecoration(
                            hintText: "请输入",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
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
          ),
          Padding(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 28, right: 28),
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: "选择项目",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF7D7D7D),
                        ),
                      ),
                    ),
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
                            child: Text(
                              "",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF2D2D2D),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Image(
                            image: AssetImage("assets/icon_right.png"),
                            height: 18,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                onTap: (() {
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Text(
                              'This is the modal bottom sheet. Slide down to dismiss.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 24.0,
                              ),
                            ),
                          ),
                        );
                      });
                }),
              )),
          Divider(
            height: 10,
            color: Color(0xFFE5E5E5),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 28, right: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: "开始时间",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF7D7D7D),
                    ),
                    children: [
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
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
                        child: Text(
                          "",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF2D2D2D),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image(
                        image: AssetImage("assets/icon_right.png"),
                        height: 18,
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
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 28, right: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: "结束时间",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF7D7D7D),
                    ),
                    children: [
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
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
                        child: Text(
                          "",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF2D2D2D),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image(
                        image: AssetImage("assets/icon_right.png"),
                        height: 18,
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
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 28, right: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: "安排地点",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF7D7D7D),
                    ),
                    children: [
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
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
                          autofocus: false,
                          textAlign: TextAlign.right,
                          controller: _laddressController,
                          style:
                              TextStyle(fontSize: 18, color: Color(0xFF2D2D2D)),
                          decoration: InputDecoration(
                            hintText: "请输入",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
