import 'package:flutter/material.dart';
import 'package:qr_code_advanced/screen/home_screen.dart';

class QrCode extends StatelessWidget {
  const QrCode({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
