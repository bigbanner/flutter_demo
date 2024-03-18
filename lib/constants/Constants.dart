import 'package:event_bus/event_bus.dart';

class Constants {
  //网易新闻
  static const int TYPE_NET_NETEASE_NEWS = 1;
  //新浪新闻
  static const int TYPE_NET_SINA_NEWS = 2;
  //天气查询
  static const int TYPE_NET_WEATHER_INFO = 3;
  //全局的event_bus
  static final EventBus eventBus = EventBus();

  // ______________________________________________
  //当前的主题模式
  static int currentTheme = dayTheme;
  //日间模式
  static const int dayTheme = 1;
  //夜间模式
  static const int nightTheme = 2;
  // ______________________________________________
}

class Strings {
  //APP标题
  static const String appTitle = '新闻';
  static const String newsDetail = '新闻详情';
  static const String projectAdress = '项目地址';

  static const String aboutTitle = '关于页面标题';

  //作者
  static const String author = '梅子';
}
