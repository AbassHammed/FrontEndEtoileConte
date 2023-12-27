import 'package:flutter/material.dart';
import 'package:testing/themes/theme.dart';
// import './screens/dash_board.dart';
// import './screens/LoginPage.dart';
// import './screens/MainPage.dart';
// import './screens/SignUpPage.dart';
import './screens/login_page.dart';

void main() {
  runApp(const EtoileConteApp());
}

class EtoileConteApp extends StatelessWidget {
  const EtoileConteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const EtoileConteTheme(
      darkTheme: true,
      dynamicColor: true,
      child: MaterialApp(
        title: 'EtoileConte',
        home: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: const [
        // MaterialPage(child: SignUpPage()),
        // MaterialPage(child: DashBoard()),
        // MaterialPage(child: EtoileConteApp()),
        MaterialPage(child: LoginPage()),
        // MaterialPage(child: SignUpPage()),
        // MaterialPage(child: EtoileConteScreen())
      ],
      onPopPage: (route, result) => route.didPop(result),
    );
  }
}
