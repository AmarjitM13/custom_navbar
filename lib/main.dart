import 'package:custom_navbar/first_widget.dart';
import 'package:custom_navbar/second_widget.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Navbar',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scrollDirection = Axis.vertical;

  AutoScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(onPressed: () async{
              await controller.scrollToIndex(0, preferPosition: AutoScrollPosition.begin);
            }, child: Text('1')),
            FlatButton(onPressed: () async{
              await controller.scrollToIndex(1, preferPosition: AutoScrollPosition.begin);
            }, child: Text('2')),
            FlatButton(onPressed: () async{
              await controller.scrollToIndex(2, preferPosition: AutoScrollPosition.begin);
            }, child: Text('3')),
            FlatButton(onPressed: () async{
              await controller.scrollToIndex(3, preferPosition: AutoScrollPosition.begin);
            }, child: Text('4')),
            FlatButton(onPressed: () async{
              await controller.scrollToIndex(4, preferPosition: AutoScrollPosition.begin);
            }, child: Text('5')),
          ],
        ),
      ),
      body: ListView(
        scrollDirection: scrollDirection,
        controller: controller,
        children: [
          FirstWidget(controller),
          SecondWidget(controller),
          item(2, 250, Colors.orange),
          item(3, 300, Colors.yellow),
          item(4, 500, Colors.grey),
        ],
      ),
    );
  }

  Widget item(int index, double height, Color colorname) {
    return AutoScrollTag(
        key: ValueKey(index),
        controller: controller,
        index: index,
        child: Container(
          color: colorname,
          height: height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text('$index'),
          ),
        ));
  }
}
