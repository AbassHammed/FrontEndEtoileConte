import 'package:flutter/material.dart';
import 'SignUpPage.dart';
import '../models/user.dart';
import '../widgets/footer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9288F8),
      body: Stack(alignment: Alignment.center, children: [
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
                    "Connexion",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.white),
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
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Mot de passe",
                      labelStyle: const TextStyle(color: Color(0xFFA9A9A9)),
                      errorText: _isError ? 'Invalid password' : null,
                    ),
                    obscureText: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // TODO: Handle forgot password
                      },
                      child: const Text(
                        "Mot de passe oublié ?",
                        style: TextStyle(color: Color(0xFFF99417)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF99417),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    onPressed: () => _attemptLogin(context),
                    child: const Text(
                      "Se connecter",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextButton(
                    onPressed: () => _navigateToSignUpPage(context),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 12.0),
                        children: [
                          TextSpan(
                            text: "Vous n'avez pas de compte ? ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: " inscrivez-vous ici",
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
        const Align(
          alignment: Alignment.bottomCenter,
          child: FooterLinks(),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _attemptLogin(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        await CustomUser.loginUser(context, email, password);
      } catch (e) {
        setState(() {
          _isError = true;
        });
      }
    } else {
      setState(() => _isError = true);
    }
  }

  void _navigateToSignUpPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
  }
}

class Box extends StatelessWidget {
  final Widget child;
  final Alignment alignment;

  const Box(
      {super.key, required this.child, this.alignment = Alignment.center});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: child,
    );
  }
}