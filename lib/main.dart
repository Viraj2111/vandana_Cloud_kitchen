import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vandana/Services/storage_services.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageServices.initializeSharedPreferences();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemStatusBarContrastEnforced: true,
    ),
  );
  runApp(const VandanaKitchenApp());
}
