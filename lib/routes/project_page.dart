import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shixin_flutter_app/common/funs.dart';
import 'package:shixin_flutter_app/i10n/localization_intl.dart';
import 'package:shixin_flutter_app/models/index.dart';
import 'package:shixin_flutter_app/net/git_api.dart';
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
                  return ProjectCard(project: listData[index],);
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
