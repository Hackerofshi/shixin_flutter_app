import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shixin_flutter_app/routes/admin/result_page.dart';

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
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("leave");
                  },
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
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => {skipToPageD()},
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
                              Text("页面返回数据"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }

  /*等待返回数据是异步操作*/
  void skipToPageD() async {
    final result = await Navigator.pushNamed(context, "result");

    People p = result as People;

    /*弹窗显示返回的数据*/
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("返回的结果"),
            content: Text("${p.name},${p.age}"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("确定"))
            ],
          );
        });
  }
}
