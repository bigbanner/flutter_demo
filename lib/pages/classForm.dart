import 'package:flutter/material.dart';
import 'package:flutter_news/api/Apis.dart';
import 'package:flutter_news/constants/Constants.dart';
import 'package:flutter_news/models/network/classForm.dart';
import 'package:flutter_news/widgets/classFormWidget.dart';

class ClassFormPage extends StatelessWidget{
  const ClassFormPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title:const Text('班级表单')),
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
  final TextEditingController _classStr = TextEditingController();
  final TextEditingController _nameStr = TextEditingController();
  final TextEditingController _age = TextEditingController();
  late API$Neteast _api;

@override
void initState (){
  super.initState();
  _api = API$Neteast();
  _api.getClassForm();

  Constants.eventBus.on<ClassForm>().listen((event) {
      setState(() {
        print('object:$event.data');
      });
    });
}
  
  void submitClick () async {
    final classStr = _classStr.text;
    final nameStr = _nameStr.text;
    final age = _age.text;

    print('班级是$classStr');
    print('姓名是$nameStr');
    print('年龄是$age');

    await _api.submitClassForm(classStr,nameStr,age);
    Navigator.push(context,MaterialPageRoute(builder: (context) => const ClassFormList()));
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
            controller: _classStr,
            decoration: const InputDecoration(
              labelText: '班级',
              hintText: '请输入班级',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return '请输入班级';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _nameStr,
            decoration: const InputDecoration(
              labelText: '姓名',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return '请输入姓名';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _age,
            decoration: const InputDecoration(
              labelText: '年龄',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return '请输入年龄';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: submitClick,
              child: const Text('提交按钮'),
            ),
          ),
        ],
      ),
    )
    ); 
  }
}
