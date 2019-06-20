import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ad_douban/pages/common/webview_page.dart';
import 'package:ad_douban/pages/home/home_page.dart';

class Router {
  static const homePage = 'app://';
  static const searchPage = 'app://search';

  Widget _getPage(String url, dynamic params) {
    if (url.startsWith('https://') || url.startsWith('http://')) {
      return WebViewPage(url: url);
    } else {
      switch (url) {
        case homePage:
          return HomePage();
        case searchPage:
        //return SearchPage(searchHintContent: params);
      }
    }
    return null;
  }

  Router.push(BuildContext context, String url, {dynamic params}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, params);
    }));
  }
}
