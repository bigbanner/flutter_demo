import 'package:flutter/material.dart';
import 'package:flutter_news/pages/Welcome.dart';
import 'package:flutter_news/provider/auth_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:provider/provider.dart';

class Index extends StatelessWidget{
  const Index({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:const Text('欢迎登录')),
        body: const FormExample(),
      ),
    );
  }
}
class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameC = TextEditingController();
  final TextEditingController _passwordC = TextEditingController();
  
  void submitClick () async {
    final usernameStr = _usernameC.text;
    final passwordStr = _passwordC.text;
    List<int> bytes = utf8.encode(passwordStr);
    Digest digest = md5.convert(bytes);
    // 将MD5摘要转换为字符串
    String md5PasswordStr = digest.toString();

    print('账号是$usernameStr');
    print('密码是$md5PasswordStr');

    final uri = Uri.parse('https://rpasys.com/api/rpasys-auth/oauth/token?username=$usernameStr&password=$md5PasswordStr&grant_type=captcha&scope=all&type=account');
    String encodedString = base64Encode(utf8.encode('saber:saber_secret'));
    final headers = {  
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Basic $encodedString',
      "Host": 'rpasys.com'
    };
    final response = await http.post(uri, headers: headers);

    if (response.statusCode == 200) {  
      // 解析响应体  
      final bodyString = String.fromCharCodes(response.bodyBytes);  
      // 解析JSON（如果响应体是JSON格式的话）  
      final data = jsonDecode(bodyString); 
      print('response:$data');
      Provider.of<AuthProvider>(context, listen: false).setToken(data['access_token']);
       Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => const WelcomePage()));
    } else {  
      // 处理错误  
      print('Request failed with status: ${response.statusCode}');  
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child:Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextFormField(
            controller: _usernameC,
            decoration: const InputDecoration(
              labelText: '账号',
              hintText: '请输入账号',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return '请输入账号';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordC,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: '密码',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return '请输入账号';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: submitClick,
              child: const Text('登录'),
            ),
          ),
        ],
      ),
    )
    ); 
  }
}
