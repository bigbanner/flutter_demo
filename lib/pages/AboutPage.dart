import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter_news/constants/Constants.dart';

// import 'Newsdetailpage.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(Strings.aboutTitle),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const FlutterLogo(
                size: 55.0,
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
              ),
              const Text('作者:${Strings.author}',
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              Container(
                padding: const EdgeInsets.all(5.0),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
              ),
            ],
          ),
        ));
  }
}
