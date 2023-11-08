import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_extractable.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_strategy.dart';

class NeitralParamProcessor extends IStrategy{
  @override
  T execute<T>(IExtractable? arg) {
    return ContainerExtractor.extract<T>(arg!, 'Parameter');
  }
}