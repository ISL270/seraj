import 'package:athar/app/app.dart';
import 'package:athar/app/core/constants/app_colors.dart';
import 'package:athar/bootstrap.dart';
import 'package:athar/flavors/development/firebase_options_development.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.secondaryDark,
  ));
  await Firebase.initializeApp(name: 'Athar', options: DefaultFirebaseOptions.currentPlatform);
  await bootstrap(App.new);
}
