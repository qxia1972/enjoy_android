import 'package:flutter/material.dart';
import 'package:enjoy_android/view/recommendArticlePage.dart';
import 'package:enjoy_android/view/projectPracticePage.dart';
import 'package:enjoy_android/view/wechatArticlePage.dart';
import 'package:enjoy_android/utils/color.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppState();
  }
}

class AppState extends State<App> with TickerProviderStateMixin {
  var _pageCtr;
  int _tabIndex = 0;
  @override
  void initState() {
    _pageCtr = PageController(initialPage: 0, keepPage: true);
  }

  @override
  void dispose() {
    _pageCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          controller: _pageCtr,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            RecommendArticlePage(),
            ProjectPracticePage(),
            WechatArticlePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _tabIndex,
            type: BottomNavigationBarType.fixed,
            fixedColor: Color(ColorConst.primaryColor),
            onTap: (index) => _tap(index),
            items: [
              BottomNavigationBarItem(
                  title: Text('推荐'), icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  title: Text('项目'), icon: Icon(Icons.map)),
              BottomNavigationBarItem(
                  title: Text('公众号'), icon: Icon(Icons.contact_mail)),
            ]),
      ),
    );
  }

  _tap(int index) {
    setState(() {
      _tabIndex = index;
      _pageCtr.jumpToPage(index);
    });
  }
}