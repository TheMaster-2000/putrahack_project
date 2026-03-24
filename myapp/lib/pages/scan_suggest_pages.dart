import 'package:flutter/material.dart';

class ScanSuggestPage extends StatefulWidget {
  const ScanSuggestPage({super.key});

  @override
  _ScanSuggestPageState createState() => _ScanSuggestPageState();
}

class _ScanSuggestPageState extends State<ScanSuggestPage> {
  TextEditingController inputController = TextEditingController();
  String aiResult = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan & Suggest"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Enter barcode or dietary goal:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: inputController,
              decoration: InputDecoration(
                hintText: "e.g., 0123456789 or high protein",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: getAI,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Get Suggestions",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            loading
                ? const CircularProgressIndicator()
                : Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        aiResult,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  /// Dummy AI function for hackathon prototype
  Future<void> getAI() async {
    String input = inputController.text.trim();
    if (input.isEmpty) return;

    setState(() {
      loading = true;
      aiResult = "";
    });

    await Future.delayed(const Duration(seconds: 1)); // simulate network delay

    setState(() {
      aiResult = "Dummy AI result for '$input':\n"
          "- Allergen check: None detected\n"
          "- Suggested Malaysian foods (high protein / healthy):\n"
          "  • Chicken\n"
          "  • Eggs\n"
          "  • Tempeh\n"
          "  • Tofu";
      loading = false;
    });
  }
}