import 'package:flutter/material.dart';

class EtoileConteScreen extends StatelessWidget {
  const EtoileConteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6F49C8),
      body: Box(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Add the menu icon here
              const Icon(
                Icons.menu, // Replace with your menu icon
                color: Colors.white,
              ),
              const SizedBox(height: 16),
              // Add your logo here
              Center(
                child: Image.asset(
                  'assets/ic_logo.png', // Replace with your logo asset path
                  width: 100.0,
                  height: 100.0,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Laissez l'imagination de votre enfant s'envoler avec EtoileConte.",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                "Payez uniquement pour les histoires que vous écoutez.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // TODO: Handle listen sample
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), // fillMaxWidth
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Assuming you have an icon for the sample
                    Icon(
                      Icons.audiotrack, // Replace with your sample icon
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text("Écouter un échantillon"),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // TODO: Handle listen story
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), // fillMaxWidth
                ),
                child: const Text("Écouter une histoire"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  final Widget child;
  final Alignment alignment;

  const Box({super.key, required this.child, this.alignment = Alignment.center});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: child,
    );
  }
}

void main() {
  runApp(const MaterialApp(home: EtoileConteScreen()));
}
