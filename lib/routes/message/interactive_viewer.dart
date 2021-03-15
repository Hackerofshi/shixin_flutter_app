
import 'package:flutter/material.dart';

class InteractiveViewerDemo extends StatelessWidget {

  /**
   * maxScale	double	2.5	最大放大倍数
   *   minScale	double	0.8	最小缩小倍数
    *  scaleEnabled	bool	true	是否可缩放
   */
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      height: 150,
//      color: Colors.grey.withAlpha(33),
//      child: InteractiveViewer(
////        alignPanAxis: true,
//        boundaryMargin: EdgeInsets.all(40.0),
//        maxScale: 2.5,
//        minScale: 0.3,
//        panEnabled: true,
//        scaleEnabled: true,
//        child: Container(
//          child: Image.asset('assets/images/caver.jpeg'),
//        ),
//      ),
//    );
//  }


/*关于constrained属性，源码中给了一个小demo。这里的表格可以上下滚动，左右滑动。
constrained默认为true,当子组件比InteractiveViewer区域大时，将constrained设为false,
子组件将被赋予无限的约束。*/
  Widget build(BuildContext context) {
    const int _rowCount = 5;
    const int _columnCount = 4;

    return Container(
      width: 300,
      height: 200,
      child: Text("ff"),
      // child: InteractiveViewer(
      //   constrained: false,
      //   scaleEnabled: false,
      //   child: Table(
      //     columnWidths: <int, TableColumnWidth>{
      //       for (int column = 0; column < _columnCount; column += 1)
      //         column: const FixedColumnWidth(150.0),
      //     },
      //     children: buildRows(_rowCount, _columnCount),
      //   ),
      // ),
    );
  }

  List<TableRow> buildRows(int rowCount, int columnCount) {
    return <TableRow>[
      for (int row = 0; row < rowCount; row += 1)
        TableRow(
          children: <Widget>[
            for (int column = 0; column < columnCount; column += 1)
              Container(
                margin: EdgeInsets.all(2),
                height: 50,
                alignment: Alignment.center,
                color: _colorful(row,column),
                child: Text('($row,$column)',style: TextStyle(fontSize: 20,color: Colors.white),),
              ),
          ],
        ),
    ];
  }

  final colors = [Colors.red,Colors.yellow,Colors.blue,Colors.green];
  final colors2 = [Colors.yellow,Colors.blue,Colors.green,Colors.red];

  _colorful(int row, int column ) => row % 2==0?colors[column]:colors2[column];


//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      height: 150,
//      color: Colors.grey.withAlpha(33),
//      child: InteractiveViewer(
//        boundaryMargin: EdgeInsets.all(40.0),
//        maxScale: 2.5,
//        minScale: 0.3,
//        panEnabled: true,
//        scaleEnabled: true,
//        child: Container(
//          child: Image.asset('assets/images/caver.jpeg'),
//        ),
//        onInteractionStart: _onInteractionStart,
//        onInteractionUpdate: _onInteractionUpdate,
//        onInteractionEnd: _onInteractionEnd,
//      ),
//    );
//  }
//
//  /**
//   * onInteractionStart	GestureScaleStartCallback	null	交互开始回调
//   *
//   * 当触碰时，onInteractionStart 会回调ScaleStartDetails对象
//      focalPoint 是相对于屏幕左上角的偏移量。
//      localFocalPoint是相对于父容器区域左上角的偏移量。
//   *ScaleStartDetails(
//      focalPoint: Offset(306.0, 168.7),
//      localFocalPoint: Offset(50.4, 63.7)
//      )
//   */
//  void _onInteractionStart(ScaleStartDetails details) {
//    print('onInteractionStart----' + details.toString());
//  }
//
//  /**
//   * onInteractionUpdate	GestureScaleUpdateCallback	null	交互更新回调
//   *当手指滑动时，onInteractionUpdate 会回调ScaleUpdateDetails对象
//      focalPoint 是相对于屏幕左上角的偏移量。
//      localFocalPoint是相对于父容器区域左上角的偏移量。
//      scale缩放量。
//      horizontalScale水平缩放量。
//      verticalScale竖直缩放量。
//      rotation旋转量。------ 这里说明能监听到旋转量
//
//   *onInteractionUpdate----
//      ScaleUpdateDetails(
//      focalPoint: Offset(6.4, 13.7),
//      localFocalPoint: Offset(6.4, 13.7),
//      scale: 1.0,
//      horizontalScale: 1.0,
//      verticalScale: 1.0,
//      rotation: 0.0
//      )
//
//   */
//  void _onInteractionUpdate(ScaleUpdateDetails details) {
//    print('onInteractionUpdate----' + details.toString());
//  }
//
//  /**
//   * onInteractionEnd	GestureScaleEndCallback	null	交互结束回调
//   *
//   * 当手指滑动时，onInteractionEnd 会回调ScaleEndDetails对象
//      velocity 水平和竖直方向的速度量。
//
//      onInteractionEnd----
//      ScaleEndDetails(velocity: Velocity(0.0, 0.0))
//   */
//  void _onInteractionEnd(ScaleEndDetails details) {
//    print('onInteractionEnd----' + details.toString());
//  }

}

//transformationController	TransformationController	null	变化控制器

//可以通过transformationController进行变换控制,如上面通过按钮进行复位、移动
//TransformationController是一个Matrix4泛型的ValueNotifier
// 所以可以通过改变TransformationController.value来对子组件进行高级的变换操作，Matrix4的强大，你懂得...


class InteractiveViewerDemo3 extends StatefulWidget {
  @override
  _InteractiveViewerDemo3State createState() => _InteractiveViewerDemo3State();
}

class _InteractiveViewerDemo3State extends State<InteractiveViewerDemo3>
    with SingleTickerProviderStateMixin {
  // final TransformationController _transformationController =
  // TransformationController();
  Animation<Matrix4> _animationReset;
  AnimationController _controllerReset;

  void _onAnimateReset() {
   // _transformationController.value = _animationReset.value;
    if (!_controllerReset.isAnimating) {
      _animationReset?.removeListener(_onAnimateReset);
      _animationReset = null;
      _controllerReset.reset();
    }
  }

  void _animateResetInitialize() {
    _controllerReset.reset();
    _animationReset = Matrix4Tween(
     // begin: _transformationController.value,
      end: Matrix4.identity(),
    ).animate(_controllerReset);
    _animationReset.addListener(_onAnimateReset);
    _controllerReset.forward();
  }

  void _animateResetStop() {
    _controllerReset.stop();
    _animationReset?.removeListener(_onAnimateReset);
    _animationReset = null;
    _controllerReset.reset();
  }

  void _onInteractionStart(ScaleStartDetails details) {
    if (_controllerReset.status == AnimationStatus.forward) {
      _animateResetStop();
    }
  }

  @override
  void initState() {
    super.initState();
    _controllerReset = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _controllerReset.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: [
        Container(
          height: 150,
          color: Colors.grey.withAlpha(33),
          child: Text("ff"),
          // child: InteractiveViewer(
          //   boundaryMargin: EdgeInsets.all(40),
          //   transformationController: _transformationController,
          //   minScale: 0.1,
          //   maxScale: 1.8,
          //   onInteractionStart: _onInteractionStart,
          //   child: Container(
          //     child: Image.asset('assets/images/caver.jpeg'),
          //   ),
          // ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton(),
            _buildButton2(),
            _buildButton3(),
          ],
        )
      ],
    );
  }

  Widget _buildButton() {
    return MaterialButton(
        child: Icon(
          Icons.refresh,
          color: Colors.white,
        ),
        color: Colors.green,
        shape: CircleBorder(
          side: BorderSide(width: 2.0, color: Color(0xFFFFDFDFDF)),
        ),
        onPressed: _animateResetInitialize);
  }

  var _x = 0.0;

  Widget _buildButton2() {
    return MaterialButton(
        child: Icon(
          Icons.navigate_before,
          color: Colors.white,
        ),
        color: Colors.green,
        shape: CircleBorder(
          side: BorderSide(width: 2.0, color: Color(0xFFFFDFDFDF)),
        ),
        onPressed: () {
          //var temp = _transformationController.value.clone();
         // temp.translate(_x - 4);
         // _transformationController.value = temp;
        });
  }

  Widget _buildButton3() {
    return MaterialButton(
        child: Icon(
          Icons.navigate_next,
          color: Colors.white,
        ),
        color: Colors.green,
        shape: CircleBorder(
          side: BorderSide(width: 2.0, color: Color(0xFFFFDFDFDF)),
        ),
        onPressed: () {
       //   var temp = _transformationController.value.clone();
        //  temp.translate(_x + 4);
         // _transformationController.value = temp;
        });
  }
}
