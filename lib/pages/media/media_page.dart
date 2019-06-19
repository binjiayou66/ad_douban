import 'package:flutter/material.dart';
import 'package:ad_douban/util/widget_decoration.dart';

class MediaPage extends StatefulWidget {
  _MediaPageState createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  @override
  Widget build(BuildContext context) {
    return WidgetDecoration(Text("Hello Media."))
        .align(alignment: FractionalOffset.center)
        .build();
  }
}
