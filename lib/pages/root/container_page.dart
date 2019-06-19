import 'package:flutter/material.dart';
import 'package:ad_douban/pages/home/home_page.dart';
import 'package:ad_douban/pages/media/media_page.dart';
import 'package:ad_douban/pages/group/group_page.dart';
import 'package:ad_douban/pages/shop/shop_page.dart';
import 'package:ad_douban/pages/mine/mine_page.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  int _selectedIndex = 0;
  List<Widget> pages;
  List<BottomNavigationBarItem> itemList;
  FlutterWebviewPlugin webviewPlugin = FlutterWebviewPlugin();

  final defualtItemColor = Color.fromARGB(255, 125, 125, 125);

  final items = [
    _Item('首页', 'assets/images/ic_tab_home_active.png',
        'assets/images/ic_tab_home_normal.png'),
    _Item('书影音', 'assets/images/ic_tab_subject_active.png',
        'assets/images/ic_tab_subject_normal.png'),
    _Item('小组', 'assets/images/ic_tab_group_active.png',
        'assets/images/ic_tab_group_normal.png'),
    _Item('市集', 'assets/images/ic_tab_shiji_active.png',
        'assets/images/ic_tab_shiji_normal.png'),
    _Item('我的', 'assets/images/ic_tab_profile_active.png',
        'assets/images/ic_tab_profile_normal.png')
  ];

  @override
  void initState() {
    super.initState();

    if (pages == null) {
      pages = [HomePage(), MediaPage(), GroupPage(), ShopPage(), MinePage()];
    }
    if (itemList == null) {
      itemList = items
          .map((item) => BottomNavigationBarItem(
              icon: Image.asset(item.normalIcon, width: 30.0, height: 30.0),
              title: Text(item.name, style: TextStyle(fontSize: 10.0)),
              activeIcon:
                  Image.asset(item.activeIcon, width: 30.0, height: 30.0)))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          _getPagesWidget(0),
          _getPagesWidget(1),
          _getPagesWidget(2),
          _getPagesWidget(3),
          _getPagesWidget(4),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: BottomNavigationBar(
        items: itemList,
        onTap: (int index) {
          if (index == 3) {
            webviewPlugin.show();
          } else {
            webviewPlugin.hide();
          }
          setState(() {
            _selectedIndex = index;
          });
        },
        iconSize: 24,
        currentIndex: _selectedIndex,
        fixedColor: Color.fromARGB(255, 0, 188, 96),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _getPagesWidget(int index) {
    return Offstage(
      offstage: _selectedIndex != index,
      child: TickerMode(
        enabled: _selectedIndex == index,
        child: pages[index],
      ),
    );
  }
}

class _Item {
  String name, activeIcon, normalIcon;

  _Item(this.name, this.activeIcon, this.normalIcon);
}
