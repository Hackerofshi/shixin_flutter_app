import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shixin_flutter_app/models/index.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  ProjectCard({this.project});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image(
          image: project.pics != null && project.pics.length > 0
              ? NetworkImage(project.pics[0].url)
              : AssetImage("assets/avatar-default.png"),
          width: 100.0,
          height: 100.0,
          fit: BoxFit.fitWidth,
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(right: 10.0),
            height: 30.0,
            child: Text(project.name),
          ),
        ),
        Icon(
          Icons.favorite,
        )
      ],
    );
  }
}
