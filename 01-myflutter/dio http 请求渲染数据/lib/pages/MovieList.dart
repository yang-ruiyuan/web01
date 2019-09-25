import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
// import 'package:douban/pages/movie/movieDetail.dart';

class MovieList extends StatefulWidget {
  String movieType;
  //构造器传递数据（并且接收上个页面传递的数据）
  MovieList({Key key, this.movieType}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MovieListState(movieType: this.movieType);
  }
}

class MovieListState extends State<MovieList> {
  String movieType;
  String typeName;
  List movieList = new List();
  int currentPage = 0; //第一页
  int pageSize = 10; //页容量
  int totalSize = 0; //总条数
  String loadMoreText = "没有更多数据";
  TextStyle loadMoreTextStyle =
      new TextStyle(color: const Color(0xFF999999), fontSize: 14.0);
  TextStyle titleStyle =
      new TextStyle(color: const Color(0xFF757575), fontSize: 14.0);
  //初始化滚动监听器，加载更多使用
  ScrollController _controller = new ScrollController();

  /**
   * 构造器接收（MovieList）数据
   */
  MovieListState({Key key, this.movieType}) {
    //固定写法，初始化滚动监听器，加载更多使用
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixel = _controller.position.pixels;
      if (maxScroll == pixel && movieList.length < totalSize) {
        setState(() {
          loadMoreText = "正在加载中...";
          loadMoreTextStyle =
              new TextStyle(color: const Color(0xFF4483f6), fontSize: 14.0);
        });
        loadMoreData();
      } else {
        setState(() {
          loadMoreText = "没有更多数据";
          loadMoreTextStyle =
              new TextStyle(color: const Color(0xFF999999), fontSize: 14.0);
        });
      }
    });
  }

  //加载列表数据
  loadMoreData() async {
    this.currentPage++;
    var start = (currentPage - 1) * pageSize;
    var url =
        "https://movie.douban.com/j/search_subjects?type=movie&tag=%E7%83%AD%E9%97%A8&page_limit=50&page_start=0";
    Dio dio = new Dio();
    Response response = await dio.get(url);
    setState(() {
      movieList.addAll(response.data["subjects"]);
      totalSize = response.data["total"];
    });
  }

  @override
  void initState() {
    super.initState();
    //设置当前导航栏的标题
    switch (movieType) {
      case "in_theaters":
        typeName = "正在热映";
        break;
      case "coming_soon":
        typeName = "即将上映";
        break;
      case "top250":
        typeName = "Top250";
        break;
    }

    //加载第一页数据
    loadMoreData();
  }

  /**
   * 下拉刷新,必须异步async不然会报错
   */
  Future _pullToRefresh() async {
    currentPage = 0;
    movieList.clear();
    loadMoreData();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        leading: new IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed:null ,
        ),
        title: new Text(typeName != null ? typeName : "正在加载中...",
            style: new TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: movieList.length == 0
          ? new Center(child: new CircularProgressIndicator())
          : new RefreshIndicator(
              color: const Color(0xFF4483f6),
              //下拉刷新
              child: ListView.builder(
                itemCount: movieList.length + 1,
                itemBuilder: (context, index) {
                  if (index == movieList.length) {
                    return _buildProgressMoreIndicator();
                  } else {
                    return renderRow(index, context);
                  }
                },
                controller: _controller, //指明控制器加载更多使用
              ),
              onRefresh: _pullToRefresh,
            ),
    );
  }

  /**
   * 加载更多进度条
   */
  Widget _buildProgressMoreIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(15.0),
      child: new Center(
        child: new Text(loadMoreText, style: loadMoreTextStyle),
      ),
    );
  }

  /**
   * 列表的ltem
   */
  renderRow(index, context) {
    var movie = movieList[index];
    var id = movie["id"];
    var title = movie["title"];
    var type = movie["genres"].join("、");
    var year = movie["year"];
    var score = movie["rating"]["average"];
    return new Container(
        height: 200,
        color: Colors.white,
        child: new InkWell(
          onTap: () {
            // Navigator.of(context).push(new MaterialPageRoute(
                // builder: (ctx) => new MovieDetail(movieId: id)));
          },
          child: new Column(
            children: <Widget>[
              new Container(
                height: 199,
                // color: Colors.blue,
                child: new Row(
                  children: <Widget>[
                    new Container(
                      width: 120.0,
                      height: 180.0,
                      margin: const EdgeInsets.all(10.0),
                      child: Image.network(movie["images"]["small"]),
                    ),
                    Expanded(
                      child: new Container(
                        height: 180.0,
                        margin: const EdgeInsets.all(12.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              "电影名称：$title",
                              style: titleStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                            new Text(
                              "电影类型：$type",
                              style: titleStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                            new Text(
                              "上映年份：$year",
                              style: titleStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                            new Text(
                              "豆瓣评分：$score",
                              style: titleStyle,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //分割线
              new Divider(height: 1)
            ],
          ),
        ));
  }
}

