import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_extractable.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_strategy.dart';

class TimeProcessor extends IStrategy {
  @override
  T execute<T>(IExtractable? arg) {
    var p = ContainerExtractor.extract<int>(arg!, 'Parameter');
    var d = DateTime.fromMillisecondsSinceEpoch(p);
    return '${d.day}.${d.month > 9 ? d.month : "0${d.month}"}.${d.year}' as T;
  }
}
