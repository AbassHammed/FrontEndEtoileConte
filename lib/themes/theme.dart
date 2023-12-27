import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const ColorScheme _darkColorScheme = ColorScheme(
  primary: Color(0xFF6200EA),
  secondary: Color(0xFF9E9E9E),
  tertiary: Color(0xFFE040FB),
  background: Color(0xFF121212),
  surface: Color(0xFF121212),
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onTertiary: Colors.white,
  onBackground: Colors.white,
  onSurface: Colors.white,
  brightness: Brightness.dark,
  error: Colors.red,
  onError: Colors.white,
);

const ColorScheme _lightColorScheme = ColorScheme(
  primary: Color(0xFF9C27B0),
  secondary: Color(0xFF9E9E9E),
  tertiary: Color(0xFFF50057),
  background: Color(0xFFFFF3E0),
  surface: Color(0xFFFFF3E0),
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onTertiary: Colors.white,
  onBackground: Colors.black,
  onSurface: Colors.black,
  brightness: Brightness.dark,
  error: Colors.red,
  onError: Colors.white,
);

class EtoileConteTheme extends StatelessWidget {
  final bool darkTheme;
  final bool dynamicColor;
  final Widget child;

  const EtoileConteTheme({
    super.key,
    this.darkTheme = false,
    this.dynamicColor = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = dynamicColor
        ? (darkTheme
            ? DynamicColorScheme.dark(context)
            : DynamicColorScheme.light(context))
        : (darkTheme ? _darkColorScheme : _lightColorScheme);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: colorScheme.primary,
      statusBarIconBrightness: darkTheme ? Brightness.light : Brightness.dark,
    ));

    return Theme(
      data: ThemeData.from(
        colorScheme: colorScheme,
        textTheme:
            Typography.material2018(platform: TargetPlatform.android).black,
      ),
      child: child,
    );
  }
}

class DynamicColorScheme {
  static ColorScheme dark(BuildContext context) {
    final Brightness platformBrightness =
        MediaQuery.of(context).platformBrightness;
    return platformBrightness == Brightness.dark
        ? _darkColorScheme
        : _lightColorScheme;
  }

  static ColorScheme light(BuildContext context) {
    final Brightness platformBrightness =
        MediaQuery.of(context).platformBrightness;
    return platformBrightness != Brightness.dark
        ? _lightColorScheme
        : _darkColorScheme;
  }
}
