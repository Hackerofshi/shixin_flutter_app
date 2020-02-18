import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  final String title;

  ProjectPage(this.title);

  @override
  _ChildPageState createState() => _ChildPageState();
}

class _ChildPageState extends State<ProjectPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print("${widget.title}: initState");
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("${widget.title}: build");
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(title: Text(widget.title)),
      body: Center(child: Text(widget.title)),
    );
  }
}