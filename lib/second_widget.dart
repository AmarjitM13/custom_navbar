import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class SecondWidget extends StatefulWidget {
  final AutoScrollController controller;
  SecondWidget(this.controller);
  @override
  _SecondWidgetState createState() => _SecondWidgetState();
}

class _SecondWidgetState extends State<SecondWidget> {
  @override
  Widget build(BuildContext context) {
    return AutoScrollTag(
      key: ValueKey(1),
      controller: widget.controller,
      index: 1,
      child: Container(
        height: 350,
        width: MediaQuery.of(context).size.width,
        color: Colors.green,
        child: Center(
          child: Text('2'),
        ),
      ),
    );
  }
}
