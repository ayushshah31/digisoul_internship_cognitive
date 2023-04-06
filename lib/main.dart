import 'package:cognition_package/cognition_package.dart';
import 'package:flutter/material.dart';
import 'package:trial/user_demographics_page.dart';

Future main() async {
  CognitionPackage.ensureInitialized();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      title: 'Cognition Package Demo',
      home: UserDemographicsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
