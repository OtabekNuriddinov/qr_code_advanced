import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_advanced/app.dart';
import '/app_state/change_notifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: QrCode(),
    ),
  );
}
