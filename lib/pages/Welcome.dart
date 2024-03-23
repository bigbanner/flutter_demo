import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network('https://www.rpasys.com/assets/bgtop3.844d0ccb.png'),
           const Text(
              '欢迎使用我们的应用',
              style:TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                '超自动化管理平台正式上线。版本V1.0全新上线 简洁易用灵活搭建',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const ElevatedButton(
            onPressed:null,
            child:Text(
                '开始',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
          ),
          ],
        ),
      ),
    );
  }
}
