import 'package:flutter/material.dart';
import 'scan_suggest_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text("MakanSafe"),
        backgroundColor: Colors.black,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            /// HERO SECTION
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.green],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),

              child: Column(
                children: const [
                  SizedBox(height: 20),

                  Text(
                    "Eat Safely & Smartly",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Scan food, detect allergens, and get diet suggestions",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// BUTTONS
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {},
                    child: const Text("Scan Product"),
                  ),

                  const SizedBox(height: 10),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ScanSuggestPage(),
                        ),
                      );
                    },
                    child: const Text("Get Suggestions"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// FEATURE CARDS

            featureCard(
              Icons.qr_code,
              "Barcode Scanner",
              "Scan food to detect allergens",
            ),

            featureCard(
              Icons.restaurant,
              "Meal Suggestions",
              "Get diet suggestions",
            ),

            featureCard(
              Icons.shield,
              "Allergen Alert",
              "Warn unsafe food",
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget featureCard(IconData icon, String title, String desc) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        elevation: 4,
        child: ListTile(
          leading: Icon(icon, size: 40),
          title: Text(title),
          subtitle: Text(desc),
        ),
      ),
    );
  }
}