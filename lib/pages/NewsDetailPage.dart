import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/constants/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailPage extends StatefulWidget {
  final String? url;
  final String? title;
  final String? postId;
  const NewsDetailPage({super.key, this.postId, this.url, this.title});

  @override
  State<StatefulWidget> createState() => NewsDetailPageState();
}

class NewsDetailPageState extends State<NewsDetailPage> {
  bool loaded = false;
  late String detailDataStr;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> titleContent = [];
    titleContent.add(Text(
        widget.title == null ? Strings.newsDetail : widget.title as String,
        style: const TextStyle(color: Colors.white)));
    if (!loaded) {
      titleContent.add(const CupertinoActivityIndicator());
    }
    titleContent.add(Container(width: 50.0));
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: titleContent,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: WebView(
        initialUrl: widget.url=='' ? 'https://flutter.dev/' : widget.url as String,
        onWebViewCreated: (WebViewController webViewController) {
          // print("webViewController:${webViewController}");
        },
        onPageFinished: (url) => {
          setState(() {
            loaded = true;
          })
        },
      ),
    );
  }
}
