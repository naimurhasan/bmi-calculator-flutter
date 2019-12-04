import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.child, this.onTapPressed});

  final Color colour;
  final Widget child;
  final Function onTapPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapPressed,
      child: Container(
        child: child,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
