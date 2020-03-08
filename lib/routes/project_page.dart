import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shixin_flutter_app/common/funs.dart';
import 'package:shixin_flutter_app/i10n/localization_intl.dart';
import 'package:shixin_flutter_app/models/index.dart';
import 'package:shixin_flutter_app/net/git_api.dart';
import 'package:shixin_flutter_app/states/profile_change_notifier.dart';
import 'package:shixin_flutter_app/widget/project_card.dart';

class ProjectPage extends StatefulWidget {
  final String title;

  ProjectPage(this.title);

  @override
  _ChildPageState createState() => _ChildPageState();
}

class _ChildPageState extends State<ProjectPage>
    with AutomaticKeepAliveClientMixin {

  List<Project> listData = [];


  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print("${widget.title}: initState");
    getData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("${widget.title}: build");
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text(widget.title)),
        body: getBody(),
        drawer:MyDrawer(),
    );
  }

  getBody() {
    if (listData.isEmpty) {
      // 加载菊花
      return CircularProgressIndicator();
    } else {
      return CustomScrollView(
        slivers: <Widget>[
          //List
          new SliverFixedExtentList(
            itemExtent: 60.0,
            delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建列表项
                  return ProjectCard(project:listData[index]);
                }, childCount: (listData == null) ? 0 : listData.length //50个列表项
            ),
          ),
        ],
      );
    }
  }


  void getData() async {
    var map = HashMap<String, String>();
    List<Project> projects;
    try {
      projects = await Git(context).getProjectsOfMine(queryParameters: map);
      setState(() {
        if (projects != null) {
          listData.addAll(projects);
        }
      });
    } catch (e) {
      //登录失败则提示
      if (e.response?.statusCode == 401) {
        showToast(GmLocalizations
            .of(context)
            .userNameOrPasswordWrong);
      } else {
        showToast(e.toString());
        print(e.toString());
      }
    } finally {}
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[_buildHeader(), Expanded(child: _buildMenus())],
        ));
  }

  _buildHeader() {
    return Consumer<UserModel>(
      builder: (BuildContext context, UserModel value, Widget child) {
        return GestureDetector(
          child: Container(
            color: Theme.of(context).primaryColor,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ClipOval(
                      // 如果已登录，则显示用户头像；若未登录，则显示默认头像
                      child: value.isLogin
                          ? gmAvatar(value.user.avatar_url, width: 80)
                          : Image.asset(
                              "assets/avatar-default.png",
                              width: 80,
                            )),
                ),
                Text(
                  value.isLogin
                      ? value.user.login
                      : GmLocalizations.of(context).login,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )
              ],
            ),
          ),
          onTap: () {
            if (!value.isLogin) Navigator.of(context).pushNamed("login");
          },
        );
      },
    );
  }

  _buildMenus() {
    return Consumer<UserModel>(
      builder: (BuildContext context, UserModel value, Widget child) {
        var gm = GmLocalizations.of(context);
        return ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: Text(gm.theme),
              onTap: () => Navigator.pushNamed(context, "themes"),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(gm.language),
              onTap: () => Navigator.pushNamed(context, "language"),
            ),
            if (value.isLogin)
              ListTile(
                leading: const Icon(Icons.power_settings_new),
                title: Text(gm.logout),
                onTap: (){
                  showDialog(context: context,
                  builder: (context){
                    return AlertDialog(
                      content: Text(gm.logoutTip),
                      actions: <Widget>[
                        FlatButton(onPressed: ()=>Navigator.pop(context),
                          child: Text(gm.cancel),
                        ), FlatButton(
                          child: Text(gm.yes),
                          onPressed: () {
                            //该赋值语句会触发MaterialApp rebuild
                            value.user = null;
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  });
                },
              )
          ],
        );
      },
    );
  }
}
