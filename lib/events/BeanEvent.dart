import 'IEvent.dart';
import '../models/IModel.dart';

class BeanEvent<T extends IModel> extends IEvent {
  late T data;
  BeanEvent(String id, T t) : super(id) {
    this.data = t;
  }
}
