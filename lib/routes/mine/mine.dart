import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shixin_flutter_app/common/style/android_style.dart';
import 'package:shixin_flutter_app/models/userinfo.dart';
import 'package:shixin_flutter_app/models/UserOrg.dart';
import 'package:shixin_flutter_app/net/global.dart';
import 'package:shixin_flutter_app/widget/card_item.dart';
import 'package:shixin_flutter_app/widget/common_item.dart';

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
      body: Transform.translate(
        offset: Offset(0, -0),
        child: SizedBox.expand(
          child: Container(
            child: getBody(),
          ),
        ),
      ),
    );
  }

  getBody() {
    return UserHeaderItem(Global.profile.user, "", Color(0xFFF8F8F8));
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
      onPressed: () {},
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
              bottomRight: Radius.circular(0.0))),
      child: Padding(
        padding:
            EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.white,
              padding:
                  EdgeInsets.only(left: 5, top: 10.0, right: 0, bottom: 10.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //用户头像
                  RawMaterialButton(
                    onPressed: () {},
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: EdgeInsets.all(0.0),
                    constraints:
                        const BoxConstraints(minWidth: 0.0, minHeight: 0.0),
                    child: ClipOval(
                      child: FadeInImage.assetNetwork(
                        placeholder: 'static/images/logo.png',
                        fit: BoxFit.fitWidth,
                        image: userInfo.pic ?? AndroidIcons.DEFAULT_REMOTE_PIC,
                        width: 80.0,
                        height: 80.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new Text(
                              userInfo.name ?? "",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            _getNotifyIcon(context, notifyColor),
                          ],
                        ),
                        new Text(
                          userInfo.name == null ? "" : userInfo.name,
                          style: TextStyle(
                            color: Color(0xffc4c4c4),
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CommonItem(
              tagName: "公司",
              categoryName: '小米',
            ),
            CommonItem(
              tagName: "图片选择",
              categoryName: 'image-picker',
              onPress: () => {Navigator.pushNamed(context, "imagepicker")},
            ),
            CommonItem(
              tagName: "图片选择",
              categoryName: '图片选择的Demo',
              onPress: () => {Navigator.pushNamed(context, "ImagePickerDemo")},
            ),
            CommonItem(
              tagName: "图片选择",
              categoryName: '多图的选择',
              onPress: () => {Navigator.pushNamed(context, "MultiImagePicker")},
            )
          ],
        ),
      ),
    );
  }
}
