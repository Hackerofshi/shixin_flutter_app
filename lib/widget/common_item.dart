import 'package:flutter/material.dart';

/*
* 按钮监听->回调
* */
//第一种自定义回调方法
typedef MyCallBackFuture = Future Function();

//第一种 回调时定义的方法
//Future click() {
//  //todo do some thing
//  print("click.......");
//}

class CommonItem extends StatelessWidget {
  var tagName;
  var categoryName;
  @required
  VoidCallback onPress; //第二种:回调函数的签名，没有参数，也不返回数据。

  CommonItem({Key key, this.tagName, this.categoryName, this.onPress})
      : super(key: key);

  //  CommonItem(MyCallBackFuture callBack) {
//    this.myCallBackFuture = callBack;
//  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(left: 0, top: 10.0, right: 0, bottom: 0.0),
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
      ),
    );
  }
}
