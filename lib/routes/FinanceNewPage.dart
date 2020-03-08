import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_refresh/flutter_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shixin_flutter_app/models/Constants.dart';
import 'package:shixin_flutter_app/models/ListEnity.dart';
import 'package:shixin_flutter_app/models/news_enity.dart';
import 'package:shixin_flutter_app/util/StringUtil.dart';
import 'package:shixin_flutter_app/util/TimeUtils.dart';

class FinanceNewsPage extends StatefulWidget {
  @override
  FinanceNewsPageState createState() => new FinanceNewsPageState();
}

class FinanceNewsPageState extends State<FinanceNewsPage> {
  List<ListEnity> listData = [];
  int lastone_id;
  int lastone_id_start = 0;
  int lastone_id_end = 0;
  bool has_next_page = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDatas(START_REQUEST);
  }

  getBody() {
    if (listData.isEmpty) {
      return CircularProgressIndicator();
    } else {
      return new Refresh(
        onFooterRefresh: onFooterRefresh,
        onHeaderRefresh: pullToRefresh,
        child: ListView.builder(
          itemCount: (listData == null) ? 0 : listData.length,
          itemBuilder: (BuildContext context, int position) {
            return getItem(position);
          },
          physics: new AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: getBody(),
    );
  }



  /**
   * 列表item
   */
  getItem(int i) {
    Data data = listData[i].data;
    String type = listData[i].type;
    if ("main" == type) {
      String articleTitle = data.articleTitle;
      int time = data.time;
      String time_str = readTimestamp(time);
      return new GestureDetector(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: new Column(
            children: <Widget>[
              new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Expanded(
                    child: Container(
                      height: 95.0,
                      child: getImage(data.articleThumbnail),
                      alignment: FractionalOffset.center,
                    ),
                    flex: 1,
                  ),
                  new Expanded(
                      child: new Container(
                    height: 95.0,
                    margin: new EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          child: new Text(
                            articleTitle,
                            style: new TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          alignment: FractionalOffset.topLeft,
                        ),
                        new Container(
                          child: new Text(
                            "${data.articleBrief}",
                            style: new TextStyle(fontSize: 16.0),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        new Expanded(
                          child: new Container(
                            margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                            child: new Stack(
                              children: <Widget>[
                                new Container(
                                  child: new Text("${data.articleAuthor}",
                                      style: new TextStyle(fontSize: 10.0)),
                                  alignment: FractionalOffset.bottomLeft,
                                ),
                                new Container(
                                  child: new Text(time_str,
                                      style: new TextStyle(fontSize: 10.0)),
                                  alignment: FractionalOffset.bottomRight,
                                ),
                              ],
                            ),
                          ),
                          flex: 3,
                        )
                      ],
                    ),
                  ))
                ],
              ),
              new Divider(),
            ],
          ),
        ),
        onTap: () {
          onItemClick(i, articleTitle);
        },
      );
    } else {
      print("加载底线");
      return new Container(
        height: 50.0,
        child: new Text(
          "——   我也是有底线的   ——",
          style: new TextStyle(fontSize: 16.0, color: Colors.black38),
        ),
        alignment: FractionalOffset.center,
      );
    }
  }

  getImage(String articleThumbnail) {
    return CachedNetworkImage(
      imageUrl: articleThumbnail,
      placeholder: (context, url) => new CircularProgressIndicator(),
      errorWidget: (context, url, error) => new Icon(Icons.error),
    );
  }

  void onItemClick(int i, String articleTitle) {
    String h5_url = (listData[i].data as Data).url;
    String content = (listData[i].data as Data).articleContent;
/*    Navigator.push(
        context,
        new MaterialPageRoute(
//            builder: (context) => new NewsWebPage(h5_url,'新闻详情')));
            builder: (context) => new NewsDetailsPage(articleTitle, content)));*/
  }

  void getDatas(request_type) async {
    String query;
    if (request_type!=LOADMORE_REQIEST) {
      query =
      "source(limit: 20,sort:\"desc\"),{data{}, page_info{has_next_page, end_cursor}}";
    } else {
      if (lastone_id > 1) {
        lastone_id_start = lastone_id - 21;
        lastone_id_end = lastone_id - 1;
        if (lastone_id_start < 1) {
          lastone_id_start = 1;
        }
        query =
        "source(limit: 20,__id:{gte:${lastone_id_start},lte:${lastone_id_end}},sort:\"desc\"),{data{}, page_info{has_next_page, end_cursor}}";
      }else{
        query="";
      }
    }

    if (query!=null&&query.isNotEmpty) {
      String url = GetFinanceNewsUrl(query);
      print("请求的url===》" + url);
      Dio dio = new Dio();
      Response response = await dio.get(url);
      var jsonString = response.data;
      handleData(jsonString, request_type);
    } else {
      Fluttertoast.showToast(
          msg: "已经没有更多了",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white);
    }
  }

  Future<Null> onFooterRefresh() async{
    getDatas(LOADMORE_REQIEST);
  }

  Future<Null> pullToRefresh() async {
    getDatas(REFRESH_REQIEST);
    return null;
  }

  void handleData(jsonString, request_type) {
    try {
      var news = new news_enity.fromJson(jsonString);
      var code = news.code;
      if (code == 0) {
        Result result = news.result;
        lastone_id = result.pageInfo.endCursor;
        has_next_page = result.pageInfo.hasNextPage;
        setState(() {
          if (request_type!=LOADMORE_REQIEST) {
            // 不是加载更多，则直接为变量赋值
            for (Data data in result.data) {
              ListEnity listEnity = new ListEnity("main", data);
              listData.add(listEnity);
            }
          } else {
            // 是加载更多，则需要将取到的news数据追加到原来的数据后面
            List<ListEnity> list1 = new List<ListEnity>();
            list1.addAll(listData);
            for (Data data in result.data) {
              ListEnity listEnity = new ListEnity("main", data);
              list1.add(listEnity);
            }
            listData = list1;
          }
          // 判断是否获取了所有的数据，如果是，则需要显示底部的"我也是有底线的"布局
          if (has_next_page == false&&"endline"!= listData[listData.length].type) {
            ListEnity listEnity = new ListEnity("endline", null);
            listData.add(listEnity);
          }
          if(request_type==REFRESH_REQIEST){
            Fluttertoast.showToast(
                msg: "刷新成功",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIos: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white);
          }
        });
      } else {
        Fluttertoast.showToast(
            msg: news.error_info,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white);
      }
    } catch (e) {
      print("异常==》" + e.toString());
    }
  }
}
