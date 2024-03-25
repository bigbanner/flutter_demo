import 'package:flutter/material.dart';

class ClassList extends StatelessWidget {

  const ClassList({super.key});
  

  @override
  Widget build(BuildContext context) {
    const title = '班级列表';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(100,(index) => ItemWidget(text: 'Item $index')),
              ),
            ),
          );
        }),
        // body: ListView(
        //   children: const <Widget>[
        //     ListTile(
        //       leading: Icon(Icons.map),
        //       title: Text('Map'),
        //     ),
        //     ListTile(
        //       leading: Icon(Icons.photo_album),
        //       title: Text('Album'),
        //     ),
        //     ListTile(
        //       leading: Icon(Icons.phone),
        //       title: Text('Phone'),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return const Card(
      child:SizedBox(
        height: 100,
        child:Row(
          children: <Widget>[
           Expanded(child: Text('text',textAlign:TextAlign.center)),
           Expanded(child: Text('dddd2',textAlign:TextAlign.center)),
           Expanded(child: Text('dddd3',textAlign:TextAlign.center)),
          ],
        ),
      ),
    );
  }
}