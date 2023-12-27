import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'SignUpPage.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9288F8),
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 0.0,
            child: Image.asset(
              'assets/Etoile.png',
              width: 150.0,
              height: 150.0,
            ),
          ),
          _buildMainContent(context),
        ],
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: screenSize.width * 0.9,
        height: screenSize.height * 0.6,
        padding:
            const EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 24),
        decoration: BoxDecoration(
          color: const Color(0xFF0A133E),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildHeaderText(context),
            const SizedBox(height: 32),
            _signUpButton(context),
            const SizedBox(height: 16),
            _loginOutlinedButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderText(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var themeData = Theme.of(context);

    double titleFontSize = screenSize.width / 13;
    double subtitleFontSize = screenSize.width / 25;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    'Plongez dans un monde magique de rêves et d\'aventures avec ',
                style: themeData.textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontSize: titleFontSize,
                ),
              ),
              TextSpan(
                text: 'EtoileConte',
                style: themeData.textTheme.displaySmall?.copyWith(
                  color: const Color(0xFFF99417),
                  fontSize: titleFontSize,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Votre application incontournable pour raconter des histoires captivantes aux enfants, chaque soir, en français.',
          style: themeData.textTheme.titleMedium
              ?.copyWith(color: Colors.white, fontSize: subtitleFontSize),
        ),
      ],
    );
  }

  Widget _signUpButton(BuildContext context) {
    var themeData = Theme.of(context);

    return ElevatedButton(
      onPressed: () => _navigateToSignUpPage(context),
      style: ElevatedButton.styleFrom(
        foregroundColor: themeData.colorScheme.onSecondary,
        backgroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 65),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        "S'inscrire",
        style: TextStyle(color: Colors.black, fontSize: 25),
      ),
    );
  }

  Widget _loginOutlinedButton(BuildContext context) {
    return OutlinedButton(
      onPressed: () => _navigateToLoginPage(context),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: const BorderSide(
            color: Color(0xFFF99417),
            width: 2), // Increase the border width here
        minimumSize: const Size(double.infinity, 65),
      ),
      child: const Text(
        "Se connecter",
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  void _navigateToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  void _navigateToSignUpPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: const DashBoard(),
    theme: ThemeData(
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF6F35A5),
        onPrimary: Colors.white,
        secondary: Color(0xFFF1E6FF),
        onSecondary: Colors.black,
      ),
      fontFamily: 'Montserrat',
      textTheme: const TextTheme(
        headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 16),
      ),
    ),
  ));
}
