import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shixin_flutter_app/widget/common_item.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CommonItem(
            tagName: "动画",
            categoryName: '测试',
            onPress: ()=>{
              Navigator.pushNamed(context, "ScaleAnimation")
            },
          ),
          CommonItem(
            tagName: "二维码",
            categoryName: '扫一扫',
            onPress: ()=>{
              Navigator.pushNamed(context, "QRViewExample")
            },
          ),
        ],
      ),
    );
  }
}
