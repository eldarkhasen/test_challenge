import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, h);
    path.lineTo(w * 0.65, h - h * 0.22);
    path.quadraticBezierTo(w * 0.8, h - h * 0.27, w * 0.9, h - h * 0.15);
    path.lineTo(w * 0.9, h - h * 0.15);
    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
