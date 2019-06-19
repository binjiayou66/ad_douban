import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ShopPage extends StatefulWidget {
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  // getWebTitle() async {
  //   String script = 'window.document.title';
  //   var title = await flutterWebviewPlugin.evalJavascript(script);
  //   print('Title ==== ' + title);
  // }

  // @override
  // void initState() {
  //   super.initState();

  //   flutterWebviewPlugin.onStateChanged
  //       .listen((WebViewStateChanged webViewState) async {
  //     switch (webViewState.type) {
  //       case WebViewState.finishLoad:
  //         getWebTitle();
  //         break;
  //       case WebViewState.shouldStart:
  //         break;
  //       case WebViewState.startLoad:
  //         break;
  //       case WebViewState.abortLoad:
  //         break;
  //     }
  //   });

  //   flutterWebviewPlugin.onUrlChanged.listen((String url) {
  //     print("URL changed === " + url);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://www.baidu.com",
    );
  }

  // @override
  // void dispose() {
  //   flutterWebviewPlugin.dispose();
  //   super.dispose();
  // }
}
