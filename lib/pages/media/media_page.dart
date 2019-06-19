import 'package:flutter/material.dart';
import 'package:ad_douban/util/widget_decoration.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MediaPage extends StatefulWidget {
  _MediaPageState createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: WebView(
              key: _key,
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: "https://www.baidu.com",
            ),
          )
        ],
      ),
    );
  }
}
