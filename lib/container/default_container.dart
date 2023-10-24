import 'package:minprom_of_omsk_signal/interfaces/interface_extendable.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_extractable.dart';

class DefaultContainer implements IExtandable, IExtractable{
  late Map _container = {};

  DefaultContainer(Map container){
    _container = container;
  }

  @override
  void extend(Object key, Object value){
    _container[key] = value;
  }

  @override
  T extract<T>(Object key) {
    return _container[key];
  }

}