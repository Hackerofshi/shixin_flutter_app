import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shixin_flutter_app/routes/home/admin_page.dart';
import 'package:shixin_flutter_app/routes/home/project_page.dart';
import 'package:shixin_flutter_app/routes/home/wy_news_page.dart';
import 'package:shixin_flutter_app/states/index.dart';

import 'mine.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Consumer<IndexProvider>(
        //优化：在状态改变时viewpage子页面不会走build方法
        child: PageView(
          physics: NeverScrollableScrollPhysics(), //禁止滚动,
          controller:
              Provider.of<IndexProvider>(context, listen: false).pageController,
          children: <Widget>[
            ProjectPage("第一页"),
            WyNewsPage(),
            AdminPage(),
            MinePage("我的")
          ],
        ),
        builder: (context, indexProvider, child) {
          return Scaffold(
            body: child,
            drawer: MyDrawer(),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                indexProvider.index = index;
              },
              unselectedItemColor: Colors.black,
              unselectedLabelStyle: TextStyle(color: Colors.black),
              selectedItemColor: Colors.blue,
              currentIndex: indexProvider.index,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.android),
                  activeIcon: Icon(
                    Icons.android,
                    color: Colors.blue,
                  ),
                  title: Text("android"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.perm_contact_calendar),
                  title: Text("项目"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text("home"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  title: Text("message"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text("person"),
                ),
              ],
            ),
          );
        });
  }
}

class ChildPage extends StatefulWidget {
  final String title;

  ChildPage(this.title);

  @override
  _ChildPageState createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage>
    with AutomaticKeepAliveClientMixin {
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
      backgroundColor: widget.title == '第一页'
          ? Colors.red.withOpacity(0.5)
          : widget.title == '第二页'
              ? Colors.yellow.withOpacity(0.5)
              : Colors.green.withOpacity(0.5),
      appBar: AppBar(title: Text(widget.title)),
      body: Center(child: Text(widget.title)),
    );
  }
}
