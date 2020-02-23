import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image(
          image: AssetImage("assets/avatar-default.png"),
          width: 100.0,
          color: Colors.blue,
          colorBlendMode: BlendMode.difference,
        ),
        Expanded(
          flex: 1,

          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(right: 10.0),
            height: 30.0,
            color: Colors.red,
            child: Text('oooo'),
          ),
        ),
        Icon(
          Icons.favorite,
        )
      ],
    );
  }
}
