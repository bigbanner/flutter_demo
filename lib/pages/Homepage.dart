import 'package:flutter/material.dart';
import './AboutPage.dart';
import 'package:flutter_news/models/local/Channel.dart';
import 'package:flutter_news/constants/Constants.dart';
import 'dart:convert';
import 'package:flutter_news/widgets/Newslistwidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;
  late List<Channel> channels = [];

  @override
  initState() {
    super.initState();
    _initChannelData();
  }

  @override
  dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _initChannelData() async {
    // Initialize the TabController with the current length of channels.
    // This will be updated once we load the channel data.
    _tabController = TabController(length: channels.length, vsync: this);
    try {
      // Load the JSON string from the assets
      String dataString = await DefaultAssetBundle.of(context)
          .loadString("assets/config/channel.json");
      List<dynamic> jsonData = json.decode(dataString);

      setState(() {
        channels.clear();
        for (var tmp in jsonData) {
          channels.add(Channel.fromJson(tmp));
        }
        _tabController = TabController(length: channels.length, vsync: this);
      });
    } catch (e) {
      debugPrint("Failed to load channel data: $e");
    }
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
