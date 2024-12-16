import 'package:athar/app/app.dart';
import 'package:athar/bootstrap.dart';
import 'package:athar/flavors/development/firebase_options_development.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'Athar-dev',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await bootstrap(App.new);
}
