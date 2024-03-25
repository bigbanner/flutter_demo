import 'package:flutter/material.dart';
import 'package:flutter_news/api/Apis.dart';
import 'package:flutter_news/events/BeanEvent.dart';
import 'package:flutter_news/constants/Constants.dart';
import 'package:flutter_news/models/network/ClassList.dart';


class ClassFormList extends StatefulWidget {
  const ClassFormList({super.key});
  @override
  State<ClassFormList> createState() => _ClassFormListState();
}

class _ClassFormListState extends State<ClassFormList>
    with AutomaticKeepAliveClientMixin {
  //当前页
  int _page = 0;
  //网络请求接口
  late API$Neteast _api;
  //该频道下的所有班级数据
  List<RecordsItem> _datas = [];
  late ScrollController _listController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _api = API$Neteast();
    _datas = [];
    _listController = ScrollController();
    _listController.addListener(() {
      var maxScroll = _listController.position.maxScrollExtent;
      var pixels = _listController.position.pixels;
      if (maxScroll == pixels) {
        _page += 20;
        _getClassList();
      }
    });

    Constants.eventBus.on<BeanEvent<ClassFormListModel>>().listen((event) {
        setState(() {
          ClassFormListModel data = event.data;
          _datas.addAll(data.data.list.records);
        });
    });
    _getClassList();
  }

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }

  Future<Null> _pullToRefresh() async {
    _page = 0;
    _datas.clear();
    _getClassList();
    return null;
  }

  _getClassList() {
    _api.getClassList(_page);
  }


  Widget _renderRow(int position) {
    if (position.isOdd) return const Divider();
    final index = position ~/ 2;
    RecordsItem data = _datas[index];

    return Card(
      color: Colors.grey[250],
      elevation: 5.0,
      child: const InkWell(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           Expanded(
              child: Text('aa1', textAlign: TextAlign.center),
            ),
            Expanded(
              child: Text('ss2', textAlign: TextAlign.center),
            ),
            Expanded(
              child: Text('ss3', textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_datas.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    } else {
      Widget listView = ListView.builder(
        padding:const EdgeInsets.all(10.0),
        itemCount: _datas.length * 2,
        itemBuilder: (context, i) => _renderRow(i),
        controller: _listController,
      );
      return RefreshIndicator(onRefresh: _pullToRefresh, child: listView);
    }
  }
}
