import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';
import 'package:user_app/view/home/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: Myapp()));
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: SplashScreen.navigate(
        backgroundColor: Colors.white,
        name: 'assets/liquid_download.riv',
        next: (_) => const HomeScreen(),
        until: () => Future.delayed(const Duration(seconds: 5)),
        startAnimation: 'Demo',
      ),
    );
  }
}
