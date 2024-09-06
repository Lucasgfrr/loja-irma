import 'package:flutter/material.dart';

class QuarterCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width, 0); //circuferencia da diagonal
    path.arcToPoint(
      Offset(0, size.height),
      radius: Radius.circular(size.width),
      clockwise: false,
    );
    path.lineTo(size.width, 200);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
/*
class QuarterCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.arcToPoint(Offset(-0, -0),
        radius: Radius.circular(size.width), clockwise: false);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
*/