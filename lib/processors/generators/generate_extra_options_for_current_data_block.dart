import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/app/data_page/extra_option_line.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/container/default_container.dart';
import 'package:minprom_of_omsk_signal/global_values/constant_container.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_extractable.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_strategy.dart';

/// Generate List<Widget> by params
///
/// Args is IExtendable container with [String] key *ParamsValueMap* and [Map<String, dynamic>] value
class GenerateExtraOptionsForCurrentDataBlock extends IStrategy {
  /// Get arg as IExtendable container, with one [String] key *ParamsValueMap* and value of type [Map<String, dynamic>]
  /// ```dart
  /// var x = DefaultContainer({'ParamsValueMap': {'Район': 'ул. Пушкина, д. Калатушкина'}})
  /// GenerateExtraOptionsForCurrentDataBlock.execute<List>(x)
  /// ```
  @override
  T execute<T>(IExtractable? arg) {
    Map paramsValuesMap = ContainerExtractor.extract<Map>(arg!, 'ParamsValueMap');
    Map<String, IStrategy> keyProcessors = ContainerExtractor.extract<Map<String, IStrategy>>(constantContainer, 'ExtraOptionsKeyProcessorMap');
    Map<String, IStrategy> valuesProcessors = ContainerExtractor.extract<Map<String, IStrategy>>(constantContainer, 'ExtraOptionsValueProcessorMap');
    
    List<Widget> extraOptionsList = [];
    for (var element in paramsValuesMap.keys) {
      extraOptionsList.add(
        AnotherOptionRow(
          paramName: keyProcessors[element]!.execute(DefaultContainer({'Parameter': element})).toString(),
          paramValue: valuesProcessors[element]!.execute(DefaultContainer({'Parameter': paramsValuesMap[element]})).toString()
        )
      );
    }
    return extraOptionsList as T;
  }
}
