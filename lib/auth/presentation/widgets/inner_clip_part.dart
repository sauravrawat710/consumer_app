import 'package:flutter/material.dart';

class InnerClippedPart extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    //
    // ignore: cascade_invocations
    path.moveTo(size.width * 0.7, 0);
    // ignore: cascade_invocations
    path.lineTo(size.width, 0);
    // ignore: cascade_invocations
    path.lineTo(size.width, size.height * 0.1);
    //
    // ignore: cascade_invocations
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.11, size.width * 0.7, 0);

    //
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
