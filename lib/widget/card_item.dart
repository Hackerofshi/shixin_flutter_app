import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AndroidCardItem extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final Color color;
  final RoundedRectangleBorder shape;
  final double elevation;

  const AndroidCardItem({Key key, this.margin, this.color, this.shape,
    this.elevation = 5.0, this.child}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    EdgeInsets margin = this.margin;
    RoundedRectangleBorder shape = this.shape;
    Color color = this.color;

    margin??=EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 10.0);
    shape ??= new RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0))
    );
    color ??=new Color(0xFF24292E);
    // TODO: implement build
    return new Card(
      elevation: elevation,
      shape: shape,
      color: color,
      margin: margin,
      child: child,
    );
  }
}
