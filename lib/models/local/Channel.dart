import '../IModel.dart';

class Channel extends IModel {
  late String channelName;
  late String channelType;
  late String channelId;

  Channel({channelName, channelType, channelId});

  Channel.fromJson(Map<String, dynamic> json) {
    channelName = json['channel_name'];
    channelType = json['channel_type'];
    channelId = json['channel_id'];
  }
}
