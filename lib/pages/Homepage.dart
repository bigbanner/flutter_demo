import 'package:flutter/material.dart';
import './AboutPage.dart';
import 'package:flutter_news/models/local/Channel.dart';
import 'package:flutter_news/constants/Constants.dart';
import 'dart:convert';
import 'package:flutter_news/widgets/Newslistwidget.dart';

class HomePage extends StatefulWidget {
  // HomePage({key: key}) : super(key: key);

  // HomePageState createState() => _HomePageState();

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;
  late List<Channel> channels = [];

  @override
  initState() {
    super.initState();
    _initChannelData();
    _tabController = TabController(length: channels.length, vsync: this);
  }

  @override
  dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //加载初始化json数据
  _initChannelData() {
    debugPrint(" --- 数据初始化 --- ");
    Future<String> data =
        DefaultAssetBundle.of(context).loadString("assets/config/channel.json");

    data.then((String value) {
      setState(() {
        List<dynamic> data = json.decode(value);
        for (var tmp in data) {
          channels.add(Channel.fromJson(tmp));
        }
      });
    });
  }

  PreferredSizeWidget _initChannelTitle() {
    return TabBar(
        controller: _tabController,
        indicatorColor: Colors.blue,
        tabs: channels
            .map((Channel channel) => Tab(text: channel.channelName))
            .toList());
  }

  //初始化列表内容
  Widget _initChannelList() {
    return TabBarView(
      controller: _tabController,
      children: channels.map((Channel channel) {
        return NewsListWidget(channel: channel);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
        length: channels.length,
        child: Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.title),
            title: const Text(Strings.appTitle),
            bottom: _initChannelTitle(),
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.assessment),
                  onPressed: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutPage()));
                  })),
            ],
          ),
          body: _initChannelList(),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
