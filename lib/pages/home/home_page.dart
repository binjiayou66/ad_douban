import 'package:flutter/material.dart';

var _tabs = ['动态', '推荐'];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Hello Group."),
      ),
    );
    return DefaultTabController(
      initialIndex: 1,
      length: _tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: _headerSliverBuilder,
        body: TabBarView(
            children: _tabs.map((String name) {
          return SliverContainer(name: name);
        }).toList()),
      ),
    );
  }

  List<Widget> _headerSliverBuilder(
      BuildContext context, bool innerBoxIsScrolled) {
    return null;
  }
}

class SliverContainer extends StatefulWidget {
  final String name;

  SliverContainer({Key key, @required this.name}) : super(key: key);

  @override
  _SliverContainerState createState() => _SliverContainerState();
}

class _SliverContainerState extends State<SliverContainer> {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}
