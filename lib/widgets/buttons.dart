//////////////////////////////////////////////////////
// here are the diferents style buttons of the project
//////////////////////////////////////////////////////
import 'package:flutter/material.dart';

///////////////Style 1: ButtonDownPriority
class ButtonDownPriority extends StatelessWidget {
  ButtonDownPriority(this.text, this.color, this.widget);
  final String text;
  final Color color;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlineButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: color,
        highlightedBorderColor: Colors.white,
        onPressed: () => widget,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
