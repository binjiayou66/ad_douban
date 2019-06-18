import 'package:flutter/material.dart';
import 'dart:async';
import 'package:ad_douban/util/screen_util.dart';
import 'package:ad_douban/constant/constant.dart';

class AdPage extends StatelessWidget {
  final onCountDownFinishCallBack;

  AdPage({Key key, @required this.onCountDownFinishCallBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: ScreenUtils.screenW(context) / 3,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(Constant.ASSETS_IMG + 'home.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    '落花有意随流水,流水无心恋落花',
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment(1.0, 0.0),
                child: Container(
                  margin: const EdgeInsets.only(right: 30.0, top: 20.0),
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
                  child: CountDownWidget(
                    onCountDownFinishCallBack: (bool value) {
                      onCountDownFinishCallBack(value);
                    },
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xffEDEDED),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      Constant.ASSETS_IMG + 'ic_launcher.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Hi,豆芽',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ],
          ))
        ],
      ),
      width: ScreenUtils.screenW(context),
      height: ScreenUtils.screenH(context),
    );
  }
}

class CountDownWidget extends StatefulWidget {
  final onCountDownFinishCallBack;

  CountDownWidget({Key key, @required this.onCountDownFinishCallBack})
      : super(key: key);

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  var _seconds = 6;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_seconds',
      style: TextStyle(fontSize: 17.0),
    );
  }

  /// 启动倒计时的计时器。
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
      if (_seconds <= 1) {
        widget.onCountDownFinishCallBack(true);
        _cancelTimer();
        return;
      }
      _seconds--;
    });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    _timer?.cancel();
  }
}
