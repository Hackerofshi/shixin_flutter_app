import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shixin_flutter_app/models/userinfo.dart';
import 'package:shixin_flutter_app/models/UserOrg.dart';
import 'package:shixin_flutter_app/widget/card_item.dart';

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

  _getNotifyIcon(BuildContext context, Color color) {
    if (notifyColor == null) {
      return Container();
    }
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.only(top: 0.0, right: 5.0, left: 5.0),
      constraints: BoxConstraints(minWidth: 0.0, minHeight: 0.0),
      child: new ClipOval(
        child: new Icon(
          IconData(0xe600, fontFamily: 'wxcIconFont'),
          color: color,
          size: 18.0,
        ),
      ),
      onPressed: () {

      },
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return AndroidCardItem(
      color: themeColor,
      elevation: 0,
      margin: EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0)
          )
      ),
      child: Padding(padding: EdgeInsets.only(
          left: 10.0, top: 10.0, right: 10.0, bottom: 0.0
      ),
        child:Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

              ],
            )
          ],
        ),
      ),
    );
  }

}