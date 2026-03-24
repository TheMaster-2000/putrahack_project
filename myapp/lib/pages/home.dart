
import 'package:flutter/material.dart';
import 'scan_suggest_pages.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healthy',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10)
      ),
      child: Icon(
        Icons.menu,
        color: Colors.white,
      )
    ),
   ),
   body: Padding(
    padding: const EdgeInsets.all(16.0),
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
        'Welcome to Healthy!',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
          textAlign:TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          'Scan your food or get personalized suggestion based on your dietary goals',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40),
        ElevatedButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute( 
                builder: (context) => const ScanSuggestPage()),
            );
          },
          style: ElevatedButton.styleFrom( 
            padding: EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder( 
              borderRadius: BorderRadius.circular(10),
            )
          ),
          child: Text(
            'Go to Scan & Suggest',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    ),
   ),
    );
  }
}
