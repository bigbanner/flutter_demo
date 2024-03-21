import 'IEvent.dart';
import '../models/IModel.dart';

class BeanEvent<T extends IModel> extends IEvent {
  late T data;
  BeanEvent(super.id, T t) {
    this.data = t;
  }
}
