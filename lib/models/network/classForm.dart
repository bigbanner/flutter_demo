import '../IModel.dart';

class ClassForm extends IModel {
  late String key;
  late ContentObj content;
  late int currentVersion;
  late int enabled;
  late String id;
  late String pageCode;
  late String pageName;
  late int pageStyle;
  late int pageType;

  List<ContentObj> datas = [];
  
  ClassForm.fromJson(String key, Map<String, dynamic> json) {
    if (json[key] != null) {
      this.key = key;
      json[key].forEach((v) {
        datas.add(ContentObj.fromJson(v));
      });
    }
  }
}

class ContentObj {
  late String? uuid;
  late List<ChildrenItem> children = [];

  ContentObj({this.uuid,required this.children});

  ContentObj.fromJson(Map<String, dynamic> json) {
    
    uuid = json['uuid'];
    if (json['children'] != null) {
      json['children'].forEach((v) {
        children.add(ChildrenItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['uuid'] = uuid;
    
    data['children'] = children.map((v) => v.toJson()).toList();
   
   
    return data;
  }
}

class ChildrenItem {
  late ConfigItem config;
  late String? type;
  late String? uuid;

  ChildrenItem(
      {required this.config,
      this.type,
      this.uuid,
     });

  ChildrenItem.fromJson(Map<String, dynamic> json) {
    config = json['config'];
    type = json['type'];
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['config'] = config;
    data['type'] = type;
    data['uuid'] = uuid;
    data['config'] = config;
    return data;
  }
}

class ConfigItem {
  late AttributeItem attribute;

  ConfigItem({required this.attribute});

  ConfigItem.fromJson(Map<String, dynamic> json) {
    attribute = json['attribute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['attribute'] = attribute;
    return data;
  }
}

class AttributeItem {
  late String label;
  late String title;

  AttributeItem({required this.label,required this.title});

  AttributeItem.fromJson(Map<String, dynamic> json) {
    label = json['label'];
     title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['label'] = label;
    data['title'] = title;
    return data;
  }
}
