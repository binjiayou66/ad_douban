import 'package:flutter/material.dart';
import 'package:ad_douban/pages/root/container_page.dart';
import 'package:ad_douban/pages/root/ad_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var container = ContainerPage();
  bool showAd = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Offstage(
          child: container,
          offstage: showAd,
        ),
        Offstage(
          child: AdPage(onCountDownFinishCallBack: (value) {
            if (value) {
              setState(() {
                showAd = false;
              });
            }
          }),
          offstage: !showAd,
        ),
      ],
    );
  }
}
