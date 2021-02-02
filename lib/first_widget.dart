import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class FirstWidget extends StatefulWidget {
  final AutoScrollController controller;
  FirstWidget(this.controller);
  @override
  _FirstWidgetState createState() => _FirstWidgetState();
}

class _FirstWidgetState extends State<FirstWidget> {
  @override
  Widget build(BuildContext context) {
    return AutoScrollTag(
      key: ValueKey(0),
      controller: widget.controller,
      index: 0,
      child: Container(
        height: 500,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
        child: Center(
          child: Text('1'),
        ),
      ),
    );
  }
}
