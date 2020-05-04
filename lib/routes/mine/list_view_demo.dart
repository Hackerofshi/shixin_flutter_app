import 'package:flutter/material.dart';

/*1.利用显示的自列表来构造List<Widget>。此构造函数适合于具有少量子元素的列表视图，
因为构造列表需要为可能显示在列表视图中的每个子元素执行工作，而不仅仅是那些实际可见的子元素。

2.ListView.builder利用IndexedWidgetBuilder来按需构造。
这个构造函数适合于具有大量（或无限）子视图的列表视图，因为构建器只对那些实际可见的子视图调用。

3.使用ListView.separated构造函数，采用两个IndexedWidgetBuilder：itemBuilder
根据需要构建子项separatorBuilder类似地构建出现在子项之间的分隔符子项。
此构造函数适用于具有固定数量的子控件的列表视图。

4.使用ListView.custom的SliverChildDelegate构造，它提供了定制子模型的其他方面的能力。
例如，SliverChildDelegate可以控制用于估计实际上不可见的孩子的大小的算法。

*/
class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
      padding: new EdgeInsets.all(5.0),
      itemExtent: 50.0,
      itemBuilder: (BuildContext context, int index) {
        return new Text("text $index");
      },
    );
  }

  /*@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return new Text("text $index");
        },
        separatorBuilder: (BuildContext context, int index) {
          return new Container(height: 1.0, color: Colors.red);
        },
        itemCount: 40);
  }*/
}

/*
子结点的生命周期
1.创建
在布局列表时，可见的子元素、状态和呈现对象将基于现有控件（例如当使用默认构造函数时）或延迟提供的控件（例如当使用ListView.builder构造函数时）延迟地创建。

2.销毁
当从视图滑出时，关联的元素子树、状态和呈现对象将被销毁。当向后滚动时，位于列表中相同位置的新子节点将与新元素、状态和呈现对象一起延迟地重新创建。

3.销毁时的数据保存
为了保存子元素在视图中滚动和退出视图时的状态，可以做以下选择：
1> 将与UI状态驱动无关的业务逻辑从列表子子树中移出。例如，如果一个列表包含来自高速缓存的网络响应的带有上投票数的帖子，
那么将帖子列表和上投票数存储在列表外部的数据模型中。让列表子UI子树很容易从真实模型对象的源中重新创建。使用子控件子树中的StatefulWidget只存储瞬时UI状态。
2> 让KeepAlive作为需要保存的列表子控件子树的root结点。KeepAlive使得孩子子树的顶部结点渲染对象的子结点保持存活。
当关联的顶部渲染对象滚动到视图之外时，列表将子对象的渲染对象（以及通过扩展，其关联的元素和状态）保存在高速缓存列表中，
而不是销毁它们。当滚动回到视图中时，渲染对象将按照当前现状被重新绘制（如果在中间阶段没有被标记为脏）。

这只在addAutomaticKeepAlives和addRepaintBoundaries为false的情况下有效，因为这些参数导致ListView将每个子小部件子树与其他小部件包装在一起。
3> 使用AutomaticKeepAlive控件（当addautomatickeepalives设置为ture的时候默认会插入）。而不是向KeepAlive一样，
当滑出屏幕的无条件的缓存孩子的子树，AutomaticKeepAlive可以让子树的派生的逻辑控制是否需要缓存该子树。

例如，EditableText 会在它有输入焦点时发送子结点子树以便保持存活状态。 如果它没有焦点，
并且没有其他派生类通过KeepAliveNotification发出保持活动的信号，则滚动选择时将清除列表子元素子树。
AutomaticKeepAlive派生类通常使用AutomaticKeepAliveClientMixin发信号通知它保持活动状态，
然后实现wantKeepAlive getter并调用updateKeepAlive。

*/
