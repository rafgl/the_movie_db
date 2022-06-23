import 'package:flutter/material.dart';

class ClickOnCardWidget extends StatefulWidget {
  final double height;
  final double width;
  final Function() route;
  final bool isLink;

  ClickOnCardWidget({
    required this.height,
    required this.width,
    required this.route,
    required this.isLink,
  });

  @override
  State<ClickOnCardWidget> createState() => _ClickOnCardWidgetState();
}

class _ClickOnCardWidgetState extends State<ClickOnCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0),
      child: Ink(
        child: InkWell(
          splashColor: Colors.black.withOpacity(0.3),
          onTap: widget.route,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          child: Container(
            height: widget.height,
            width: widget.width,
            child: Container(),
          ),
        ),
      ),
    );
  }
}
