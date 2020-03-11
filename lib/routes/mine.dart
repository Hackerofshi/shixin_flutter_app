import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shixin_flutter_app/models/userinfo.dart';
import 'package:shixin_flutter_app/models/UserOrg.dart';

class MinePage extends StatefulWidget {
  final String title;

  MinePage(this.title);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(widget.title)),
      body: getBody(),
    );
  }

  getBody() {

  }
}


class UserHeaderItem extends StatelessWidget {

  final Userinfo userInfo;

  final String beStaredCount;

  final Color notifyColor;

  final Color themeColor;

  final VoidCallback refreshCallBack;

  final List<UserOrg> orgList;

  UserHeaderItem(this.userInfo, this.beStaredCount, this.themeColor,
      {this.notifyColor, this.refreshCallBack, this.orgList});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}