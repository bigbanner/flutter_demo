import '../IModel.dart';

class ClassFormListModel extends IModel {
  late String key;
  late DataModel data;
  late Object extraData;
  late String mainFlowCode;
  late String mainFlowName;
  late String requestId;
  
  ClassFormListModel.fromJson(String key, Map<String, dynamic> json) {
    if (json[key] != null) {
      this.key = key;
    }
    // data = json['data'];
     data = DataModel.fromJson(json['data']);
    extraData = json['extraData'];
    mainFlowCode = json['mainFlowCode'];
    mainFlowName = json['mainFlowName'];
    requestId = json['requestId'];
  }
}

class DataModel {
  late ListModel list;
   DataModel(
      {required this.list });

  DataModel.fromJson(Map<String, dynamic> json) {
    list = json['list'];
  }
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['list'] = list.toJson();
    
    return data;
  }
}

class ListModel {
   late String key;
  late List<RecordsItem> records=[];
  late String? countId;
  late int? current;
  late bool? hitCount;
  late int? pages;

  ListModel(
      {required this.records,
      this.countId,
      this.current,
      this.hitCount,
      this.pages,
  });

  ListModel.fromJson(Map<String, dynamic> json) {
    countId = json['countId'];
    hitCount = json['hitCount'];
    pages = json['pages'];
    if (json['records'] != null) {
      json['records'].forEach((v) {
        records.add(RecordsItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pages'] = pages;
    data['records'] = records.map((e) => e.toJson()).toList();
    data['countId'] = countId;
    data['hitCount'] = hitCount;
    return data;
  }
}

class RecordsItem {
  late String? app_code;
  late String?  company_id;
  late String? create_time;
  late String? create_user;
  late String? id;
  late int? is_deleted;
  late int? is_enabled;
  late int? process_status;
  late int? published_status;
  late String s01d2a6b66a1c254d77a06d28ea88d38bb0; //班级
  late String s010f2595bacf1f4e9cb007d380ce847b3d; //姓名
  late String s019dffb19273c24116a8ccfd5db099d246; // 年龄
  late String? tenant_id;
  late String? update_time;
  late String? update_user;
  late int? version;


  RecordsItem({
    this.app_code,
    this.company_id,
    this.create_time,
    this.create_user,
    this.is_deleted,
    this.is_enabled,
    this.process_status,
   required this.s01d2a6b66a1c254d77a06d28ea88d38bb0,
   required this.s010f2595bacf1f4e9cb007d380ce847b3d,
   required this.s019dffb19273c24116a8ccfd5db099d246,
    this.tenant_id,
    this.update_time,
    this.update_user,
    this.version

    });

  RecordsItem.fromJson(Map<String, dynamic> json) {
    app_code = json['app_code'];
    company_id = json['company_id'];
    create_time = json['create_time'];
    create_user = json['create_user'];
    is_deleted = json['is_deleted'];
    is_enabled = json['is_enabled'];
    process_status = json['process_status'];
    s01d2a6b66a1c254d77a06d28ea88d38bb0 = json['s01d2a6b66a1c254d77a06d28ea88d38bb0'];
    s010f2595bacf1f4e9cb007d380ce847b3d = json['s010f2595bacf1f4e9cb007d380ce847b3d'];
    s019dffb19273c24116a8ccfd5db099d246 = json['s019dffb19273c24116a8ccfd5db099d246'];
    tenant_id = json['tenant_id'];
    update_time = json['update_time'];
    update_user = json['update_user'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['app_code']=app_code;
    data['company_id']= company_id;
    data['create_time']=create_time;
    data['create_user']=create_user;
    data['is_deleted'] =is_deleted ;
    data['is_enabled'] =is_enabled;
    data['process_status'] =process_status;
    data['s01d2a6b66a1c254d77a06d28ea88d38bb0'] = s01d2a6b66a1c254d77a06d28ea88d38bb0;
    data['s010f2595bacf1f4e9cb007d380ce847b3d'] = s010f2595bacf1f4e9cb007d380ce847b3d;
    data['s019dffb19273c24116a8ccfd5db099d246'] = s019dffb19273c24116a8ccfd5db099d246;
    data['tenant_id'] =tenant_id;
    data['update_time'] = update_time;
    data['update_user'] =update_user;
    data['version'] =version;
    return data;
  }
}

