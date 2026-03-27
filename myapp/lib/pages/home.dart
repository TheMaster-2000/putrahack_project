import 'package:flutter/material.dart';
import 'scan_suggest_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCCD6EF),
      body: Column(
        children: [
          CurvedHeader(),
          MiddleBox(),
          TaskBar(),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Welcome, User',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            ],
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

    path.lineTo(0, size.height - 60);

    path.quadraticBezierTo(
      size.width / 2,
      size.height + 40,
      size.width,
      size.height - 60,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

//! ni mungkin akan ditukar lagi sbb nk masuk data user and make it scroll able
class MiddleBox extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
        child: Column(
          children: [
            SizedBox(height: 50),

            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal:20.0 , vertical:8.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('Your food today')
                  ),
                ]
              ),
            ),
          ],
        ),
      );
    }
  }

  //! ni Ai tolong ( aku taktau nk buat mcm mana - mungkin akan ditukar)
  class TaskBar extends StatelessWidget {
  const TaskBar({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Total height for the stack area
      width: 350,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none, // Allows the circle to "pop out" of the top
        children: [
          // 1. The Main Blue Bar
          Container(
            width: 500,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF5378CD),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.info_outline, color: Colors.black),
                const Icon(Icons.restaurant_menu, color: Colors.black),
                const SizedBox(width: 50), // Gap for the center button
                const Icon(Icons.calculate_outlined, color: Colors.black),
                const Icon(Icons.phone_outlined, color: Colors.black),
              ],
            ),
          ),

          // 2. The Floating Center Button
          Positioned(
            top: 110, // Adjust this to move the circle up or down
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: const Color(0xFF5378CD), // Match bar color
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4), // The white ring
              ),
              child: const Center(
                child: Icon(Icons.qr_code_scanner, color: Colors.black, size: 35),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
       