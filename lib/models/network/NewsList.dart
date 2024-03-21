import '../IModel.dart';

class NewsList extends IModel {
  late String key;
  List<News> datas = [];
  NewsList.fromJson(String key, Map<String, dynamic> json) {
    if (json[key] != null) {
      this.key = key;
      json[key].forEach((v) {
        datas.add(News.fromJson(v));
      });
    }
  }
}

class News {
  late String? template;
  late String? skipID;
  late String? lmodify;
  late String? postid;
  late String? source;
  late String? title;
  late String? mtime;
  late int? hasImg;
  late String? topicBackground;
  late String? digest;
  late String? photosetID;
  late String? boardid;
  late String? alias;
  late int? hasAD;
  late String? imgsrc;
  late String? ptime;
  late String? daynum;
  late int? hasHead;
  late int? imgType;
  late int? order;
  late int? votecount;
  late bool? hasCover;
  late String? docid;
  late String? tname;
  late int? priority;
  late List<Ads> ads = [];
  late String? ename;
  late int? replyCount;
  late Picinfo? picinfo;
  late int? imgsum;
  late bool? hasIcon;
  late String? skipType;
  late String? category;
  late String? cid;
  late String url;
  late String? url_3w;

  News(
      {this.template,
      this.skipID,
      this.lmodify,
      this.postid,
      this.source,
      this.title,
      this.mtime,
      this.hasImg,
      this.topicBackground,
      this.digest,
      this.photosetID,
      this.boardid,
      this.alias,
      this.hasAD,
      this.imgsrc,
      this.ptime,
      this.daynum,
      this.hasHead,
      this.imgType,
      this.order,
      this.votecount,
      this.hasCover,
      this.docid,
      this.tname,
      this.priority,
      required this.ads,
      this.ename,
      this.replyCount,
      this.picinfo,
      this.imgsum,
      this.hasIcon,
      this.skipType,
      this.category,
      this.cid,
      required this.url,
      this.url_3w});

  News.fromJson(Map<String, dynamic> json) {
    template = json['template'];
    skipID = json['skipID'];
    lmodify = json['lmodify'];
    postid = json['postid'];
    source = json['source'];
    title = json['title'];
    mtime = json['mtime'];
    hasImg = json['hasImg'];
    topicBackground = json['topic_background'];
    digest = json['digest'];
    photosetID = json['photosetID'];
    boardid = json['boardid'];
    alias = json['alias'];
    hasAD = json['hasAD'];
    imgsrc = json['imgsrc'];
    ptime = json['ptime'];
    daynum = json['daynum'];
    hasHead = json['hasHead'];
    imgType = json['imgType'];
    order = json['order'];
    votecount = json['votecount'];
    hasCover = json['hasCover'];
    docid = json['docid'];
    tname = json['tname'];
    priority = json['priority'];
    if (json['ads'] != null) {
      // List<Ads> ads = []; // Correct for Dart 2.12 and later
      json['ads'].forEach((v) {
        ads.add(Ads.fromJson(v));
      });
    }
    ename = json['ename'];
    replyCount = json['replyCount'];
    picinfo =
        json['picinfo'] != null ? Picinfo.fromJson(json['picinfo']) : null;
    imgsum = json['imgsum'];
    hasIcon = json['hasIcon'];
    skipType = json['skipType'];
    category = json['category'];
    cid = json['cid'];
    url = json['url'];
    url_3w = json['url_3w'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['template'] = template;
    data['skipID'] = skipID;
    data['lmodify'] = lmodify;
    data['postid'] = postid;
    data['source'] = source;
    data['title'] = title;
    data['mtime'] = mtime;
    data['hasImg'] = hasImg;
    data['topic_background'] = topicBackground;
    data['digest'] = digest;
    data['photosetID'] = photosetID;
    data['boardid'] = boardid;
    data['alias'] = alias;
    data['hasAD'] = hasAD;
    data['imgsrc'] = imgsrc;
    data['ptime'] = ptime;
    data['daynum'] = daynum;
    data['hasHead'] = hasHead;
    data['imgType'] = imgType;
    data['order'] = order;
    data['votecount'] = votecount;
    data['hasCover'] = hasCover;
    data['docid'] = docid;
    data['tname'] = tname;
    data['priority'] = priority;
    data['ads'] = ads.map((v) => v.toJson()).toList();
    data['ename'] = ename;
    data['replyCount'] = replyCount;
    if (picinfo != null) {
      data['picinfo'] = picinfo?.toJson();
    }
    data['imgsum'] = imgsum;
    data['hasIcon'] = hasIcon;
    data['skipType'] = skipType;
    data['category'] = category;
    data['cid'] = cid;
    return data;
  }
}

class Ads {
  late String? subtitle;
  late String? skipType;
  late String? skipID;
  late String? tag;
  late String? title;
  late String? imgsrc;
  late String? url;

  Ads(
      {this.subtitle,
      this.skipType,
      this.skipID,
      this.tag,
      this.title,
      this.imgsrc,
      this.url});

  Ads.fromJson(Map<String, dynamic> json) {
    subtitle = json['subtitle'];
    skipType = json['skipType'];
    skipID = json['skipID'];
    tag = json['tag'];
    title = json['title'];
    imgsrc = json['imgsrc'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subtitle'] = subtitle;
    data['skipType'] = skipType;
    data['skipID'] = skipID;
    data['tag'] = tag;
    data['title'] = title;
    data['imgsrc'] = imgsrc;
    data['url'] = url;
    return data;
  }
}

class Picinfo {
  late String firstImage;

  Picinfo({required this.firstImage});

  Picinfo.fromJson(Map<String, dynamic> json) {
    firstImage = json['firstImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['firstImage'] = firstImage;
    return data;
  }
}
