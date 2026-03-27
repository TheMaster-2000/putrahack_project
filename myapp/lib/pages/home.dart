import 'package:flutter/material.dart';
import 'scan_suggest_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CurvedHeader()
        ]
      ),
    );
  }
}
class CurvedHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        height: 250,
        width: double.infinity,
        color: Color(0xFF5378CD),
        child: SafeArea(
          child: Center(
            child: Text(
              "WELCOME",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 100);

    path.quadraticBezierTo(
      size.width / 2,
      size.height + 100,
      size.width,
      size.height - 100,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}