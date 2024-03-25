import 'package:flutter_news/constants/Constants.dart';
import 'package:flutter_news/events/BeanEvent.dart';
import 'package:flutter_news/models/network/ClassList.dart';
import 'package:flutter_news/models/network/NewsList.dart';
import 'package:flutter_news/models/network/classForm.dart';

import 'Network.dart';

/* 网易新闻网络请求API*/
class API$Neteast {
  //1. 请求新闻列表接口
  getNewsList(String type, String id, int startPage) async {
    // String url =
    //     NetWork.NETEAST_HOST + 'nc/article/$type/$id/$startPage-20.html';
    String url =
        '${NetWork.NETEAST_HOST}nc/article/$type/$id/$startPage-20.html';

    var data = await NetWork.getRequest(url);
    try {
      // Attempt to decode the JSON response
      Map<String, dynamic> map = data;
      // print('map:$map');
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

    Constants.eventBus.fire(BeanEvent<NewsList>(postId, NewsList.fromJson(postId, data)));
  }


  // 请求自定义表单页
  getClassForm() async {
    String id= 'FCD1770616154007597058';
    String url =
        'https://www.rpasys.com/api/rpasys-form/page/last/publish/$id';

    var data = await NetWork.getRequest(url);
    try {
      // Attempt to decode the JSON response
      Map<String, dynamic> map = data;
      print('map:$map');
      // Assuming BeanEvent is properly defined and NewsList has a fromJson method that matches this usage
      Constants.eventBus
          .fire(BeanEvent('FCD1770616154007597058', ClassForm.fromJson(id, map)));
    } catch (e) {
      // print('Error decoding JSON or firing event: $e');
      // Handle the error or notify the user
    }
  }

  submitClassForm(String aClass, String name, String age) async{
    String url =
        'https://www.rpasys.com/api/rpasys-logic/logic/engine/execute/v2?flowName=%E7%8F%AD%E7%BA%A7%E6%96%B0%E5%A2%9E';

    late Map<String, dynamic> body = {
      'flowCode':"lf1770747249889992706",
      'params':{
        'modelId':{
          's01d2a6b66a1c254d77a06d28ea88d38bb0':age,
          's010f2595bacf1f4e9cb007d380ce847b3d':aClass,
          's019dffb19273c24116a8ccfd5db099d246':name,
        }
      }
    };

    var data = await NetWork.postRequest(url, body:body);
    try {
      // Attempt to decode the JSON response
      Map<String, dynamic> map = data;
      print('map:$map');
      // Assuming BeanEvent is properly defined and NewsList has a fromJson method that matches this usage
      // Constants.eventBus
      //     .fire(BeanEvent('FCD1770616154007597058', ClassForm.fromJson(id, map)));
    } catch (e) {
      // print('Error decoding JSON or firing event: $e');
      // Handle the error or notify the user
    }
  }


  
  // 请求班级列表页
  getClassList(int page) async {
   late Map<String, dynamic> queryParams = {
      'flowCode':"lf1770746336338526209",
      'params':{
        '_current_':page,
        '_size_':50
      }
    };
    String url =
        'https://www.rpasys.com/api/rpasys-logic/logic/engine/execute/v2?flowName=%E7%8F%AD%E7%BA%A7%E5%88%97%E8%A1%A8%E6%9F%A5%E8%AF%A2';

    var data = await NetWork.getRequest(url,queryParams:queryParams);
    try {
      // Attempt to decode the JSON response
      Map<String, dynamic> map = data;
      print('map:$map');
      // Assuming BeanEvent is properly defined and NewsList has a fromJson method that matches this usage
      Constants.eventBus
          .fire(BeanEvent('lf1770746336338526209', ClassFormListModel.fromJson('lf1770746336338526209', map)));
    } catch (e) {
      // print('Error decoding JSON or firing event: $e');
      // Handle the error or notify the user
    }
  }
}
