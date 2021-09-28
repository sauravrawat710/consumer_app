import 'package:flutter/material.dart';

class OuterClippedPart extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    //
    // ignore: cascade_invocations
    path.moveTo(size.width / 2, 0);
    // ignore: cascade_invocations
    path.lineTo(size.width, 0);
    // ignore: cascade_invocations
    path.lineTo(size.width, size.height / 4);
    //
    // ignore: cascade_invocations
    path.cubicTo(size.width * 0.55, size.height * 0.16, size.width * 0.85,
        size.height * 0.05, size.width / 2, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
