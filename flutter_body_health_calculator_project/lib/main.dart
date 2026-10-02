import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'views/splash_screen_ui.dart';

void main() {
  runApp(const BodyHealthApp());
}

class BodyHealthApp extends StatelessWidget {
  const BodyHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Body ว้าว',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE04000)),
        useMaterial3: true,
        textTheme: GoogleFonts.kanitTextTheme(),
      ),
      home: const SplashScreenUI(),
    );
  }
}
