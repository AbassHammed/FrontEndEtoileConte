import 'package:flutter/material.dart';

class FooterLinks extends StatelessWidget {
  const FooterLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                // TODO: Handle privacy policy click
              },
              child: const Text(
                "Confidentialité",
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
            ),
            const Text(
              "·",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            TextButton(
              onPressed: () {
                // TODO: Handle terms of use click
              },
              child: const Text(
                "Conditions d'utilisation",
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
