import 'package:flutter/material.dart';
import '../widgets/footer.dart';
import 'LoginPage.dart';
import '../models/user.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _familyNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9288F8),
      body: Stack(
        alignment: Alignment.center,
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
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Card(
                color: const Color(0xFF0A133E),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 48.0),
                      const Text(
                        "S'inscrire",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: _familyNameController,
                        decoration: InputDecoration(
                          labelText: 'Nom de famille',
                          labelStyle: const TextStyle(color: Color(0xFFA9A9A9)),
                          errorText: _isError ? 'Invalid Nom de Famille' : null,
                        ),
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 8.0),
                      TextField(
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          labelText: 'Prénom',
                          labelStyle: const TextStyle(color: Color(0xFFA9A9A9)),
                          errorText: _isError ? 'Invalid prénom' : null,
                        ),
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 8.0),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: "Adresse mail",
                          labelStyle: const TextStyle(color: Color(0xFFA9A9A9)),
                          errorText: _isError ? 'Invalid email' : null,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 8.0),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: "Mot de passe",
                          labelStyle: const TextStyle(color: Color(0xFFA9A9A9)),
                          errorText: _isError ? 'Invalid password' : null,
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 8.0),
                      TextField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          labelText: "Confirmer le mot de passes",
                          labelStyle: const TextStyle(color: Color(0xFFA9A9A9)),
                          errorText: _isError ? 'Invalid password' : null,
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF99417),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        onPressed: () => _attemptSignUp(context),
                        child: const Text(
                          "S'inscrire",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextButton(
                        onPressed: () => _navigateToLoginPage(context),
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(fontSize: 12.0),
                            children: [
                              TextSpan(
                                text: "Vous avez déjà un compte ? ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: " se connecter ici",
                                style: TextStyle(
                                    color: Color(0xFFF99417),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: FooterLinks(),
          ),
        ],
      ),
    );
  }

  void _attemptSignUp(BuildContext context) async {
    final lastname = _familyNameController.text;
    final firstname = _firstNameController.text;
    final confirmPassword = _confirmPasswordController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        await CustomUser.registerUser(
            context, email, firstname, lastname, password, confirmPassword);
      } catch (e) {
        setState(() {
          _isError = true;
        });
      }
    } else {
      setState(() => _isError = true);
    }
  }

  void _navigateToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  void dispose() {
    _familyNameController.dispose();
    _firstNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
