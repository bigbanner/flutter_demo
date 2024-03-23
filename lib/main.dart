import 'package:flutter/material.dart';
// import 'pages/HomePage.dart';
import 'pages/index.dart';
import 'provider/auth_provider.dart';

void main() {
    runApp(const FlutterNews());
  
}

class FlutterNews extends StatefulWidget {
  const FlutterNews({super.key});

  @override
  State<FlutterNews> createState() => _FlutterNewsState();
}

class _FlutterNewsState extends State<FlutterNews> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme =
        ThemeData(brightness: Brightness.light, primaryColor: Colors.blue);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: const Index());
  }
}
