import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.text,@required this.onTap});

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        child: Center(child: Text(text, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),)),
        margin: EdgeInsets.only(top: 5.0),
        height: kBottomContainerHeight,
        color: kBottomContainerColor,
        padding: EdgeInsets.only(bottom: 10.0),
      ),
    );
  }
}