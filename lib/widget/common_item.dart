import 'package:flutter/material.dart';

class CommonItem extends StatelessWidget {
  var tagName;
  var categoryName;

  CommonItem({Key key, this.tagName, this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0, top: 10.0, right: 0, bottom: 10.0),
      padding: EdgeInsets.all(10.0),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Text(
            tagName,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Text(
              categoryName,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF7D7D7D),
              ),
            ),
          ),
          Icon(Icons.arrow_forward)
        ],
      ),
    );
  }
}
