import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_extractable.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_strategy.dart';

class CurrentParamsMapBuilder extends IStrategy {
  @override
  T execute<T>(IExtractable? arg) {
    var m = {
      'cellSignalStrength': ContainerExtractor.extract(valueContainer, 'cellSignalStrength'),
      'currentLongitude': ContainerExtractor.extract(valueContainer, 'currentLongitude'),
      'currentLatitude': ContainerExtractor.extract(valueContainer, 'currentLatitude'),
      'currentDateTime': DateTime.now().millisecondsSinceEpoch,
      'currentCellId': ContainerExtractor.extract(valueContainer, 'gsmCellTowerId'),
    };
    return m as T;
  }
}
