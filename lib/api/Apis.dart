import 'package:flutter_news/constants/Constants.dart';
import 'package:flutter_news/events/BeanEvent.dart';
import 'package:flutter_news/models/network/NewsList.dart';

import 'Network.dart';
import 'dart:convert';

/* 网易新闻网络请求API*/
class API$Neteast {
  //1. 请求新闻列表接口
  getNewsList(String type, String id, int startPage) async {
    // String url =
    //     NetWork.NETEAST_HOST + 'nc/article/$type/$id/$startPage-20.html';
    String url =
        '${NetWork.NETEAST_HOST}nc/article/$type/$id/$startPage-20.html';
    // NetWork.get(url).then((data) {
    //   try {
    //     // Attempt to decode the JSON response
    //     Map<String, dynamic> map = json.decode(data);
    //     // Assuming BeanEvent is properly defined and NewsList has a fromJson method that matches this usage
    //     Constants.eventBus
    //         .fire(BeanEvent<NewsList>(id, NewsList.fromJson(id, map)));
    //   } catch (e) {
    //     // print('Error decoding JSON or firing event: $e');
    //     // Handle the error or notify the user
    //   }
    // });

    var data = await NetWork.getRequest(url);
    try {
      // Attempt to decode the JSON response
      Map<String, dynamic> map = json.decode(data);
      print(data);
      // Assuming BeanEvent is properly defined and NewsList has a fromJson method that matches this usage
      Constants.eventBus
          .fire(BeanEvent<NewsList>(id, NewsList.fromJson(id, map)));
    } catch (e) {
      // print('Error decoding JSON or firing event: $e');
      // Handle the error or notify the user
    }
  }

  //2. 请求新闻内容详情接口
  getNewsDetail(String postId) async {
    String url =
        '${NetWork.NETEAST_HOST}nc/article/nc/article/$postId/full.html';

    var data = await NetWork.postRequest(url, body: {postId: postId});
    print(data);

    // NetWork.get(url).then((data) {
    //   Map<String, dynamic> map = json.decode(data);

    //   Constants.eventBus
    //       .fire(BeanEvent<NewsList>(postId, NewsList.fromJson(postId, map)));
    // });
  }
}
