import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_extractable.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_strategy.dart';

class ProgramParamToTextProcessor extends IStrategy {
  @override
  T execute<T>(IExtractable? arg) {
    var param = ContainerExtractor.extract<String>(arg!, 'Parameter');
    var t = {
      'street': 'Улица',
      'mobileOperator': 'Оператор',
      'currentLatitude': 'Широта',
      'currentLongitude': 'Долгота',
      'currentCellId': 'ID вышки',
      'latitude': 'Широта',
      'longitude': 'Долгота',
      'cellSignalStrength': 'Mощьность',
      'cellID': 'ID вышки',
      'currentDateTime': 'Дата',
    };
    return (t.keys.contains(param) ? t[param] : param) as T;
  }
}
